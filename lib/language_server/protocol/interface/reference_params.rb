module LanguageServer
  module Protocol
    module Interface
      class ReferenceParams < Base
        define_attribute_methods(:context)

        def initialize(context:)
          super
        end
      end
    end
  end
end
