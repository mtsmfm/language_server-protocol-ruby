module LanguageServer
  module Protocol
    module Interface
      class TextDocumentItem < Base
        define_attribute_methods(:uri, :language_id, :version, :text)

        def initialize(uri:, language_id:, version:, text:)
          super
        end
      end
    end
  end
end
