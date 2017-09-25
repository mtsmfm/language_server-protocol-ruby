module LanguageServer
  module Protocol
    module Interface
      class TextDocumentEdit < Base
        define_attribute_methods(:text_document, :edits)

        def initialize(text_document:, edits:)
          super
        end
      end
    end
  end
end
