module LanguageServer
  module Protocol
    module Interface
      class DidChangeTextDocumentParams < Base
        define_attribute_methods(:text_document, :content_changes)

        def initialize(text_document:, content_changes:)
          super
        end
      end
    end
  end
end
