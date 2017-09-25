module LanguageServer
  module Protocol
    module Interface
      #
      # Descibe options to be used when registered for text document change events.
      #
      class TextDocumentChangeRegistrationOptions < Base
        attr_required_keys :sync_kind
      end
    end
  end
end
