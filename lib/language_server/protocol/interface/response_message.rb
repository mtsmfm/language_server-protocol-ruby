module LanguageServer
  module Protocol
    module Interface
      class ResponseMessage < Message
        define_attribute_methods(:id, :result, :error)

        def initialize(id:, result: nil, error: nil, jsonrpc: Message::VERSION)
          super
        end
      end
    end
  end
end
