module LanguageServer
  module Protocol
    module Interface
      class DocumentRangeFormattingParams < Base
        #
        # The document to format.
        #
        # @return [TextDocumentIdentifier]
        define_attribute_method :text_document

        #
        # The range to format
        #
        # @return [Range]
        define_attribute_method :range

        #
        # The format options
        #
        # @return [FormattingOptions]
        define_attribute_method :options

        def initialize(text_document:, range:, options:)
          super
        end
      end
    end
  end
end
