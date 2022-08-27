module LanguageServer
  module Protocol
    module Constant
      #
      # A set of predefined range kinds.
      #
      module FoldingRangeKind
        #
        # Folding range for a comment
        #
        COMMENT = "comment"
        #
        # Folding range for an import or include
        #
        IMPORTS = "imports"
        #
        # Folding range for a region (e.g. `#region`)
        #
        REGION = "region"
      end
    end
  end
end
