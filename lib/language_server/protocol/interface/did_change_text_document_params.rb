module LanguageServer
  module Protocol
    module Interface
      class DidChangeTextDocumentParams < Base
        attr_required_keys :text_document, :content_changes
      end
    end
  end
end
