module LanguageServer
  module Protocol
    module Interface
      #
      # @since 3.18.0
      #
      class NotebookDocumentFilterWithCells
        def initialize(notebook: nil, cells:)
          @attributes = {}

          @attributes[:notebook] = notebook unless notebook.nil?
          @attributes[:cells] = cells

          @attributes.freeze
        end

        #
        # The notebook to be synced If a string
        # value is provided it matches against the
        # notebook type. '*' matches every notebook.
        #
        # @return [string | NotebookDocumentFilter]
        def notebook
          attributes.fetch(:notebook)
        end

        #
        # The cells of the matching notebook to be synced.
        #
        # @return [NotebookCellLanguage[]]
        def cells
          attributes.fetch(:cells)
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
