module LanguageServer
  module Protocol
    module Interface
      class DocumentFormattingParams < Base
        define_attribute_methods(:text_document, :options)

        def initialize(text_document:, options:)
          super
        end
      end
    end
  end
end
