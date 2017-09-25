module LanguageServer
  module Protocol
    module Interface
      class CancelParams < Base
        define_attribute_methods(:id)

        def initialize(id:)
          super
        end
      end
    end
  end
end
