module LanguageServer
  module Protocol
    module Interface
      class ShowMessageRequestParams < Base
        attr_required_keys :type, :message
        attr_optional_keys :actions
      end
    end
  end
end
