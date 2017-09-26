module LanguageServer
  module Protocol
    module Interface
      #
      # General parameters to unregister a capability.
      #
      class Unregistration < Base
        #
        # The id used to unregister the request or notification. Usually an id
        # provided during the register request.
        #
        # @return [string]
        define_attribute_method :id

        #
        # The method / capability to unregister for.
        #
        # @return [string]
        define_attribute_method :method

        def initialize(id:, method:)
          super
        end
      end
    end
  end
end
