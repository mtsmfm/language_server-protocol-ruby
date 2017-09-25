module LanguageServer
  module Protocol
    module Interface
      class TextDocumentRegistrationOptions < Base
        define_attribute_methods(:document_selector)

        def initialize(document_selector:)
          super
        end
      end
    end
  end
end
