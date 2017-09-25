module LanguageServer
  module Protocol
    module Interface
      class CompletionRegistrationOptions < Base
        attr_optional_keys :trigger_characters, :resolve_provider
      end
    end
  end
end
