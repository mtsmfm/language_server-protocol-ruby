module LanguageServer
  module Protocol
    module Interface
      class WorkspaceEdit < Base
        define_attribute_methods(:changes, :document_changes)

        def initialize(changes: nil, document_changes: nil)
          super
        end
      end
    end
  end
end
