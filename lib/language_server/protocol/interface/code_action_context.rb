module LanguageServer
  module Protocol
    module Interface
      #
      # Contains additional diagnostic information about the context in which
      # a code action is run.
      #
      class CodeActionContext < Base
        attr_required_keys :diagnostics
      end
    end
  end
end
