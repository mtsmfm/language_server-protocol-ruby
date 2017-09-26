module LanguageServer
  module Protocol
    module Interface
      class Message < Base
        # @return [string]
        define_attribute_method :jsonrpc

        def initialize(jsonrpc:)
          super
        end
      end
    end
  end
end
