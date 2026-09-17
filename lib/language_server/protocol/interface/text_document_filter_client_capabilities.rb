module LanguageServer
  module Protocol
    module Interface
      class TextDocumentFilterClientCapabilities
        def initialize(relative_pattern_support: nil)
          @attributes = {}

          @attributes[:relativePatternSupport] = relative_pattern_support unless relative_pattern_support.nil?

          @attributes.freeze
        end

        #
        # The client supports Relative Patterns.
        #
        # @since 3.18.0
        #
        # @return [boolean]
        def relative_pattern_support
          attributes.fetch(:relativePatternSupport)
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
