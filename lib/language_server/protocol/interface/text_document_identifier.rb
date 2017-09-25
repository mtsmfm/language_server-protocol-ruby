module LanguageServer
  module Protocol
    module Interface
      class TextDocumentIdentifier < Base
        define_attribute_methods(:uri)

        def initialize(uri:)
          super
        end
      end
    end
  end
end
