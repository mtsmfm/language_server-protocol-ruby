module LanguageServer
  module Protocol
    module Interface
      class UnregistrationParams < Base
        attr_required_keys :unregisterations
      end
    end
  end
end
