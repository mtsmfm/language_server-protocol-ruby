module LanguageServer
  module Protocol
    module Interface
      #
      # Workspace specific client capabilities.
      #
      class WorkspaceClientCapabilites < Base
        #
        # The client supports applying batch edits to the workspace by supporting
        # the request 'workspace/applyEdit'
        #
        # @return [boolean]
        define_attribute_method :apply_edit

        #
        # Capabilities specific to `WorkspaceEdit`s
        #
        # @return [{ documentChanges?: boolean; }]
        define_attribute_method :workspace_edit

        #
        # Capabilities specific to the `workspace/didChangeConfiguration` notification.
        #
        # @return [{ dynamicRegistration?: boolean; }]
        define_attribute_method :did_change_configuration

        #
        # Capabilities specific to the `workspace/didChangeWatchedFiles` notification.
        #
        # @return [{ dynamicRegistration?: boolean; }]
        define_attribute_method :did_change_watched_files

        #
        # Capabilities specific to the `workspace/symbol` request.
        #
        # @return [{ dynamicRegistration?: boolean; }]
        define_attribute_method :symbol

        #
        # Capabilities specific to the `workspace/executeCommand` request.
        #
        # @return [{ dynamicRegistration?: boolean; }]
        define_attribute_method :execute_command

        def initialize(apply_edit: nil, workspace_edit: nil, did_change_configuration: nil, did_change_watched_files: nil, symbol: nil, execute_command: nil)
          super
        end
      end
    end
  end
end
