module LanguageServer
  module Protocol
    module Interface
      class DocumentLinkRegistrationOptions < TextDocumentRegistrationOptions
        define_attribute_methods(:resolve_provider)

        def initialize(document_selector:, resolve_provider:)
          super
        end
      end
    end
  end
end
