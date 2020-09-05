module LanguageServer
  module Protocol
    module Interface
      #
      # Represents a folding range.
      #
      class FoldingRange
        def initialize(start_line:, start_character: nil, end_line:, end_character: nil, kind: nil)
          @attributes = {}

          @attributes[:startLine] = start_line
          @attributes[:startCharacter] = start_character if start_character
          @attributes[:endLine] = end_line
          @attributes[:endCharacter] = end_character if end_character
          @attributes[:kind] = kind if kind

          @attributes.freeze
        end

        #
        # The zero-based line number from where the folded range starts.
        #
        # @return [number]
        def start_line
          attributes.fetch(:startLine)
        end

        #
        # The zero-based character offset from where the folded range starts. If not defined, defaults to the length of the start line.
        #
        # @return [number]
        def start_character
          attributes.fetch(:startCharacter)
        end

        #
        # The zero-based line number where the folded range ends.
        #
        # @return [number]
        def end_line
          attributes.fetch(:endLine)
        end

        #
        # The zero-based character offset before the folded range ends. If not defined, defaults to the length of the end line.
        #
        # @return [number]
        def end_character
          attributes.fetch(:endCharacter)
        end

        #
        # Describes the kind of the folding range such as `comment` or `region`. The kind
        # is used to categorize folding ranges and used by commands like 'Fold all comments'. See
        # [FoldingRangeKind](#FoldingRangeKind) for an enumeration of standardized kinds.
        #
        # @return [string]
        def kind
          attributes.fetch(:kind)
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
