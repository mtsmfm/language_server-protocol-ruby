module LanguageServer
  module Protocol
    module Interface
      #
      # @since 3.18.0
      #
      class ClientFoldingRangeOptions
        def initialize(collapsed_text: nil)
          @attributes = {}

          @attributes[:collapsedText] = collapsed_text if collapsed_text

          @attributes.freeze
        end

        #
        # If set, the client signals that it supports setting collapsedText on
        # folding ranges to display custom labels instead of the default text.
        #
        # @since 3.17.0
        #
        # @return [boolean]
        def collapsed_text
          attributes.fetch(:collapsedText)
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
