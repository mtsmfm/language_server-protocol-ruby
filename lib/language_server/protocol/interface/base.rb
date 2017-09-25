module LanguageServer
  module Protocol
    module Interface
      DEFAULT_ATTRIBUTES = {
        jsonrpc: '2.0'
      }.freeze

      class Base
        def self.define_attribute_method(key)
          class_eval <<-METHOD, __FILE__, __LINE__ + 1
            def #{key}; @attributes[:#{key}] end
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
          validate_attr_keys!(attributes)

          @attributes = (self.class.required_keys + self.class.optional_keys).each_with_object(DEFAULT_ATTRIBUTES.dup) do |key, h|
            h[key] = attributes[key] if attributes.key?(key)
          end

          @attributes.freeze

          validate_required_keys!
        end

        def to_json(*args)
          attributes.to_json(*args)
        end

        private

        def validate_attr_keys!(attributes)
          attr_keys = self.class.required_keys + self.class.optional_keys
          extra_keys = attributes.keys - attr_keys

          raise ArgumentError, "extra keys given: #{extra_keys}. allowed keys are #{attr_keys}" unless extra_keys.empty?
        end

        def validate_required_keys!
          missing_keys = self.class.required_keys - @attributes.keys
          raise ArgumentError, "missing required key: #{missing_keys}" unless missing_keys.empty?
        end
      end
    end
  end
end
