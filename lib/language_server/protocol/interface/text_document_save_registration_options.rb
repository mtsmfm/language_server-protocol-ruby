module LanguageServer
  module Protocol
    module Interface
      class TextDocumentSaveRegistrationOptions < TextDocumentRegistrationOptions
        define_attribute_methods(:include_text)

        def initialize(document_selector:, include_text: nil)
          super
        end
      end
    end
  end
end
