module LanguageServer
  module Protocol
    module Interface
      class RequestMessage < Message
        define_attribute_methods(:id, :method, :params)

        def initialize(id:, method:, params: nil, jsonrpc: Message::VERSION)
          super
        end
      end
    end
  end
end
