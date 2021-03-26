module LanguageServer
  module Protocol
    module Interface
      class CallHierarchyOutgoingCallsParams < PartialResultParams
        def initialize(partial_result_token: nil, item:)
          @attributes = {}

          @attributes[:partialResultToken] = partial_result_token if partial_result_token
          @attributes[:item] = item

          @attributes.freeze
        end

        # @return [CallHierarchyItem]
        def item
          attributes.fetch(:item)
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
