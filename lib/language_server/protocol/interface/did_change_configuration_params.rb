module LanguageServer
  module Protocol
    module Interface
      class DidChangeConfigurationParams < Base
        attr_required_keys :settings
      end
    end
  end
end
