module LanguageServer
  module Protocol
    module Interface
      #
      # @since 3.18.0
      #
      class ClientSemanticTokensRequestFullDelta
        def initialize(delta: nil)
          @attributes = {}

          @attributes[:delta] = delta unless delta.nil?

          @attributes.freeze
        end

        #
        # The client will send the `textDocument/semanticTokens/full/delta` request if
        # the server provides a corresponding handler.
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
