module LanguageServer
  module Protocol
    module Interface
      #
      # Completion options.
      #
      class CompletionOptions < Base
        attr_optional_keys :resolve_provider, :trigger_characters
      end
    end
  end
end
