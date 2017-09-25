module LanguageServer
  module Protocol
    module Interface
      class ExecuteCommandParams < Base
        define_attribute_methods(:command, :arguments)

        def initialize(command:, arguments: nil)
          super
        end
      end
    end
  end
end
