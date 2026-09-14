module LanguageServer
  module Protocol
    module Interface
      #
      # Result of the `workspace/textDocumentContent` request.
      #
      # @since 3.18.0
      #
      class TextDocumentContentResult
        def initialize(text:)
          @attributes = {}

          @attributes[:text] = text

          @attributes.freeze
        end

        #
        # The text content of the text document. Please note, that the content of
        # any subsequent open notifications for the text document might differ
        # from the returned content due to whitespace and line ending
        # normalizations done on the client
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
