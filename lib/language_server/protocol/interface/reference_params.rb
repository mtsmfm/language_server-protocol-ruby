module LanguageServer
  module Protocol
    module Interface
      class ReferenceParams < TextDocumentPositionParams
        define_attribute_methods(:context)

        def initialize(text_document:, position:, context:)
          super
        end
      end
    end
  end
end
