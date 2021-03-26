module LanguageServer
  module Protocol
    module Interface
      class CompletionParams < PartialResultParams
        def initialize(partial_result_token: nil, context: nil)
          @attributes = {}

          @attributes[:partialResultToken] = partial_result_token if partial_result_token
          @attributes[:context] = context if context

          @attributes.freeze
        end

        #
        # The completion context. This is only available if the client specifies
        # to send this using the client capability
        # `completion.contextSupport === true`
        #
        # @return [CompletionContext]
        def context
          attributes.fetch(:context)
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
