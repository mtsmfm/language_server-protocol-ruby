module LanguageServer
  module Protocol
    module Interface
      class LogMessageParams < Base
        define_attribute_methods(:type, :message)

        def initialize(type:, message:)
          super
        end
      end
    end
  end
end
