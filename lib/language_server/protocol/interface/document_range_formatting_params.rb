module LanguageServer
  module Protocol
    module Interface
      class DocumentRangeFormattingParams < Base
        attr_required_keys :text_document, :range, :options
      end
    end
  end
end
