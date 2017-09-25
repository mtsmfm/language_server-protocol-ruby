module LanguageServer
  module Protocol
    module Interface
      class DocumentRangeFormattingParams < Base
        define_attribute_methods(:text_document, :range, :options)

        def initialize(text_document:, range:, options:)
          super
        end
      end
    end
  end
end
