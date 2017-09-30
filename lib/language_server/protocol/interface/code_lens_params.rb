module LanguageServer
  module Protocol
    module Interface
      class CodeLensParams < Base
        #
        # The document to request code lens for.
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
