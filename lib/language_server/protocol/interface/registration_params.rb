module LanguageServer
  module Protocol
    module Interface
      class RegistrationParams < Base
        define_attribute_methods(:registrations)

        def initialize(registrations:)
          super
        end
      end
    end
  end
end
