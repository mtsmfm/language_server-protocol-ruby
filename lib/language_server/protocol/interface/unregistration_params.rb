module LanguageServer
  module Protocol
    module Interface
      class UnregistrationParams < Base
        define_attribute_methods(:unregisterations)

        def initialize(unregisterations:)
          super
        end
      end
    end
  end
end
