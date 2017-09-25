module LanguageServer
  module Protocol
    module Interface
      class TextDocumentRegistrationOptions < Base
        attr_required_keys :document_selector
      end
    end
  end
end
