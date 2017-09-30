module LanguageServer
  module Protocol
    module Interface
      class RegistrationParams < Base
        # @return [Registration[]]
        define_attribute_method :registrations

        def initialize(registrations:)
          super
        end
      end
    end
  end
end
