module LanguageServer
  module Protocol
    module Interface
      class ReferenceParams < Base
        attr_required_keys :context
      end
    end
  end
end
