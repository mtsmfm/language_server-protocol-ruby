module LanguageServer
  module Protocol
    module Interface
      class Base
        def self.define_attribute_method(key)
          lower_camel_case = Protocol::Utils.to_lower_camerize(key.to_s)

          class_eval(<<-METHOD, __FILE__, __LINE__ + 1)
            def #{key}; @attributes[:#{lower_camel_case}] end
          METHOD
        end

        attr_reader :attributes

        def initialize(attributes = {})
          @attributes = attributes.each_with_object({}) { |(key, value), h|
            next if value.nil?

            # attributes[:text_document] => h[:textDocument]
            lower_camel_case = LanguageServer::Protocol::Utils.to_lower_camerize(key.to_s)
            h[lower_camel_case.to_sym] = value
          }.freeze
        end

        def to_json(*args)
          attributes.to_json(*args)
        end
      end
    end
  end
end
