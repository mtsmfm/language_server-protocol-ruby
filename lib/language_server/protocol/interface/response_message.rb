module LanguageServer
  module Protocol
    module Interface
      class ResponseMessage < Base
        #
        # The request id.
        #
        # @return [string | number]
        define_attribute_method :id

        #
        # The result of a request. This can be omitted in
        # the case of an error.
        #
        # @return [any]
        define_attribute_method :result

        #
        # The error object in case a request fails.
        #
        # @return [ResponseError<any>]
        define_attribute_method :error

        def initialize(id:, result: nil, error: nil)
          super
        end
      end
    end
  end
end
