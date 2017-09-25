module LanguageServer
  module Protocol
    module Interface
      class Message < Base
        VERSION = '2.0'

        define_attribute_methods(:jsonrpc)

        def initialize(jsonrpc: VERSION)
          super
        end
      end
    end
  end
end
