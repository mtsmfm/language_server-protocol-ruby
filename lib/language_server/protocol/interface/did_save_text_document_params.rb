module LanguageServer
  module Protocol
    module Interface
      class DidSaveTextDocumentParams < Base
        attr_required_keys :text_document
        attr_optional_keys :text
      end
    end
  end
end
