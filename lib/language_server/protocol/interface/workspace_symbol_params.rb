module LanguageServer
  module Protocol
    module Interface
      #
      # The parameters of a Workspace Symbol Request.
      #
      class WorkspaceSymbolParams < Base
        #
        # A non-empty query string
        #
        # @return [string]
        define_attribute_method :query

        def initialize(query:)
          super
        end
      end
    end
  end
end
