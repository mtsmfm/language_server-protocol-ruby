module LanguageServer
  module Protocol
    module Interface
      class ColorPresentationParams
        def initialize(text_document:, color:, range:)
          @attributes = {}

          @attributes[:textDocument] = text_document
          @attributes[:color] = color
          @attributes[:range] = range

          @attributes.freeze
        end

        #
        # The text document.
        #
        # @return [TextDocumentIdentifier]
        def text_document
          attributes.fetch(:textDocument)
        end

        #
        # The color information to request presentations for.
        #
        # @return [Color]
        def color
          attributes.fetch(:color)
        end

        #
        # The range where the color would be inserted. Serves as a context.
        #
        # @return [Range]
        def range
          attributes.fetch(:range)
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
