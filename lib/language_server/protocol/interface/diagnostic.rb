module LanguageServer
  module Protocol
    module Interface
      class Diagnostic < Base
        attr_required_keys :range, :message
        attr_optional_keys :severity, :code, :source
      end
    end
  end
end
