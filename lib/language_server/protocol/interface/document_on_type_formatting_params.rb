module LanguageServer
  module Protocol
    module Interface
      class DocumentOnTypeFormattingParams
        def initialize(text_document:, position:, ch:, options:)
          @attributes = {}

          @attributes[:textDocument] = text_document
          @attributes[:position] = position
          @attributes[:ch] = ch
          @attributes[:options] = options

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
        # The position inside the text document.
        #
        # @return [Position]
        def position
          attributes.fetch(:position)
        end

        #
        # The character that has been typed.
        #
        # @return [string]
        def ch
          attributes.fetch(:ch)
        end

        #
        # The format options.
        #
        # @return [FormattingOptions]
        def options
          attributes.fetch(:options)
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
