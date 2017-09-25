module LanguageServer
  module Protocol
    module Interface
      class ClientCapabilities < Base
        attr_optional_keys :workspace, :text_document, :experimental
      end
    end
  end
end
