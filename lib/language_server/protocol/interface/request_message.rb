module LanguageServer
  module Protocol
    module Interface
      class RequestMessage < Base
        attr_required_keys :id, :method
        attr_optional_keys :params
      end
    end
  end
end
