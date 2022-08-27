module LanguageServer
  module Protocol
    module Interface
      #
      # A document filter describes a top level text document or
      # a notebook cell document.
      #
      # @since 3.17.0 - proposed support for NotebookCellTextDocumentFilter.
      #
      class DocumentFilter
        def initialize(language:, scheme: nil, pattern: nil, notebook:)
          @attributes = {}

          @attributes[:language] = language
          @attributes[:scheme] = scheme if scheme
          @attributes[:pattern] = pattern if pattern
          @attributes[:notebook] = notebook

          @attributes.freeze
        end

        #
        # A language id, like `typescript`. */
        #
        # @return [string]
        def language
          attributes.fetch(:language)
        end

        #
        # A Uri [scheme](#Uri.scheme), like `file` or `untitled`. */
        #
        # @return [string | nil]
        def scheme
          attributes.fetch(:scheme)
        end

        #
        # A glob pattern, like `*.{ts,js}`. */
        #
        # @return [string | nil]
        def pattern
          attributes.fetch(:pattern)
        end

        #
        # A filter that matches against the notebook
        # containing the notebook cell. If a string
        # value is provided it matches against the
        # notebook type. '*' matches every notebook.
        #
        # @return [string | NotebookDocumentFilter]
        def notebook
          attributes.fetch(:notebook)
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
