module LanguageServer
  module Protocol
    module Interface
      #
      # Workspace specific client capabilities.
      #
      class WorkspaceClientCapabilites < Base
        attr_optional_keys :apply_edit, :workspace_edit, :did_change_configuration,
          :did_change_watched_files, :symbol, :execute_commandnil
      end
    end
  end
end
