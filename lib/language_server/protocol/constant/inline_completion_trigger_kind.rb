module LanguageServer
  module Protocol
    module Constant
      #
      # Describes how an {@link InlineCompletionItemProvider inline completion provider} was triggered.
      #
      # @since 3.18.0
      #
      module InlineCompletionTriggerKind
        #
        # Completion was triggered explicitly by a user gesture.
        #
        INVOKED = 1
        #
        # Completion was triggered automatically while editing.
        #
        AUTOMATIC = 2
      end
    end
  end
end
