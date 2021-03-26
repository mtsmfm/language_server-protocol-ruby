module LanguageServer
  module Protocol
    module Interface
      class SemanticTokensRangeParams < PartialResultParams
        def initialize(partial_result_token: nil, text_document:, range:)
          @attributes = {}

          @attributes[:partialResultToken] = partial_result_token if partial_result_token
          @attributes[:textDocument] = text_document
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
        # The range the semantic tokens are requested for.
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
