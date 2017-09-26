module LanguageServer
  module Protocol
    module Interface
      class DocumentSymbolParams < Base
        #
        # The text document.
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
