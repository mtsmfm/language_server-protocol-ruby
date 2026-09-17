require "erb"
require "json"
require "pathname"
require "fileutils"
require "open-uri"
require "active_support/core_ext/string"

LSP_VERSION = ENV.fetch("LSP_VERSION", "3.18")
LSP_REPO_REVISION = "9b3b38b4d0d78cda7e1aa6e4243b5c3e38a217bc"
ROOT_DIR = Pathname(__dir__) + ".."
PROTOCOL_DIR = ROOT_DIR / "lib" / "language_server" / "protocol"
SIG_DIR = ROOT_DIR / "sig" / "language_server" / "protocol"
SPEC_DIR = ROOT_DIR / "language-server-protocol" / "_specifications" / "lsp" / LSP_VERSION
META_MODEL_PATH = SPEC_DIR / "metaModel" / "metaModel.json"
META_MODEL_URL = "https://raw.githubusercontent.com/Microsoft/language-server-protocol/#{LSP_REPO_REVISION}/_specifications/lsp/#{LSP_VERSION}/metaModel/metaModel.json"
# The meta model describes LSP methods and payload types, but not the base
# JSON-RPC protocol types from specification.md.
BASE_PROTOCOL_INTERFACE_NAMES = %w[
  Message
  NotificationMessage
  RequestMessage
  ResponseError
  ResponseMessage
].freeze
# HoverResult is only an old example type from specification.md, not a real LSP
# 3.17 payload type. Keep it for compatibility until a future breaking release.
LEGACY_EXAMPLE_INTERFACE_NAMES = %w[HoverResult].freeze
# The meta model splits the error codes into two enumerations, but the
# `ErrorCodes` namespace in specification.md declares all of them and
# dependents reference the LSP specific codes through `ErrorCodes` as well
# (e.g. `ErrorCodes::REQUEST_FAILED`). Merge the values of the listed
# enumerations into the key enumeration to keep both spellings available.
MERGED_ENUMERATION_NAMES = {
  "ErrorCodes" => %w[LSPErrorCodes]
}.freeze

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
    cleanup("interface", preserved_names: LEGACY_EXAMPLE_INTERFACE_NAMES)

    @parser.interfaces.each do |interface|
      render_template(
        "interface.rb.erb",
        PROTOCOL_DIR / "interface" / "#{interface.name.underscore}.rb",
        interface.instance_eval { binding }
      )

      render_template(
        "interface.rbs.erb",
        SIG_DIR / "interface" / "#{interface.name.underscore}.rbs",
        interface.instance_eval { binding }
      )
    end

    names = loader_names("interface", @parser.interfaces.map(&:name))

    render_template(
      "interfaces.rb.erb",
      PROTOCOL_DIR / "interface.rb",
      names.instance_eval { binding }
    )
  end

  def render_constants
    cleanup("constant")

    @parser.constants.each do |constant|
      render_template(
        "constant.rb.erb",
        PROTOCOL_DIR / "constant" / "#{constant.name.underscore}.rb",
        constant.instance_eval { binding }
      )

      render_template(
        "constant.rbs.erb",
        SIG_DIR / "constant" / "#{constant.name.underscore}.rbs",
        constant.instance_eval { binding }
      )
    end

    names = loader_names("constant", @parser.constants.map(&:name))

    render_template(
      "constants.rb.erb",
      PROTOCOL_DIR / "constant.rb",
      names.instance_eval { binding }
    )
  end

  def render_template(template_name, path, b)
    template = ERB.new(File.read("#{__dir__}/templates/#{template_name}"), trim_mode: "-")
    FileUtils.mkdir_p(path.dirname)
    File.write(path, template.result(b))
  end

  def cleanup(type, preserved_names: [])
    allowed_ruby_files = preserved_names.map { |name| "#{name.underscore}.rb" }
    allowed_rbs_files = preserved_names.map { |name| "#{name.underscore}.rbs" }

    remove_unpreserved_files(PROTOCOL_DIR / type, "*.rb", allowed_ruby_files)
    remove_unpreserved_files(SIG_DIR / type, "*.rbs", allowed_rbs_files)
  end

  def remove_unpreserved_files(dir, pattern, allowed_files)
    Dir.glob((dir / pattern).to_s).each do |path|
      next if allowed_files.include?(File.basename(path))

      FileUtils.rm_f(path)
    end
  end

  def loader_names(type, generated_names)
    generated_names_by_path = generated_names.to_h { |name| [name.underscore, name] }
    existing_names = Dir.glob((PROTOCOL_DIR / type / "*.rb").to_s).map do |path|
      basename = File.basename(path, ".rb")
      generated_names_by_path.fetch(basename, basename.camelize)
    end

    (generated_names + existing_names).uniq.sort
  end
