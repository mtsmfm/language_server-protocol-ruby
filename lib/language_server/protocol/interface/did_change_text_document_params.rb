module LanguageServer
  module Protocol
    module Interface
      class DidChangeTextDocumentParams < Base
        #
        # The document that did change. The version number points
        # to the version after all provided content changes have
        # been applied.
        #
        # @return [VersionedTextDocumentIdentifier]
        define_attribute_method :text_document

        #
        # The actual content changes.
        #
        # @return [TextDocumentContentChangeEvent[]]
        define_attribute_method :content_changes

        def initialize(text_document:, content_changes:)
          super
        end
      end
    end
  end
end
