module LanguageServer
  module Protocol
    module Interface
      class DidCloseTextDocumentParams < Base
        #
        # The document that was closed.
        #
        # @return [TextDocumentIdentifier]
        define_attribute_method :text_document

        def initialize(text_document:)
          super
        end
      end
    end
  end
end
