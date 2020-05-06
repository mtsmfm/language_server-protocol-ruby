module LanguageServer
  module Protocol
    module Interface
      class ResponseMessage < Message
        def initialize(jsonrpc:, id:, result: nil, error: nil)
          @attributes = {}

          @attributes[:jsonrpc] = jsonrpc
          @attributes[:id] = id
          @attributes[:result] = result if result
          @attributes[:error] = error if error

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
        # The result of a request. This can be omitted in
        # the case of an error.
        #
        # @return [any]
        def result
          attributes.fetch(:result)
        end

        #
        # The error object in case a request fails.
        #
        # @return [ResponseError<any>]
        def error
          attributes.fetch(:error)
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
