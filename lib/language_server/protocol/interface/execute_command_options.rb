module LanguageServer
  module Protocol
    module Interface
      #
      # Execute command options.
      #
      class ExecuteCommandOptions < Base
        define_attribute_methods(:commands)

        def initialize(commands:)
          super
        end
      end
    end
  end
end
