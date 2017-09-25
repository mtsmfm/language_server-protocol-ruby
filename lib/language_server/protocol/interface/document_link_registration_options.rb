module LanguageServer
  module Protocol
    module Interface
      class DocumentLinkRegistrationOptions < Base
        attr_required_keys :resolve_provider
      end
    end
  end
end
