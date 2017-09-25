module LanguageServer
  module Protocol
    module Interface
      #
      # The parameters of a Workspace Symbol Request.
      #
      class WorkspaceSymbolParams < Base
        define_attribute_methods(:query)

        def initialize(query:)
          super
        end
      end
    end
  end
end
