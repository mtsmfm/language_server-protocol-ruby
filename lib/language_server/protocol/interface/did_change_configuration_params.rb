module LanguageServer
  module Protocol
    module Interface
      class DidChangeConfigurationParams < Base
        #
        # The actual changed settings
        #
        # @return [any]
        define_attribute_method :settings

        def initialize(settings:)
          super
        end
      end
    end
  end
end
