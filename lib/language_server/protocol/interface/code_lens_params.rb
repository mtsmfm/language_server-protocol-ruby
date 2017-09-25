module LanguageServer
  module Protocol
    module Interface
      class CodeLensParams < Base
        define_attribute_methods(:text_document)

        def initialize(text_document:)
          super
        end
      end
    end
  end
end
