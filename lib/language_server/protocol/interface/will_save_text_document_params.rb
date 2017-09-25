module LanguageServer
  module Protocol
    module Interface
      #
      # The parameters send in a will save text document notification.
      #
      class WillSaveTextDocumentParams < Base
        attr_required_keys :text_document, :reason
      end
    end
  end
end
