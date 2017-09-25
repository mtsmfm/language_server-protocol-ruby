module LanguageServer
  module Protocol
    module Interface
      class TextDocumentPositionParams < Base
        define_attribute_methods(:text_document, :position)

        def initialize(text_document:, position:)
          super
        end
      end
    end
  end
end
