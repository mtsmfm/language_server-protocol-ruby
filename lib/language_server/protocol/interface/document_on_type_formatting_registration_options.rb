module LanguageServer
  module Protocol
    module Interface
      class DocumentOnTypeFormattingRegistrationOptions < TextDocumentRegistrationOptions
        define_attribute_methods(:first_trigger_character, :more_trigger_character)

        def initialize(document_selector:, first_trigger_character:, more_trigger_character: nil)
          super
        end
      end
    end
  end
end
