module LanguageServer
  module Protocol
    module Interface
      class DocumentOnTypeFormattingParams < Base
        attr_required_keys :text_document, :position, :ch, :options
      end
    end
  end
end
