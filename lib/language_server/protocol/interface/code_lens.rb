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
        define_attribute_methods(:range, :command, :data)

        def initialize(range:, command: nil, data: nil)
          super
        end
      end
    end
  end
end
