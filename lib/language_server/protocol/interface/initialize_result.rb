module LanguageServer
  module Protocol
    module Interface
      class InitializeResult < Base
        define_attribute_methods(:capabilities)

        def initialize(capabilities:)
          super
        end
      end
    end
  end
end
