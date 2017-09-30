module LanguageServer
  module Protocol
    module Interface
      class CodeLensRegistrationOptions < Base
        #
        # Code lens has a resolve provider as well.
        #
        # @return [boolean]
        define_attribute_method :resolve_provider

        def initialize(resolve_provider: nil)
          super
        end
      end
    end
  end
end
