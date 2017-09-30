module LanguageServer
  module Protocol
    module Interface
      class WorkspaceEdit < Base
        #
        # Holds changes to existing resources.
        #
        # @return [{ [uri: string]: TextEdit[]; }]
        define_attribute_method :changes

        #
        # An array of `TextDocumentEdit`s to express changes to specific a specific
        # version of a text document. Whether a client supports versioned document
        # edits is expressed via `WorkspaceClientCapabilites.versionedWorkspaceEdit`.
        #
        # @return [TextDocumentEdit[]]
        define_attribute_method :document_changes

        def initialize(changes: nil, document_changes: nil)
          super
        end
      end
    end
  end
end
