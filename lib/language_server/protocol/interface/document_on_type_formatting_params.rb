module LanguageServer
  module Protocol
    module Interface
      class DocumentOnTypeFormattingParams < Base
        #
        # The document to format.
        #
        # @return [TextDocumentIdentifier]
        define_attribute_method :text_document

        #
        # The position at which this request was sent.
        #
        # @return [Position]
        define_attribute_method :position

        #
        # The character that has been typed.
        #
        # @return [string]
        define_attribute_method :ch

        #
        # The format options.
        #
        # @return [FormattingOptions]
        define_attribute_method :options

        def initialize(text_document:, position:, ch:, options:)
          super
        end
      end
    end
  end
end
