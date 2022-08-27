module LanguageServer
  module Protocol
    module Interface
      #
      # An event describing a change to a text document. If only a text is provided
      # it is considered to be the full content of the document.
      #
      class TextDocumentContentChangeEvent
        def initialize(range:, range_length: nil, text:)
          @attributes = {}

          @attributes[:range] = range
          @attributes[:rangeLength] = range_length if range_length
          @attributes[:text] = text

          @attributes.freeze
        end

        #
        # The range of the document that changed.
        #
        # @return [Range]
        def range
          attributes.fetch(:range)
        end

        #
        # The optional length of the range that got replaced.
        #
        # @deprecated use range instead.
        #
        # @return [uinteger | nil]
        def range_length
          attributes.fetch(:rangeLength)
        end

        #
        # The new text for the provided range.
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
