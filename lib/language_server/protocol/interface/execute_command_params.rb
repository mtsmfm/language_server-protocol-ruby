module LanguageServer
  module Protocol
    module Interface
      class ExecuteCommandParams < Base
        #
        # The identifier of the actual command handler.
        #
        # @return [string]
        define_attribute_method :command

        #
        # Arguments that the command should be invoked with.
        #
        # @return [any[]]
        define_attribute_method :arguments

        def initialize(command:, arguments: nil)
          super
        end
      end
    end
  end
end
