module LanguageServer
  module Protocol
    module Interface
      #
      # Describes the currently selected completion item.
      #
      # @since 3.18.0
      #
      class SelectedCompletionInfo
        def initialize(range:, text:)
          @attributes = {}

          @attributes[:range] = range
          @attributes[:text] = text

          @attributes.freeze
        end

        #
        # The range that will be replaced if this completion item is accepted.
        #
        # @return [Range]
        def range
          attributes.fetch(:range)
        end

        #
        # The text the range will be replaced with if this completion is accepted.
        #
        # @return [string]
        def text
          attributes.fetch(:text)
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
