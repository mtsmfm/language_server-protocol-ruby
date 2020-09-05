module LanguageServer
  module Protocol
    module Interface
      class ReferenceParams < PartialResultParams
        def initialize(partial_result_token: nil, context:)
          @attributes = {}

          @attributes[:partialResultToken] = partial_result_token if partial_result_token
          @attributes[:context] = context

          @attributes.freeze
        end

        # @return [ReferenceContext]
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
