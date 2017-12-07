module LanguageServer
  module Protocol
    module Interface
      class DidChangeTextDocumentParams
        def initialize(text_document:, content_changes:)
          @attributes = {}

          @attributes[:textDocument] = text_document
          @attributes[:contentChanges] = content_changes

          @attributes.freeze
        end

        #
        # The document that did change. The version number points
        # to the version after all provided content changes have
        # been applied.
        #
        # @return [VersionedTextDocumentIdentifier]
        def text_document
          attributes.fetch(:textDocument)
        end

        #
        # The actual content changes.
        #
        # @return [TextDocumentContentChangeEvent[]]
        def content_changes
          attributes.fetch(:contentChanges)
        end

        attr_reader :attributes

        def to_hash
          attributes
        end

        def to_json(*args)
          to_hash.to_json(*args)
        end
      end
    end
  end
end
