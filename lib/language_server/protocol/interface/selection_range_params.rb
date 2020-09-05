module LanguageServer
  module Protocol
    module Interface
      class SelectionRangeParams < PartialResultParams
        def initialize(partial_result_token: nil, text_document:, positions:)
          @attributes = {}

          @attributes[:partialResultToken] = partial_result_token if partial_result_token
          @attributes[:textDocument] = text_document
          @attributes[:positions] = positions

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
        # The positions inside the text document.
        #
        # @return [Position[]]
        def positions
          attributes.fetch(:positions)
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
