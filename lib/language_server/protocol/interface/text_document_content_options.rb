module LanguageServer
  module Protocol
    module Interface
      #
      # Text document content provider options.
      #
      # @since 3.18.0
      #
      class TextDocumentContentOptions
        def initialize(schemes:)
          @attributes = {}

          @attributes[:schemes] = schemes

          @attributes.freeze
        end

        #
        # The schemes for which the server provides content.
        #
        # @return [string[]]
        def schemes
          attributes.fetch(:schemes)
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
