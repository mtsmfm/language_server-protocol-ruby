module LanguageServer
  module Protocol
    module Interface
      class Message < Base
        attr_required_keys :jsonrpc
      end
    end
  end
end
