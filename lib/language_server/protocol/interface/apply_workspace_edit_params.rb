module LanguageServer
  module Protocol
    module Interface
      class ApplyWorkspaceEditParams < Base
        #
        # The edits to apply.
        #
        # @return [WorkspaceEdit]
        define_attribute_method :edit

        def initialize(edit:)
          super
        end
      end
    end
  end
end
