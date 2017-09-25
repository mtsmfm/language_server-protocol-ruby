module LanguageServer
  module Protocol
    module Interface
      #
      # Represents a collection of [completion items](#CompletionItem) to be presented
      # in the editor.
      #
      class CompletionList < Base
        define_attribute_methods(:is_incomplete, :items)

        def initialize(is_incomplete:, items:)
          super
        end
      end
    end
  end
end
