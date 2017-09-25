module LanguageServer
  module Protocol
    module Interface
      class DidSaveTextDocumentParams < Base
        define_attribute_methods(:text_document, :text)

        def initialize(text_document:, text: nil)
          super
        end
      end
    end
  end
end
