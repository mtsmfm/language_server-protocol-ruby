module LanguageServer
  module Protocol
    module Interface
      class WorkspaceEdit < Base
        attr_optional_keys :changes, :document_changes
      end
    end
  end
end
