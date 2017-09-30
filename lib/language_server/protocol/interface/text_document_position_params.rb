module LanguageServer
  module Protocol
    module Interface
      class TextDocumentPositionParams < Base
        #
        # The text document.
        #
        # @return [TextDocumentIdentifier]
        define_attribute_method :text_document

        #
        # The position inside the text document.
        #
        # @return [Position]
        define_attribute_method :position

        def initialize(text_document:, position:)
          super
        end
      end
    end
  end
end
