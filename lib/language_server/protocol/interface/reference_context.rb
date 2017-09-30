module LanguageServer
  module Protocol
    module Interface
      class ReferenceContext < Base
        #
        # Include the declaration of the current symbol.
        #
        # @return [boolean]
        define_attribute_method :include_declaration

        def initialize(include_declaration:)
          super
        end
      end
    end
  end
end
