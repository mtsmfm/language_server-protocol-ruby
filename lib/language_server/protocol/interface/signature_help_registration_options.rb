module LanguageServer
  module Protocol
    module Interface
      class SignatureHelpRegistrationOptions < TextDocumentRegistrationOptions
        define_attribute_methods(:trigger_characters)

        def initialize(document_selector:, trigger_characters: nil)
          super
        end
      end
    end
  end
end
