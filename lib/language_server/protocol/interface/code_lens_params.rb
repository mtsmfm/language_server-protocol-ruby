module LanguageServer
  module Protocol
    module Interface
      class CodeLensParams < PartialResultParams
        def initialize(partial_result_token: nil, text_document:)
          @attributes = {}

          @attributes[:partialResultToken] = partial_result_token if partial_result_token
          @attributes[:textDocument] = text_document

          @attributes.freeze
        end

        #
        # The document to request code lens for.
        #
        # @return [TextDocumentIdentifier]
        def text_document
          attributes.fetch(:textDocument)
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
