module LanguageServer
  module Protocol
    module Interface
      class TextDocumentSaveRegistrationOptions < Base
        define_attribute_methods(:include_text)

        def initialize(include_text: nil)
          super
        end
      end
    end
  end
end
