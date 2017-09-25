module LanguageServer
  module Protocol
    module Interface
      class ApplyWorkspaceEditParams < Base
        define_attribute_methods(:edit)

        def initialize(edit:)
          super
        end
      end
    end
  end
end
