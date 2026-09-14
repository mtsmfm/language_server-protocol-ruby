module LanguageServer
  module Protocol
    module Interface
      #
      # @since 3.18.0
      #
      class ClientCompletionItemResolveOptions
        def initialize(properties:)
          @attributes = {}

          @attributes[:properties] = properties

          @attributes.freeze
        end

        #
        # The properties that a client can resolve lazily.
        #
        # @return [string[]]
        def properties
          attributes.fetch(:properties)
        end

        attr_reader :attributes

        def to_hash
          attributes
        end

        def to_json(*args)
          to_hash.to_json(*args)
        end
      end
    end
  end
end
