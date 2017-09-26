module LanguageServer
  module Protocol
    module Interface
      class CancelParams < Base
        #
        # The request id to cancel.
        #
        # @return [string | number]
        define_attribute_method :id

        def initialize(id:)
          super
        end
      end
    end
  end
end
