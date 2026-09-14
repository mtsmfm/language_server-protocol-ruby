module LanguageServer
  module Protocol
    module Interface
      #
      # Content changes to a cell in a notebook document.
      #
      # @since 3.18.0
      #
      class NotebookDocumentCellContentChanges
        def initialize(document:, changes:)
          @attributes = {}

          @attributes[:document] = document
          @attributes[:changes] = changes

          @attributes.freeze
        end

        # @return [VersionedTextDocumentIdentifier]
        def document
          attributes.fetch(:document)
        end

        # @return [TextDocumentContentChangeEvent[]]
        def changes
          attributes.fetch(:changes)
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
