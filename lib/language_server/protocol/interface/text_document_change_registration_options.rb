module LanguageServer
  module Protocol
    module Interface
      #
      # Descibe options to be used when registered for text document change events.
      #
      class TextDocumentChangeRegistrationOptions < Base
        define_attribute_methods(:sync_kind)

        def initialize(sync_kind:)
          super
        end
      end
    end
  end
end
