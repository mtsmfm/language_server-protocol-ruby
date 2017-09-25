module LanguageServer
  module Protocol
    module Interface
      class DidCloseTextDocumentParams < Base
        attr_required_keys :text_document
      end
    end
  end
end
