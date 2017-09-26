module LanguageServer
  module Protocol
    module Interface
      #
      # Represents a collection of [completion items](#CompletionItem) to be presented
      # in the editor.
      #
      class CompletionList < Base
        #
        # This list it not complete. Further typing should result in recomputing
        # this list.
        #
        # @return [boolean]
        define_attribute_method :is_incomplete

        #
        # The completion items.
        #
        # @return [CompletionItem[]]
        define_attribute_method :items

        def initialize(is_incomplete:, items:)
          super
        end
      end
    end
  end
end
