module LanguageServer
  module Protocol
    module Interface
      #
      # @since 3.18.0
      #
      class ClientSemanticTokensRequestOptions
        def initialize(range: nil, full: nil)
          @attributes = {}

          @attributes[:range] = range unless range.nil?
          @attributes[:full] = full unless full.nil?

          @attributes.freeze
        end

        #
        # The client will send the `textDocument/semanticTokens/range` request if
        # the server provides a corresponding handler.
        #
        # @return [boolean | { ; }]
        def range
          attributes.fetch(:range)
        end

        #
        # The client will send the `textDocument/semanticTokens/full` request if
        # the server provides a corresponding handler.
        #
        # @return [boolean | ClientSemanticTokensRequestFullDelta]
        def full
          attributes.fetch(:full)
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
