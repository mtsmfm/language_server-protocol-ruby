module LanguageServer
  module Protocol
    module Interface
      class CodeLensRegistrationOptions < Base
        define_attribute_methods(:resolve_provider)

        def initialize(resolve_provider: nil)
          super
        end
      end
    end
  end
end
