module LanguageServer
  module Protocol
    module Interface
      class PartialResultParams
        def initialize(partial_result_token: nil)
          @attributes = {}

          @attributes[:partialResultToken] = partial_result_token unless partial_result_token.nil?

          @attributes.freeze
        end

        #
        # An optional token that a server can use to report partial results (e.g. streaming) to
        # the client.
        #
        # @return [ProgressToken]
        def partial_result_token
          attributes.fetch(:partialResultToken)
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
