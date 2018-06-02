module LanguageServer
  module Protocol
    module Interface
      class RequestMessage < Message
        def initialize(jsonrpc:, id:, method:, params: nil)
          @attributes = {}

          @attributes[:id] = id
          @attributes[:method] = method
          @attributes[:params] = params if params

          @attributes.freeze
        end

        #
        # The request id.
        #
        # @return [string | number]
        def id
          attributes.fetch(:id)
        end

        #
        # The method to be invoked.
        #
        # @return [string]
        def method
          attributes.fetch(:method)
        end

        #
        # The method's params.
        #
        # @return [object | any[]]
        def params
          attributes.fetch(:params)
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
