module LanguageServer
  module Protocol
    module Interface
      class InitializeParams < WorkDoneProgressParams
        def initialize(work_done_token: nil, process_id:, client_info: nil, root_path: nil, root_uri:, initialization_options: nil, capabilities:, trace: nil, workspace_folders: nil)
          @attributes = {}

          @attributes[:workDoneToken] = work_done_token if work_done_token
          @attributes[:processId] = process_id
          @attributes[:clientInfo] = client_info if client_info
          @attributes[:rootPath] = root_path if root_path
          @attributes[:rootUri] = root_uri
          @attributes[:initializationOptions] = initialization_options if initialization_options
          @attributes[:capabilities] = capabilities
          @attributes[:trace] = trace if trace
          @attributes[:workspaceFolders] = workspace_folders if workspace_folders

          @attributes.freeze
        end

        #
        # The process Id of the parent process that started
        # the server. Is null if the process has not been started by another process.
        # If the parent process is not alive then the server should exit (see exit notification) its process.
        #
        # @return [number]
        def process_id
          attributes.fetch(:processId)
        end

        #
        # Information about the client
        #
        # @return [{ name: string; version?: string; }]
        def client_info
          attributes.fetch(:clientInfo)
        end

        #
        # The rootPath of the workspace. Is null
        # if no folder is open.
        #
        # @return [string]
        def root_path
          attributes.fetch(:rootPath)
        end

        #
        # The rootUri of the workspace. Is null if no
        # folder is open. If both `rootPath` and `rootUri` are set
        # `rootUri` wins.
        #
        # @return [string]
        def root_uri
          attributes.fetch(:rootUri)
        end

        #
        # User provided initialization options.
        #
        # @return [any]
        def initialization_options
          attributes.fetch(:initializationOptions)
        end

        #
        # The capabilities provided by the client (editor or tool)
        #
        # @return [ClientCapabilities]
        def capabilities
          attributes.fetch(:capabilities)
        end

        #
        # The initial trace setting. If omitted trace is disabled ('off').
        #
        # @return ["off" | "messages" | "verbose"]
        def trace
          attributes.fetch(:trace)
        end

        #
        # The workspace folders configured in the client when the server starts.
        # This property is only available if the client supports workspace folders.
        # It can be `null` if the client supports workspace folders but none are
        # configured.
        #
        # @return [WorkspaceFolder[]]
        def workspace_folders
          attributes.fetch(:workspaceFolders)
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
