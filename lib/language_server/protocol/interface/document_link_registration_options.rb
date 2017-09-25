module LanguageServer
  module Protocol
    module Interface
      class DocumentLinkRegistrationOptions < Base
        define_attribute_methods(:resolve_provider)

        def initialize(resolve_provider:)
          super
        end
      end
    end
  end
end
