module LanguageServer
  module Protocol
    module Interface
      class DocumentOnTypeFormattingParams < Base
        define_attribute_methods(:text_document, :position, :ch, :options)

        def initialize(text_document:, position:, ch:, options:)
          super
        end
      end
    end
  end
end
