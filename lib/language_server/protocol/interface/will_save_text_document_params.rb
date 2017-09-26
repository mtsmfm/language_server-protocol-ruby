module LanguageServer
  module Protocol
    module Interface
      #
      # The parameters send in a will save text document notification.
      #
      class WillSaveTextDocumentParams < Base
        #
        # The document that will be saved.
        #
        # @return [TextDocumentIdentifier]
        define_attribute_method :text_document

        #
        # The 'TextDocumentSaveReason'.
        #
        # @return [number]
        define_attribute_method :reason

        def initialize(text_document:, reason:)
          super
        end
      end
    end
  end
end
