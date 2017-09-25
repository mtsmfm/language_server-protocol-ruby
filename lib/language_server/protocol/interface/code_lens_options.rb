module LanguageServer
  module Protocol
    module Interface
      #
      # Code Lens options.
      #
      class CodeLensOptions < Base
        attr_optional_keys :resolve_provider
      end
    end
  end
end
