module LanguageServer
  module Protocol
    module Interface
      #
      # Execute command options.
      #
      class ExecuteCommandOptions < Base
        attr_required_keys :commands
      end
    end
  end
end
