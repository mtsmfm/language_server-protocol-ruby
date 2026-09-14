module LanguageServer
  module Protocol
    module Interface
      #
      # An inline completion item represents a text snippet that is proposed inline to complete text that is being typed.
      #
      # @since 3.18.0
      #
      class InlineCompletionItem
        def initialize(insert_text:, filter_text: nil, range: nil, command: nil)
          @attributes = {}

          @attributes[:insertText] = insert_text
          @attributes[:filterText] = filter_text if filter_text
          @attributes[:range] = range if range
          @attributes[:command] = command if command

          @attributes.freeze
        end

        #
        # The text to replace the range with. Must be set.
        #
        # @return [string | StringValue]
        def insert_text
          attributes.fetch(:insertText)
        end

        #
        # A text that is used to decide if this inline completion should be shown. When `falsy` the {@link InlineCompletionItem.insertText} is used.
        #
        # @return [string]
        def filter_text
          attributes.fetch(:filterText)
        end

        #
        # The range to replace. Must begin and end on the same line.
        #
        # @return [Range]
        def range
          attributes.fetch(:range)
        end

        #
        # An optional {@link Command} that is executed *after* inserting this completion.
        #
        # @return [Command]
        def command
          attributes.fetch(:command)
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
