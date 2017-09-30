module LanguageServer
  module Protocol
    module Interface
      #
      # A code lens represents a command that should be shown along with
      # source text, like the number of references, a way to run tests, etc.
      #
      # A code lens is _unresolved_ when no command is associated to it. For performance
      # reasons the creation of a code lens and resolving should be done in two stages.
      #
      class CodeLens < Base
        #
        # The range in which this code lens is valid. Should only span a single line.
        #
        # @return [Range]
        define_attribute_method :range

        #
        # The command this code lens represents.
        #
        # @return [Command]
        define_attribute_method :command

        #
        # A data entry field that is preserved on a code lens item between
        # a code lens and a code lens resolve request.
        #
        # @return [any]
        define_attribute_method :data

        def initialize(range:, command: nil, data: nil)
          super
        end
      end
    end
  end
end
