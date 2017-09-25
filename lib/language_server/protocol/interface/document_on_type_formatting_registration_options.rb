module LanguageServer
  module Protocol
    module Interface
      class DocumentOnTypeFormattingRegistrationOptions < Base
        attr_required_keys :first_trigger_character
        attr_optional_keys :more_trigger_character
      end
    end
  end
end
