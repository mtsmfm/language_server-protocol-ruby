module LanguageServer
  module Protocol
    module Interface
      #
      # Code Lens options.
      #
      class CodeLensOptions < Base
        define_attribute_methods(:resolve_provider)

        def initialize(resolve_provider: nil)
          super
        end
      end
    end
  end
end
