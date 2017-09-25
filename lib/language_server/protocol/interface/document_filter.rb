module LanguageServer
  module Protocol
    module Interface
      class DocumentFilter < Base
        attr_optional_keys :language, :scheme, :pattern
      end
    end
  end
end
