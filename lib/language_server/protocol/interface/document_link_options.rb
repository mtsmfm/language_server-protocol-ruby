module LanguageServer
  module Protocol
    module Interface
      #
      # Document link options
      #
      class DocumentLinkOptions < Base
        attr_optional_keys :resolve_provider
      end
    end
  end
end
