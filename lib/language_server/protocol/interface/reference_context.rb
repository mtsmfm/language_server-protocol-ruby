module LanguageServer
  module Protocol
    module Interface
      class ReferenceContext < Base
        define_attribute_methods(:include_declaration)

        def initialize(include_declaration:)
          super
        end
      end
    end
  end
end
