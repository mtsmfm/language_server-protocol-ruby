module LanguageServer
  module Protocol
    module Interface
      #
      # Save options.
      #
      class SaveOptions < Base
        attr_optional_keys :include_text
      end
    end
  end
end
