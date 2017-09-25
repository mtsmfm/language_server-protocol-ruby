module LanguageServer
  module Protocol
    module Interface
      class RegistrationParams < Base
        attr_required_keys :registrations
      end
    end
  end
end
