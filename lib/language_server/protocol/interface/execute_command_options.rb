module LanguageServer
  module Protocol
    module Interface
      #
      # Execute command options.
      #
      class ExecuteCommandOptions < Base
        #
        # The commands to be executed on the server
        #
        # @return [string[]]
        define_attribute_method :commands

        def initialize(commands:)
          super
        end
      end
    end
  end
end
