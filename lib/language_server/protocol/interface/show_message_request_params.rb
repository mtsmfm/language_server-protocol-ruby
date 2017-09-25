module LanguageServer
  module Protocol
    module Interface
      class ShowMessageRequestParams < Base
        define_attribute_methods(:type, :message, :actions)

        def initialize(type:, message:, actions: nil)
          super
        end
      end
    end
  end
end
