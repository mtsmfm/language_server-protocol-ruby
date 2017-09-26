module LanguageServer
  module Protocol
    module Interface
      class InitializeParams < Base
        #
        # The process Id of the parent process that started
        # the server. Is null if the process has not been started by another process.
        # If the parent process is not alive then the server should exit (see exit notification) its process.
        #
        # @return [number]
        define_attribute_method :process_id

        #
        # The rootPath of the workspace. Is null
        # if no folder is open.
        #
        # @return [string]
        define_attribute_method :root_path

        #
        # The rootUri of the workspace. Is null if no
        # folder is open. If both `rootPath` and `rootUri` are set
        # `rootUri` wins.
        #
        # @return [string]
        define_attribute_method :root_uri

        #
        # User provided initialization options.
        #
        # @return [any]
        define_attribute_method :initialization_options

        #
        # The capabilities provided by the client (editor or tool)
        #
        # @return [ClientCapabilities]
        define_attribute_method :capabilities

        #
        # The initial trace setting. If omitted trace is disabled ('off').
        #
        # @return ["off" | "messages" | "verbose"]
        define_attribute_method :trace

        def initialize(process_id:, root_path: nil, root_uri:, initialization_options: nil, capabilities:, trace: nil)
          super
        end
      end
    end
  end
end