end

class Parser
  RESERVED_WORDS = %w[
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
  ].freeze

  TYPE_ALIAS_INTERFACE_ITEM_TYPES = %w[reference literal].freeze
  RBS_BASE_TYPES = {
    "string" => "String",
    "integer" => "Integer",
    "uinteger" => "Integer",
    "decimal" => "Numeric",
    "boolean" => "bool",
    "null" => "nil",
    "URI" => "String",
    "DocumentUri" => "String",
    "RegExp" => "String"
  }.freeze

  Interface = Struct.new(:name, :properties, :comment, keyword_init: true) do
    def params
      properties.map do |prop|
        default = " nil" if prop.optional
        "#{prop.method_name}:#{default}"
      end.join(", ")
    end

    def rbs_constructor_signature
      properties.map(&:rbs_constructor_keyword).join(", ")
    end
  end

  Property = Struct.new(:name, :type, :rbs_type, :optional, :comment, keyword_init: true) do
    def local_name
      if RESERVED_WORDS.include?(method_name)
        "binding.local_variable_get(:#{method_name})"
      else
        method_name
      end
    end

    def method_name
      name.underscore
    end

    def rbs_constructor_keyword
      "#{optional ? "?" : ""}#{method_name}: #{rbs_type}"
    end

    def return_type
      return type unless optional

      type.delete_suffix(" | nil")
    end

    def rbs_return_type
      return rbs_type unless optional
      return rbs_type if rbs_type == "untyped" || rbs_type == "nil"

      rbs_type.delete_suffix("?")
    end
  end

  Constant = Struct.new(:name, :values, :type, :comment, keyword_init: true)

  Value = Struct.new(:name, :value, :literal, :comment, keyword_init: true) do
    def serialized
      if literal
        value.inspect
      else
        value.to_s.underscore.upcase
      end
    end

    def constant_name
      name.underscore.upcase
    end
  end

  attr_reader :interfaces, :constants

  def initialize(schema, base_protocol_interfaces: [])
    @schema = schema
    @structures = schema.fetch(:structures)
    @enumerations = schema.fetch(:enumerations)
    @aliases = schema.fetch(:typeAliases)
    @lookup = (@structures + @enumerations + @aliases).to_h { |entry| [entry.fetch(:name), entry] }
    @interfaces = collect_interfaces(base_protocol_interfaces)
    @constants = collect_constants
  end

  private

  def collect_interfaces(base_protocol_interfaces)
    interfaces = collect_structure_interfaces + collect_type_alias_interfaces
    duplicate = interfaces.map(&:name) & base_protocol_interfaces.map(&:name)
    raise "Base protocol interfaces overlap with meta model: #{duplicate.join(", ")}" if duplicate.any?

    base_protocol_interfaces + interfaces
  end

  def collect_structure_interfaces
    @structures.reject do |entry|
      entry.fetch(:name).start_with?("_")
    end.map do |entry|
      Interface.new(
        name: entry.fetch(:name),
        properties: collect_structure_properties(entry),
        comment: comment(entry[:documentation])
      )
    end
  end

  def collect_type_alias_interfaces
    @aliases.filter do |entry|
      object_like_type_alias?(entry.fetch(:type))
    end.map do |entry|
      Interface.new(
        name: entry.fetch(:name),
        properties: collect_type_alias_properties(entry),
        comment: comment(entry[:documentation])
      )
    end
  end

  def collect_constants
    @enumerations.map do |entry|
      Constant.new(
        name: entry.fetch(:name),
        values: merged_values(entry),
        type: entry.fetch(:type),
        comment: comment(entry[:documentation])
      )
    end
  end

  def merged_values(entry)
    merged_names = MERGED_ENUMERATION_NAMES.fetch(entry.fetch(:name), [])
    values = merged_names.reduce(map_values(entry)) do |acc, name|
      merged = @enumerations.find { |e| e.fetch(:name) == name } or raise "Unknown enumeration: #{name}"
      raise "Cannot merge #{name} into #{entry.fetch(:name)}: type mismatch" if merged.fetch(:type) != entry.fetch(:type)

      acc + map_values(merged)
    end
    duplicate = values.map(&:name).tally.select { |_, count| count > 1 }.keys
    raise "Duplicate values in #{entry.fetch(:name)}: #{duplicate.join(", ")}" if duplicate.any?

    values
  end

  def map_values(entry)
    entry.fetch(:values).map do |value|
      Value.new(
        name: value.fetch(:name),
        value: value.fetch(:value),
        literal: literal_type?(entry.fetch(:type)),
        comment: comment(value[:documentation])
      )
    end
  end

  def map_properties(props)
    props.map do |prop|
      type = prop.fetch(:type)
      optional = prop[:optional] || false

      Property.new(
        name: prop.fetch(:name),
        type: type(type),
        rbs_type: rbs_type(type),
        optional: optional,
        comment: comment(prop[:documentation])
      )
    end
  end

  def collect_structure_properties(entry)
    collect_properties(entry[:properties] || [], *(entry[:extends] || []), *(entry[:mixins] || [])).uniq(&:name)
  end

  def collect_type_alias_properties(entry)
    collect_union_properties(entry.fetch(:type).fetch(:items))
  end

  def collect_properties(properties, *inherits)
    inherited = inherits.flat_map do |ref|
      properties_for_inherited_type(ref)
    end.compact

    map_properties(properties) + inherited
  end

  def collect_union_properties(items)
    property_groups = items.map { |item| properties_for_inherited_type(item) }
    names = property_groups.flat_map { |properties| properties.map(&:name) }.uniq

    names.map do |name|
      variants = property_groups.map { |properties| properties.find { |property| property.name == name } }
      present = variants.compact
      type = merge_protocol_types(present.map(&:type))
      rbs_type = present.map(&:rbs_type).uniq
      optional = variants.any?(&:nil?) || present.any?(&:optional)
      comments = present.map(&:comment).compact.uniq

      Property.new(
        name: name,
        type: optional ? type.delete_suffix(" | nil") : type,
        rbs_type: merge_rbs_types(rbs_type),
        optional: optional,
        comment: comments.join("\n#\n# --- OR ---\n#\n")
      )
    end
  end

  def properties_for_inherited_type(ref)
    case ref.fetch(:kind)
    when "reference"
      entry = @lookup[ref.fetch(:name)]
      return [] unless entry

      return collect_structure_properties(entry) if entry.key?(:properties)
      return collect_type_alias_properties(entry) if entry.key?(:type) && object_like_type_alias?(entry.fetch(:type))

      []
    when "literal"
      map_properties(ref.fetch(:value).fetch(:properties))
    else
      []
    end
  end

  def comment(string)
    return unless string
    string.lines.map do |line|
      "# #{line}".rstrip
    end.join("\n")
  end

  def type(type)
    case type.fetch(:kind)
    when "array"
      "#{type(type.fetch(:element))}[]"
    when "base", "reference"
      type.fetch(:name)
    when "or"
      type.fetch(:items).map { |item| type(item) }.uniq.join(" | ")
    when "literal"
      contents = type.fetch(:value).fetch(:properties).map do |prop|
        suffix = "?" if prop[:optional]
        "#{prop.fetch(:name)}#{suffix}: #{type(prop.fetch(:type))}"
      end.join("; ")
      "{ #{contents}; }"
    when "map"
      "#{type(type.fetch(:key))} => #{type(type.fetch(:value))}"
    when "stringLiteral"
      type.fetch(:value).inspect
    when "tuple"
      "[#{type.fetch(:items).map { |item| type(item) }.join(", ")}]"
    when "and"
      type.fetch(:items).map { |item| type(item) }.uniq.join(" & ")
    else
      raise "Unsupported type kind: #{type.fetch(:kind)}"
    end.gsub(/\bnull\b/, "nil")
  end

  def rbs_type(type)
    case type.fetch(:kind)
    when "array"
      "Array[#{rbs_type(type.fetch(:element))}]"
    when "base"
      RBS_BASE_TYPES.fetch(type.fetch(:name), "untyped")
    when "reference"
      "untyped"
    when "or"
      items = type.fetch(:items)
      nullable = items.any? { |item| item.fetch(:kind) == "base" && item.fetch(:name) == "null" }
      merged = merge_rbs_types(items.reject { |item| item.fetch(:kind) == "base" && item.fetch(:name) == "null" }.map { |item| rbs_type(item) })
      nullable && merged != "untyped" && merged != "nil" ? "#{merged}?" : merged
    when "stringLiteral"
      type.fetch(:value).inspect
    when "literal", "map", "tuple", "and"
      "untyped"
    else
      raise "Unsupported RBS type kind: #{type.fetch(:kind)}"
    end
  end

  def merge_rbs_types(types)
    types = types.uniq
    return "untyped" if types.empty? || types.include?("untyped")

    nullable = types.delete("nil")
    return "nil" if types.empty?
    return nullable ? "#{types.first}?" : types.first if types.one?

    union = "(#{types.join(" | ")})"
    nullable ? "#{union}?" : union
  end

  def merge_protocol_types(types)
    types.flat_map { |type| type.split(" | ") }.uniq.join(" | ")
  end

  def literal_type?(type)
    type.fetch(:kind) == "base" || type.fetch(:kind) == "stringLiteral"
  end

  def object_like_type_alias?(type)
    type.fetch(:kind) == "or" &&
      type.fetch(:items).all? { |item| object_like_type?(item) }
  end

  def object_like_type?(type)
    case type.fetch(:kind)
    when "literal"
      true
    when "reference"
      entry = @lookup[type.fetch(:name)]
      return false unless entry
      return true if entry.key?(:properties)

      entry.key?(:type) && object_like_type_alias?(entry.fetch(:type))
    else
      false
    end
  end
