module LanguageServer
  module Protocol
    module Interface
      class TextDocumentRegistrationOptions < Base
        #
        # A document selector to identify the scope of the registration. If set to null
        # the document selector provided on the client side will be used.
        #
        # @return [DocumentFilter[]]
        define_attribute_method :document_selector

        def initialize(document_selector:)
          super
        end
      end
    end
  end
end
