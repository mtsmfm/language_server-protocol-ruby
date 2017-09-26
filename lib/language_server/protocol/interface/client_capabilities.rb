module LanguageServer
  module Protocol
    module Interface
      class ClientCapabilities < Base
        #
        # Workspace specific client capabilities.
        #
        # @return [WorkspaceClientCapabilites]
        define_attribute_method :workspace

        #
        # Text document specific client capabilities.
        #
        # @return [TextDocumentClientCapabilities]
        define_attribute_method :text_document

        #
        # Experimental client capabilities.
        #
        # @return [any]
        define_attribute_method :experimental

        def initialize(workspace: nil, text_document: nil, experimental: nil)
          super
        end
      end
    end
  end
end
