module LanguageServer
  module Protocol
    module Interface
      class WorkspaceEditClientCapabilities
        def initialize(document_changes: nil, resource_operations: nil, failure_handling: nil, normalizes_line_endings: nil, change_annotation_support: nil, metadata_support: nil, snippet_edit_support: nil)
          @attributes = {}

          @attributes[:documentChanges] = document_changes unless document_changes.nil?
          @attributes[:resourceOperations] = resource_operations unless resource_operations.nil?
          @attributes[:failureHandling] = failure_handling unless failure_handling.nil?
          @attributes[:normalizesLineEndings] = normalizes_line_endings unless normalizes_line_endings.nil?
          @attributes[:changeAnnotationSupport] = change_annotation_support unless change_annotation_support.nil?
          @attributes[:metadataSupport] = metadata_support unless metadata_support.nil?
          @attributes[:snippetEditSupport] = snippet_edit_support unless snippet_edit_support.nil?

          @attributes.freeze
        end

        #
        # The client supports versioned document changes in `WorkspaceEdit`s
        #
        # @return [boolean]
        def document_changes
          attributes.fetch(:documentChanges)
        end

        #
        # The resource operations the client supports. Clients should at least
        # support 'create', 'rename' and 'delete' files and folders.
        #
        # @since 3.13.0
        #
        # @return [ResourceOperationKind[]]
        def resource_operations
          attributes.fetch(:resourceOperations)
        end

        #
        # The failure handling strategy of a client if applying the workspace edit
        # fails.
        #
        # @since 3.13.0
        #
        # @return [FailureHandlingKind]
        def failure_handling
          attributes.fetch(:failureHandling)
        end

        #
        # Whether the client normalizes line endings to the client specific
        # setting.
        # If set to `true` the client will normalize line ending characters
        # in a workspace edit to the client-specified new line
        # character.
        #
        # @since 3.16.0
        #
        # @return [boolean]
        def normalizes_line_endings
          attributes.fetch(:normalizesLineEndings)
        end

        #
        # Whether the client in general supports change annotations on text edits,
        # create file, rename file and delete file changes.
        #
        # @since 3.16.0
        #
        # @return [ChangeAnnotationsSupportOptions]
        def change_annotation_support
          attributes.fetch(:changeAnnotationSupport)
        end

        #
        # Whether the client supports `WorkspaceEditMetadata` in `WorkspaceEdit`s.
        #
        # @since 3.18.0
        #
        # @return [boolean]
        def metadata_support
          attributes.fetch(:metadataSupport)
        end

        #
        # Whether the client supports snippets as text edits.
        #
        # @since 3.18.0
        #
        # @return [boolean]
        def snippet_edit_support
          attributes.fetch(:snippetEditSupport)
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
