module LanguageServer
  module Protocol
    module Interface
      #
      # The parameters of a Workspace Symbol Request.
      #
      class WorkspaceSymbolParams < Base
        attr_required_keys :query
      end
    end
  end
end
