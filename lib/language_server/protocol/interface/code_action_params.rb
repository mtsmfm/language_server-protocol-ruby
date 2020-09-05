module LanguageServer
  module Protocol
    module Interface
      #
      # Params for the CodeActionRequest
      #
      class CodeActionParams < PartialResultParams
        def initialize(partial_result_token: nil, text_document:, range:, context:)
          @attributes = {}

          @attributes[:partialResultToken] = partial_result_token if partial_result_token
          @attributes[:textDocument] = text_document
          @attributes[:range] = range
          @attributes[:context] = context

          @attributes.freeze
        end

        #
        # The document in which the command was invoked.
        #
        # @return [TextDocumentIdentifier]
        def text_document
          attributes.fetch(:textDocument)
        end

        #
        # The range for which the command was invoked.
        #
        # @return [Range]
        def range
          attributes.fetch(:range)
        end

        #
        # Context carrying additional information.
        #
        # @return [CodeActionContext]
        def context
          attributes.fetch(:context)
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
