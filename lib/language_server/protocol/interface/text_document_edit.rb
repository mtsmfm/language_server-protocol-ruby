module LanguageServer
  module Protocol
    module Interface
      class TextDocumentEdit < Base
        attr_required_keys :text_document, :edits
      end
    end
  end
end
