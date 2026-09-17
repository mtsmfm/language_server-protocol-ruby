module LanguageServer
  module Protocol
    module Interface
      #
      # Cell changes to a notebook document.
      #
      # @since 3.18.0
      #
      class NotebookDocumentCellChanges
        def initialize(structure: nil, data: nil, text_content: nil)
          @attributes = {}

          @attributes[:structure] = structure unless structure.nil?
          @attributes[:data] = data unless data.nil?
          @attributes[:textContent] = text_content unless text_content.nil?

          @attributes.freeze
        end

        #
        # Changes to the cell structure to add or
        # remove cells.
        #
        # @return [NotebookDocumentCellChangeStructure]
        def structure
          attributes.fetch(:structure)
        end

        #
        # Changes to notebook cells properties like its
        # kind, execution summary or metadata.
        #
        # @return [NotebookCell[]]
        def data
          attributes.fetch(:data)
        end

        #
        # Changes to the text content of notebook cells.
        #
        # @return [NotebookDocumentCellContentChanges[]]
        def text_content
          attributes.fetch(:textContent)
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
