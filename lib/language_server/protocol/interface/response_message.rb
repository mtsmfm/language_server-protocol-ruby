module LanguageServer
  module Protocol
    module Interface
      class ResponseMessage < Base
        attr_required_keys :id
        attr_optional_keys :result, :error
      end
    end
  end
end
