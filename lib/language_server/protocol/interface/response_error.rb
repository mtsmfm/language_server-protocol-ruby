module LanguageServer
  module Protocol
    module Interface
      class ResponseError < Base
        attr_required_keys :code, :message
        attr_optional_keys :data
      end
    end
  end
end
