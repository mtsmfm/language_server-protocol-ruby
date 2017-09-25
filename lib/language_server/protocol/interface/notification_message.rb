module LanguageServer
  module Protocol
    module Interface
      class NotificationMessage < Message
        define_attribute_methods(:method, :params)

        def initialize(method:, params: nil, jsonrpc: Message::VERSION)
          super
        end
      end
    end
  end
end
