module LanguageServer
  module Protocol
    module Interface
      class RequestMessage < Base
        #
        # The request id.
        #
        # @return [string | number]
        define_attribute_method :id

        #
        # The method to be invoked.
        #
        # @return [string]
        define_attribute_method :method

        #
        # The method's params.
        #
        # @return [any]
        define_attribute_method :params

        def initialize(id:, method:, params: nil)
          super
        end
      end
    end
  end
end
