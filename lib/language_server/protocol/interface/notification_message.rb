module LanguageServer
  module Protocol
    module Interface
      class NotificationMessage < Base
        #
        # The method to be invoked.
        #
        # @return [string]
        define_attribute_method :method

        #
        # The notification's params.
        #
        # @return [any]
        define_attribute_method :params

        def initialize(method:, params: nil)
          super
        end
      end
    end
  end
end
