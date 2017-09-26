module LanguageServer
  module Protocol
    module Interface
      class TextDocumentEdit < Base
        #
        # The text document to change.
        #
        # @return [VersionedTextDocumentIdentifier]
        define_attribute_method :text_document

        #
        # The edits to be applied.
        #
        # @return [TextEdit[]]
        define_attribute_method :edits

        def initialize(text_document:, edits:)
          super
        end
      end
    end
  end
end
