module LanguageServer
  module Protocol
    module Interface
      class CodeLensRegistrationOptions < Base
        attr_optional_keys :resolve_provider
      end
    end
  end
end
