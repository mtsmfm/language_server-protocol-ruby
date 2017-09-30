module LanguageServer
  module Protocol
    module Interface
      class DidSaveTextDocumentParams < Base
        #
        # The document that was saved.
        #
        # @return [TextDocumentIdentifier]
        define_attribute_method :text_document

        #
        # Optional the content when saved. Depends on the includeText value
        # when the save notifcation was requested.
        #
        # @return [string]
        define_attribute_method :text

        def initialize(text_document:, text: nil)
          super
        end
      end
    end
  end
end
