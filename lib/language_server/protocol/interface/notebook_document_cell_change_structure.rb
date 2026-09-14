module LanguageServer
  module Protocol
    module Interface
      #
      # Structural changes to cells in a notebook document.
      #
      # @since 3.18.0
      #
      class NotebookDocumentCellChangeStructure
        def initialize(array:, did_open: nil, did_close: nil)
          @attributes = {}

          @attributes[:array] = array
          @attributes[:didOpen] = did_open if did_open
          @attributes[:didClose] = did_close if did_close

          @attributes.freeze
        end

        #
        # The change to the cell array.
        #
        # @return [NotebookCellArrayChange]
        def array
          attributes.fetch(:array)
        end

        #
        # Additional opened cell text documents.
        #
        # @return [TextDocumentItem[]]
        def did_open
          attributes.fetch(:didOpen)
        end

        #
        # Additional closed cell text documents.
        #
        # @return [TextDocumentIdentifier[]]
        def did_close
          attributes.fetch(:didClose)
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
