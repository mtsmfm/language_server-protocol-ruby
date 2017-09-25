module LanguageServer
  module Protocol
    module Interface
      class DidChangeConfigurationParams < Base
        define_attribute_methods(:settings)

        def initialize(settings:)
          super
        end
      end
    end
  end
end
