module LanguageServer
  module Protocol
    module Interface
      class Command < Base
        #
        # Title of the command, like `save`.
        #
        # @return [string]
        define_attribute_method :title

        #
        # The identifier of the actual command handler.
        #
        # @return [string]
        define_attribute_method :command

        #
        # Arguments that the command handler should be
        # invoked with.
        #
        # @return [any[]]
        define_attribute_method :arguments

        def initialize(title:, command:, arguments: nil)
          super
        end
      end
    end
  end
end
