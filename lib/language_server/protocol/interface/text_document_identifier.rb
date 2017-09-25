module LanguageServer
  module Protocol
    module Interface
      class TextDocumentIdentifier < Base
        attr_required_keys :uri
      end
    end
  end
end
