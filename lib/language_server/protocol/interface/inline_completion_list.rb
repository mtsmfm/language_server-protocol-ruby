module LanguageServer
  module Protocol
    module Interface
      #
      # Represents a collection of {@link InlineCompletionItem inline completion items} to be presented in the editor.
      #
      # @since 3.18.0
      #
      class InlineCompletionList
        def initialize(items:)
          @attributes = {}

          @attributes[:items] = items

          @attributes.freeze
        end

        #
        # The inline completion items
        #
        # @return [InlineCompletionItem[]]
        def items
          attributes.fetch(:items)
        end

        attr_reader :attributes

        def to_hash
          attributes
        end

        def to_json(*args)
          to_hash.to_json(*args)
        end
      end
    end
  end
end
