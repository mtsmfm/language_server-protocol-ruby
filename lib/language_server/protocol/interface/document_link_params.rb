module LanguageServer
  module Protocol
    module Interface
      class DocumentLinkParams < Base
        #
        # The document to provide document links for.
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
