module LanguageServer
  module Protocol
    module Interface
      #
      # General paramters to to regsiter for a capability.
      #
      class Registration < Base
        #
        # The id used to register the request. The id can be used to deregister
        # the request again.
        #
        # @return [string]
        define_attribute_method :id

        #
        # The method / capability to register for.
        #
        # @return [string]
        define_attribute_method :method

        #
        # Options necessary for the registration.
        #
        # @return [any]
        define_attribute_method :register_options

        def initialize(id:, method:, register_options: nil)
          super
        end
      end
    end
  end
end
