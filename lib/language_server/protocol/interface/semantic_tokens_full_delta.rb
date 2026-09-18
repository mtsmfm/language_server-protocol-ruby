module LanguageServer
  module Protocol
    module Interface
      #
      # Semantic tokens options to support deltas for full documents
      #
      # @since 3.18.0
      #
      class SemanticTokensFullDelta
        def initialize(delta: nil)
          @attributes = {}

          @attributes[:delta] = delta unless delta.nil?

          @attributes.freeze
        end

        #
        # The server supports deltas for full documents.
        #
        # @return [boolean]
        def delta
          attributes.fetch(:delta)
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
