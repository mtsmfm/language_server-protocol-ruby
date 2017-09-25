module LanguageServer
  module Protocol
    module Interface
      class InitializeResult < Base
        attr_required_keys :capabilities
      end
    end
  end
end
