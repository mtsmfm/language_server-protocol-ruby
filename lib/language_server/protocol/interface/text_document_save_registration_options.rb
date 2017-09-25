module LanguageServer
  module Protocol
    module Interface
      class TextDocumentSaveRegistrationOptions < Base
        attr_optional_keys :include_text
      end
    end
  end
end
