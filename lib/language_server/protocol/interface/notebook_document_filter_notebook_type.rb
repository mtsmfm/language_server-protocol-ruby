module LanguageServer
  module Protocol
    module Interface
      #
      # A notebook document filter where `notebookType` is required field.
      #
      # @since 3.18.0
      #
      class NotebookDocumentFilterNotebookType
        def initialize(notebook_type:, scheme: nil, pattern: nil)
          @attributes = {}

          @attributes[:notebookType] = notebook_type
          @attributes[:scheme] = scheme if scheme
          @attributes[:pattern] = pattern if pattern

          @attributes.freeze
        end

        #
        # The type of the enclosing notebook.
        #
        # @return [string]
        def notebook_type
          attributes.fetch(:notebookType)
        end

        #
        # A Uri {@link Uri.scheme scheme}, like `file` or `untitled`.
        #
        # @return [string]
        def scheme
          attributes.fetch(:scheme)
        end

        #
        # A glob pattern.
        #
        # @return [GlobPattern]
        def pattern
          attributes.fetch(:pattern)
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
