module LanguageServer
  module Protocol
    module Interface
      #
      # Represents a collection of [completion items](#CompletionItem) to be presented
      # in the editor.
      #
      class CompletionList < Base
        attr_required_keys :is_incomplete, :items
      end
    end
  end
end
