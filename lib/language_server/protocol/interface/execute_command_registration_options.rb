module LanguageServer
  module Protocol
    module Interface
      #
      # Execute command registration options.
      #
      class ExecuteCommandRegistrationOptions < Base
        attr_required_keys :commands
      end
    end
  end
end
