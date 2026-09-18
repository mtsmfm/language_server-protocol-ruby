module LanguageServer
  module Protocol
    module Interface
      #
      # @since 3.18.0
      #
      class TextDocumentContentChangeWholeDocument
        def initialize(text:)
          @attributes = {}

          @attributes[:text] = text

          @attributes.freeze
        end

        #
        # The new text of the whole document.
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
