module LanguageServer
  module Protocol
    module Interface
      class TextDocumentPositionParams < Base
        attr_required_keys :text_document, :position
      end
    end
  end
end
