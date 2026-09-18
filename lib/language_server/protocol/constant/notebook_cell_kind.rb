module LanguageServer
  module Protocol
    module Constant
      #
      # A notebook cell kind.
      #
      # @since 3.17.0
      #
      module NotebookCellKind
        #
        # A markup-cell is formatted source that is used for display.
        #
        MARKUP = 1
        #
        # A code-cell is source code.
        #
        CODE = 2
      end
    end
  end
end
