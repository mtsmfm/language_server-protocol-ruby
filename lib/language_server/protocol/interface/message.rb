module LanguageServer
  module Protocol
    module Interface
      class Message < Base
        define_attribute_methods(:jsonrpc)

        def initialize(jsonrpc:)
          super
        end
      end
    end
  end
end
