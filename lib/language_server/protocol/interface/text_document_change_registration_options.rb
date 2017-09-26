module LanguageServer
  module Protocol
    module Interface
      #
      # Descibe options to be used when registered for text document change events.
      #
      class TextDocumentChangeRegistrationOptions < Base
        #
        # How documents are synced to the server. See TextDocumentSyncKind.Full
        # and TextDocumentSyncKindIncremental.
        #
        # @return [number]
        define_attribute_method :sync_kind

        def initialize(sync_kind:)
          super
        end
      end
    end
  end
end
