module LanguageServer
  module Protocol
    module Interface
      class ExecuteCommandParams < Base
        attr_required_keys :command
        attr_optional_keys :arguments
      end
    end
  end
end
