module LanguageServer
  module Protocol
    module Interface
      class SignatureHelpRegistrationOptions < Base
        attr_optional_keys :trigger_characters
      end
    end
  end
end
