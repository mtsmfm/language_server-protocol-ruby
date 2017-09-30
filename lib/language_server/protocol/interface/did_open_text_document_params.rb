module LanguageServer
  module Protocol
    module Interface
      class DidOpenTextDocumentParams < Base
        #
        # The document that was opened.
        #
        # @return [TextDocumentItem]
        define_attribute_method :text_document

        def initialize(text_document:)
          super
        end
      end
    end
  end
end
