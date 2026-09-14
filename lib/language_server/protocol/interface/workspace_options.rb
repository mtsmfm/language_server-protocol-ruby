module LanguageServer
  module Protocol
    module Interface
      #
      # Defines workspace specific capabilities of the server.
      #
      # @since 3.18.0
      #
      class WorkspaceOptions
        def initialize(workspace_folders: nil, file_operations: nil, text_document_content: nil)
          @attributes = {}

          @attributes[:workspaceFolders] = workspace_folders if workspace_folders
          @attributes[:fileOperations] = file_operations if file_operations
          @attributes[:textDocumentContent] = text_document_content if text_document_content

          @attributes.freeze
        end

        #
        # The server supports workspace folder.
        #
        # @since 3.6.0
        #
        # @return [WorkspaceFoldersServerCapabilities]
        def workspace_folders
          attributes.fetch(:workspaceFolders)
        end

        #
        # The server is interested in notifications/requests for operations on files.
        #
        # @since 3.16.0
        #
        # @return [FileOperationOptions]
        def file_operations
          attributes.fetch(:fileOperations)
        end

        #
        # The server supports the `workspace/textDocumentContent` request.
        #
        # @since 3.18.0
        #
        # @return [TextDocumentContentOptions | TextDocumentContentRegistrationOptions]
        def text_document_content
          attributes.fetch(:textDocumentContent)
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
