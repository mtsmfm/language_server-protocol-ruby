module LanguageServer
  module Protocol
    module Constant
      #
      # Symbol tags are extra annotations that tweak the rendering of a symbol.
      #
      # @since 3.16
      #
      module SymbolTag
        #
        # Render a symbol as obsolete, usually using a strike-out.
        #
        DEPRECATED = 1
      end
    end
  end
end