end

class BaseProtocolInterfaceParser
  INTERFACE_PATTERN = /
    ^interface\s+(?<name>[A-Za-z0-9_]+)
    (?:\s+extends\s+(?<extends>[A-Za-z0-9_,\s]+))?
    \s*\{\s*
    (?<body>.*?)
    ^\}
  /mx.freeze

  PROPERTY_PATTERN = /
    (?<doc>\/\*\*.*?\*\/\s*)?
    (?<name>[A-Za-z0-9_]+)(?<optional>\?)?
    \s*:\s*(?<type>[^;]+);
  /mx.freeze

  def initialize(spec_dir)
    @spec_path = spec_dir / "specification.md"
  end

  def parse
    entries = code_blocks.flat_map do |code|
      scan_matches(code, INTERFACE_PATTERN).filter_map do |match|
        next unless BASE_PROTOCOL_INTERFACE_NAMES.include?(match[:name])

        [
          match[:name],
          {
            extends: extends(match[:extends]),
            properties: properties(match[:body])
          }
        ]
      end
    end.to_h

    missing = BASE_PROTOCOL_INTERFACE_NAMES - entries.keys
    raise "Missing base protocol interfaces in #{@spec_path}: #{missing.join(", ")}" if missing.any?

    BASE_PROTOCOL_INTERFACE_NAMES.map do |name|
      Parser::Interface.new(
        name: name,
        properties: collect_properties(name, entries, []),
        comment: nil
      )
    end
  end

  private

  def collect_properties(name, entries, visited)
    raise "Circular base protocol interface inheritance: #{(visited + [name]).join(" -> ")}" if visited.include?(name)

    entry = entries.fetch(name)
    inherited = entry.fetch(:extends).flat_map do |parent|
      raise "Unsupported base protocol interface parent #{parent.inspect} for #{name}" unless entries.key?(parent)

      collect_properties(parent, entries, visited + [name])
    end

    inherited + entry.fetch(:properties)
  end

  def extends(raw_extends)
    return [] unless raw_extends

    raw_extends.split(",").map(&:strip).reject(&:empty?)
  end

  def properties(body)
    scan_matches(body, PROPERTY_PATTERN).map do |match|
      raw_type = match[:type].strip
      Parser::Property.new(
        name: match[:name],
        type: protocol_type(raw_type),
        rbs_type: rbs_type(raw_type),
        optional: !!match[:optional],
        comment: comment(clean_doc(match[:doc]&.sub(%r{\A/\*\*}, "")&.sub(%r{\*/\s*\z}, "")))
      )
    end
  end

  def protocol_type(raw_type)
    types = raw_type.split("|").map(&:strip).reject do |type|
      type == "null"
    end.map do |type|
      protocol_single_type(type)
    end

    return "any" if types.include?("any")

    types.uniq.sort_by { |type| protocol_type_order(type) }.join(" | ")
  end

  def protocol_single_type(type)
    case type
    when "integer", "uinteger", "decimal", "number"
      "number"
    when "string", "boolean", "object"
      type
    when "array", "LSPAny"
      "any"
    when *BASE_PROTOCOL_INTERFACE_NAMES
      type
    else
      raise "Unsupported base protocol type: #{type}"
    end
  end

  def protocol_type_order(type)
    %w[string number boolean object].index(type) || 100
  end

  def rbs_type(raw_type)
    tokens = raw_type.split("|").map(&:strip) - ["null"]
    return "untyped" if tokens.size != 1

    case tokens.first
    when "integer", "uinteger"
      "Integer"
    when "decimal", "number"
      "Numeric"
    when "string"
      "String"
    when "boolean"
      "bool"
    else
      "untyped"
    end
  end

  def code_blocks
    @spec_path.read.scan(/^```typescript\r?\n(.*?)(?:^```\r?\n|^```\r?\z)/m).flatten
  end

  def scan_matches(string, pattern)
    string.to_enum(:scan, pattern).map { Regexp.last_match }
  end

  def clean_doc(doc)
    return unless doc

    lines = doc.lines.map do |line|
      line.sub(/\A\s*\*\s?/, "").rstrip
    end

    lines.reject! { |line| line.match?(/\A\s*@[a-zA-Z]/) }
    lines.join("\n").gsub(/\n{3,}/, "\n\n").strip
  end

  def comment(string)
    return if string.nil? || string.empty?

    string.lines.map do |line|
      "# #{line}".rstrip
    end.join("\n")
  end
end

def read_schema
  if META_MODEL_PATH.file?
    puts "Reading schema from #{META_MODEL_PATH}..."
    META_MODEL_PATH.read
  else
    puts "Fetching schema from #{META_MODEL_URL}..."
    URI.open(META_MODEL_URL).read
  end
end

puts "Parsing schema..."
schema = JSON.parse(read_schema, symbolize_names: true)
base_protocol_interfaces = BaseProtocolInterfaceParser.new(SPEC_DIR).parse
parser = Parser.new(schema, base_protocol_interfaces: base_protocol_interfaces)
puts "Rendering files..."
Renderer.new(parser).render
puts "Done."
