module LanguageServer
  module Protocol
    module Interface
      #
      # Descibe options to be used when registered for text document change events.
      #
      class TextDocumentChangeRegistrationOptions < TextDocumentRegistrationOptions
        define_attribute_methods(:sync_kind)

        def initialize(sync_kind:, document_selector:)
          super
        end
      end
    end
  end
end
