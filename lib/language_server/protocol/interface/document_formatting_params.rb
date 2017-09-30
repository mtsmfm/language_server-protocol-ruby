module LanguageServer
  module Protocol
    module Interface
      class DocumentFormattingParams < Base
        #
        # The document to format.
        #
        # @return [TextDocumentIdentifier]
        define_attribute_method :text_document

        #
        # The format options.
        #
        # @return [FormattingOptions]
        define_attribute_method :options

        def initialize(text_document:, options:)
          super
        end
      end
    end
  end
end
