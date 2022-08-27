require "json"
require "pathname"
require "fileutils"
require "open-uri"
require "active_support/core_ext/string"

LSP_VERSION = "3.17"
LSP_REPO_REVISION = "98dfd44d349411c557127b7379c67b837bf1660c"
ROOT_DIR = Pathname(__dir__) + ".."
PROTOCOL_DIR = ROOT_DIR / "lib" / "language_server" / "protocol"
META_MODEL_URL = "https://raw.githubusercontent.com/Microsoft/language-server-protocol/#{LSP_REPO_REVISION}/_specifications/lsp/#{LSP_VERSION}/metaModel/metaModel.json"

class Renderer
  def initialize(parser)
    @parser = parser
  end

  def render
    render_interfaces
    render_constants
  end

  private

  def render_interfaces
    @parser.interfaces.each do |interface|
      render_template(
        "interface.rb.erb",
        PROTOCOL_DIR / "interface" / "#{interface.name.underscore}.rb",
        interface.__binding__
      )
    end

    names = @parser.interfaces.map(&:name).sort

    render_template(
      "interfaces.rb.erb",
      PROTOCOL_DIR / "interface.rb",
      names.__binding__
    )
  end

  def render_constants
    @parser.constants.each do |constant|
      render_template(
        "constant.rb.erb",
        PROTOCOL_DIR / "constant" / "#{constant.name.underscore}.rb",
        constant.__binding__
      )
    end

    names = @parser.constants.map(&:name).sort

    render_template(
      "constants.rb.erb",
      PROTOCOL_DIR / "constant.rb",
      names.__binding__
    )
  end

  def render_template(template_name, path, b)
    template = ERB.new(File.read("#{__dir__}/templates/#{template_name}"), trim_mode: "-")
    FileUtils.mkdir_p(path.dirname)
    File.write(path, template.result(b))
  end
end

class Parser
  RESERVED_WORDS= %w[
    __ENCODING__
    __LINE__
    __FILE__
    BEGIN
    END
    alias
    and
    begin
    break
    case
    class
    def
    defined?
    do
    else
    elsif
    end
    ensure
    false
    for
    if
    in
    module
    next
    nil
    not
    or
    redo
    rescue
    retry
    return
    self
    super
    then
    true
    undef
    unless
    until
    when
    while
    yield
  ]

  LITERAL_TYPE_NAMES = ["string", "integer", "uinteger"]
  TYPE_ALIAS_ITEM_TYPES = ["reference", "literal"]

  Interface = Struct.new(:name, :properties, :comment, keyword_init: true) do
    def params
      properties.map do |prop|
        debugger unless prop
        default = " nil" if prop.optional

        "#{prop.name.underscore}:#{default}"
      end.join(", ")
    end
  end

  Property = Struct.new(:name, :type, :optional, :comment, keyword_init: true) do
    def local_name
      if RESERVED_WORDS.include?(name)
        "binding.local_variable_get(:#{name.underscore})"
      else
        name.underscore
      end
    end

    def method_name
      name.underscore
    end
  end

  Constant = Struct.new(:name, :values, :type, :comment, keyword_init: true)

  Value = Struct.new(:name, :value, :literal, :comment, keyword_init: true) do
    def serialized
      if literal
        value.inspect
      else
        value.underscore.upcase
      end
    end
  end

  attr_reader :interfaces, :constants

  def initialize(schema)
    @schema = schema
    @structures = schema[:structures]
    @enumeration = schema[:enumerations]
    @aliases = schema[:typeAliases]
    @lookup = (@structures + @enumeration + @aliases).to_h { |entry| [entry[:name], entry] }
    @interfaces = collect_structure_interfaces + collect_type_alias_interfaces
    @constants = collect_constants
  end

  private

  def collect_structure_interfaces
    @structures.reject do |entry|
      entry[:name].start_with?("_")
    end.map do |entry|
      Interface.new(
        name: entry[:name],
        properties: collect_structure_properties(entry),
        comment: comment(entry[:documentation])
      )
    end
  end

  def collect_type_alias_interfaces
    @aliases.filter do |entry|
      entry[:type][:kind] == "or" &&
        entry[:type][:items].all? { |item| TYPE_ALIAS_ITEM_TYPES.include?(item[:kind]) }
    end.map do |entry|
      Interface.new(
        name: entry[:name],
        properties: collect_type_alias_properties(entry),
        comment: comment(entry[:documentation])
      )
    end
  end

  def collect_constants
    @enumeration.map do |entry|
      Constant.new(
        name: entry[:name],
        values: map_values(entry),
        type: entry[:type],
        comment: comment(entry[:documentation])
      )
    end
  end

  def map_values(entry)
    entry[:values].map do |value|
      str_value = value[:value].to_s

      Value.new(
        name: value[:name],
        value: value[:value],
        literal: LITERAL_TYPE_NAMES.include?(entry[:type][:name]),
        comment: comment(value[:documentation])
      )
    end
  end

  def map_properties(props)
    props.map do |prop|
      Property.new(
        name: prop[:name],
        type: type(prop[:type], optional: prop[:optional]),
        optional: prop[:optional],
        comment: comment(prop[:documentation])
      )
    end
  end

  def collect_structure_properties(entry)
    collect_properties(entry[:properties], *entry[:extends], *entry[:mixins]).uniq(&:name)
  end

  def collect_type_alias_properties(entry)
    collect_properties([], *entry[:type][:items]).uniq(&:name)
  end

  def collect_properties(properties, *inherits)
    inherited = inherits.flat_map do |ref|
      if ref[:name]
        entry = @lookup[ref[:name]]
        next unless entry
        if entry.key?(:type)
          collect_type_alias_properties(entry)
        else
          collect_structure_properties(entry)
        end
      else
        map_properties(ref[:value][:properties])
      end
    end.compact

    map_properties(properties) + inherited
  end

  def comment(string)
    return unless string
    string.lines.map do |line|
      "# #{line}".rstrip
    end.join("\n")
  end

  def type(type, optional: false)
    return_type = case type[:kind]
    when "array"
      "#{type(type[:element])}[]"
    when "base", "reference"
      type[:name]
    when "or"
      type[:items].map { |t| type(t) }.join(" | ")
    when "literal"
      contents = type[:value][:properties].map { |prop| "#{prop[:name]}:#{type(prop[:type])}" }.join(", ")
      "{ #{contents} }"
    when "map"
      "#{type(type[:key])} => #{type(type[:value])}"
    when "stringLiteral"
      %Q["#{type[:value]}"]
    when "tuple"
      type[:items].map { |t| type(t) }.join(", ")
    end

    require "pry"; binding.pry unless return_type
    return_type += " | nil" if optional && !return_type.include?("| null")
    return_type.gsub("| null", "| nil")
    return_type
  end
end

puts "Fetching schema..."
schema = JSON.parse(URI.open(META_MODEL_URL).read, symbolize_names: true)
puts "Parsing schema..."
parser = Parser.new(schema)
puts "Rendering files..."
Renderer.new(parser).render
puts "Done."

