module LanguageServer
  module Protocol
    module Interface
      class CancelParams < Base
        attr_required_keys :id
      end
    end
  end
end
