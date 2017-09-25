module LanguageServer
  module Protocol
    module Interface
      class ApplyWorkspaceEditResponse < Base
        define_attribute_methods(:applied)

        def initialize(applied:)
          super
        end
      end
    end
  end
end
