module LanguageServer
  module Protocol
    module Constant
      #
      # Defines how values from a set of defaults and an individual item will be
      # merged.
      #
      # @since 3.18.0
      #
      module ApplyKind
        #
        # The value from the individual item (if provided and not `null`) will be
        # used instead of the default.
        #
        REPLACE = 1
        #
        # The value from the item will be merged with the default.
        #
        # The specific rules for mergeing values are defined against each field
        # that supports merging.
        #
        MERGE = 2
      end
    end
  end
end
