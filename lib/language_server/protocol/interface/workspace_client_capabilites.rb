module LanguageServer
  module Protocol
    module Interface
      #
      # Workspace specific client capabilities.
      #
      class WorkspaceClientCapabilites < Base
        define_attribute_methods(:apply_edit, :workspace_edit, :did_change_configuration, :did_change_watched_files, :symbol, :execute_commandnil)

        def initialize(apply_edit: nil, workspace_edit: nil, did_change_configuration: nil, did_change_watched_files: nil, symbol: nil, execute_commandnil: nil)
          super
        end
      end
    end
  end
end
