module LanguageServer
  module Protocol
    module Interface
      class ShowMessageParams < Base
        attr_required_keys :type, :message
      end
    end
  end
end
