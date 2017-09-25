module LanguageServer
  module Protocol
    module Interface
      class CodeLensRegistrationOptions < TextDocumentRegistrationOptions
        define_attribute_methods(:resolve_provider)

        def initialize(document_selector:, resolve_provider: nil)
          super
        end
      end
    end
  end
end
