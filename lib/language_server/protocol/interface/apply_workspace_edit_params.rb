module LanguageServer
  module Protocol
    module Interface
      class ApplyWorkspaceEditParams < Base
        attr_required_keys :edit
      end
    end
  end
end
