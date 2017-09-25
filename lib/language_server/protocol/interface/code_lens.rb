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
        attr_required_keys :range
        attr_optional_keys :command, :data
      end
    end
  end
end
