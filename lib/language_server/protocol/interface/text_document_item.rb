module LanguageServer
  module Protocol
    module Interface
      class TextDocumentItem < Base
        attr_required_keys :uri, :language_id, :version, :text
      end
    end
  end
end
