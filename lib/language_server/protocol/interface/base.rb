module LanguageServer
  module Protocol
    module Interface
      DEFAULT_ATTRIBUTES = {
        jsonrpc: '2.0'
      }.freeze

      class Base
        def self.required_keys
          @required_keys ||= []
        end

        def self.define_required_keys=(*keys)
          @required_keys = required_keys + keys
        end

        attr_reader :attributes

        def initialize(attributes = {})
          @attributes = self.class.required_keys.each_with_object(DEFAULT_ATTRIBUTES.dup) do |key, h|
            raise ArgumentError, "missing required key: #{key}" unless attributes.key?(key)
            h[key] = attributes[key]
          end

          @attributes.freeze
        end

        def to_json(*args)
          attributes.to_json(*args)
        end
      end
    end
  end
end
