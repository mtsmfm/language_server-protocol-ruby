module LanguageServer
  module Protocol
    module Interface
      #
      # Registration options specific to a notebook.
      #
      # @since 3.17.0
      #
      class NotebookDocumentSyncRegistrationOptions
        def initialize(notebook_selector:, save: nil, id: nil)
          @attributes = {}

          @attributes[:notebookSelector] = notebook_selector
          @attributes[:save] = save unless save.nil?
          @attributes[:id] = id unless id.nil?

          @attributes.freeze
        end

        #
        # The notebooks to be synced
        #
        # @return [NotebookDocumentFilterWithNotebook | NotebookDocumentFilterWithCells[]]
        def notebook_selector
          attributes.fetch(:notebookSelector)
        end

        #
        # Whether save notification should be forwarded to
        # the server. Will only be honored if mode === `notebook`.
        #
        # @return [boolean]
        def save
          attributes.fetch(:save)
        end

        #
        # The id used to register the request. The id can be used to deregister
        # the request again. See also Registration#id.
        #
        # @return [string]
        def id
          attributes.fetch(:id)
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
