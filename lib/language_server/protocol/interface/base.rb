module LanguageServer
  module Protocol
    module Interface
      DEFAULT_ATTRIBUTES = {
        jsonrpc: '2.0'
      }.freeze

      class Base
        def self.define_attribute_method(key)
          lower_camel_case = LanguageServer::Protocol::Utils.to_lower_camerize(key.to_s)

          class_eval(<<-METHOD, __FILE__, __LINE__ + 1)
            def #{key}; @attributes[:#{lower_camel_case}] end
          METHOD
        end

        def self.required_keys
          @required_keys ||= []
        end

        def self.optional_keys
          @optional_keys ||= []
        end

        def self.attr_required_keys(*keys)
          keys.each { |key| define_attribute_method(key) }
          @required_keys = required_keys + keys
        end

        def self.attr_optional_keys(*keys)
          keys.each { |key| define_attribute_method(key) }
          @optional_keys = optional_keys + keys
        end

        attr_reader :attributes

        def initialize(attributes = {})
          reject_extra_keys!(attributes.keys)

          @attributes = (self.class.required_keys + self.class.optional_keys).each_with_object(DEFAULT_ATTRIBUTES.dup) { |key, h|
            next unless attributes.key?(key)

            # attributes[:text_document] => h[:textDocument]
            lower_camel_case = LanguageServer::Protocol::Utils.to_lower_camerize(key.to_s)
            h[lower_camel_case.to_sym] = attributes[key]
          }.freeze

          validate_required_keys!
        end

        def to_json(*args)
          attributes.to_json(*args)
        end

        private

        def reject_extra_keys!(keys)
          allowed_keys = self.class.required_keys + self.class.optional_keys
          extra_keys = keys - allowed_keys

          raise ArgumentError, "extra keys given: #{extra_keys}. allowed keys are #{allowed_keys}" unless extra_keys.empty?
        end

        def validate_required_keys!
          required_keys = self.class.required_keys.map { |key| LanguageServer::Protocol::Utils.to_lower_camerize(key.to_s).to_sym }
          missing_keys = required_keys - @attributes.keys
          raise ArgumentError, "missing required key: #{missing_keys}" unless missing_keys.empty?
        end
      end
    end
  end
end
