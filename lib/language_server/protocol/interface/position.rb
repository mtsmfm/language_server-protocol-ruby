module LanguageServer
  module Protocol
    module Interface
      class Position < Base
        define_attribute_methods(:line, :character)

        def initialize(line:, character:)
          super
        end
      end
    end
  end
end
