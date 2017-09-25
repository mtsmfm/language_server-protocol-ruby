module LanguageServer
  module Protocol
    module Interface
      class DocumentFormattingParams < Base
        attr_required_keys :text_document, :options
      end
    end
  end
end
