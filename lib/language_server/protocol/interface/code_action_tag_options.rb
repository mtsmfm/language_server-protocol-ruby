module LanguageServer
  module Protocol
    module Interface
      #
      # @since 3.18.0
      #
      class CodeActionTagOptions
        def initialize(value_set:)
          @attributes = {}

          @attributes[:valueSet] = value_set

          @attributes.freeze
        end

        #
        # The tags supported by the client.
        #
        # @return [CodeActionTag[]]
        def value_set
          attributes.fetch(:valueSet)
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
