module LanguageServer
  module Protocol
    module Interface
      #
      # Describe options to be used when registering for text document change events.
      #
      class TextDocumentChangeRegistrationOptions < TextDocumentRegistrationOptions
        def initialize(document_selector:, sync_kind:)
          @attributes = {}

          @attributes[:documentSelector] = document_selector
          @attributes[:syncKind] = sync_kind

          @attributes.freeze
        end

        #
        # How documents are synced to the server. See TextDocumentSyncKind.Full
        # and TextDocumentSyncKind.Incremental.
        #
        # @return [TextDocumentSyncKind]
        def sync_kind
          attributes.fetch(:syncKind)
        end

        attr_reader :attributes

        def to_hash
          attributes
        end

        def to_json(*args)
          to_hash.to_json(*args)
        end
      end
    end
  end
end
