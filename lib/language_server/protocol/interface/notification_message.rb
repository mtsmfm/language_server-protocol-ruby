module LanguageServer
  module Protocol
    module Interface
      class NotificationMessage < Base
        attr_required_keys :method
        attr_optional_keys :params
      end
    end
  end
end
