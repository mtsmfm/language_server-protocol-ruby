module LanguageServer
  module Protocol
    module Interface
      #
      # Execute command registration options.
      #
      class ExecuteCommandRegistrationOptions < Base
        define_attribute_methods(:commands)

        def initialize(commands:)
          super
        end
      end
    end
  end
end
