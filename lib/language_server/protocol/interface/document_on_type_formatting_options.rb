module LanguageServer
  module Protocol
    module Interface
      #
      # Format document on type options
      #
      class DocumentOnTypeFormattingOptions < Base
        attr_required_keys :first_trigger_character
        attr_optional_keys :more_trigger_character
      end
    end
  end
end
