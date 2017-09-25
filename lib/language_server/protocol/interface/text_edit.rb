module LanguageServer
  module Protocol
    module Interface
      class TextEdit < Base
        define_attribute_methods(:range, :new_text)

        def initialize(range:, new_text:)
          super
        end
      end
    end
  end
end
