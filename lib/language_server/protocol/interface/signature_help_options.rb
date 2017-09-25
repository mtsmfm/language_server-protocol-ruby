module LanguageServer
  module Protocol
    module Interface
      #
      # Signature help options.
      #
      class SignatureHelpOptions < Base
        attr_optional_keys :trigger_characters
      end
    end
  end
end
