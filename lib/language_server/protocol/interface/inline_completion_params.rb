module LanguageServer
  module Protocol
    module Interface
      #
      # A parameter literal used in inline completion requests.
      #
      # @since 3.18.0
      #
      class InlineCompletionParams
        def initialize(context:, text_document:, position:, work_done_token: nil)
          @attributes = {}

          @attributes[:context] = context
          @attributes[:textDocument] = text_document
          @attributes[:position] = position
          @attributes[:workDoneToken] = work_done_token if work_done_token

          @attributes.freeze
        end

        #
        # Additional information about the context in which inline completions were
        # requested.
        #
        # @return [InlineCompletionContext]
        def context
          attributes.fetch(:context)
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
        # An optional token that a server can use to report work done progress.
        #
        # @return [ProgressToken]
        def work_done_token
          attributes.fetch(:workDoneToken)
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
