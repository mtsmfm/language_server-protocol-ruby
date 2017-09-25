module LanguageServer
  module Protocol
    module Interface
      class ApplyWorkspaceEditResponse < Base
        attr_required_keys :applied
      end
    end
  end
end
