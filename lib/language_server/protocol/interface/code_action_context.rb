module LanguageServer
  module Protocol
    module Interface
      #
      # Contains additional diagnostic information about the context in which
      # a code action is run.
      #
      class CodeActionContext < Base
        #
        # An array of diagnostics.
        #
        # @return [Diagnostic[]]
        define_attribute_method :diagnostics

        def initialize(diagnostics:)
          super
        end
      end
    end
  end
end
