module LanguageServer
  module Protocol
    module Interface
      class UnregistrationParams < Base
        # @return [Unregistration[]]
        define_attribute_method :unregisterations

        def initialize(unregisterations:)
          super
        end
      end
    end
  end
end
