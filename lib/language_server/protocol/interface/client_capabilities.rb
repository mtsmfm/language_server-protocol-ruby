module LanguageServer
  module Protocol
    module Interface
      class ClientCapabilities
        def initialize(workspace: nil, text_document: nil, window: nil, experimental: nil)
          @attributes = {}

          @attributes[:workspace] = workspace if workspace
          @attributes[:textDocument] = text_document if text_document
          @attributes[:window] = window if window
          @attributes[:experimental] = experimental if experimental

          @attributes.freeze
        end

        #
        # Workspace specific client capabilities.
        #
        # @return [{ applyEdit?: boolean; workspaceEdit?: WorkspaceEditClientCapabilities; didChangeConfiguration?: DidChangeConfigurationClientCapabilities; ... 4 more ...; configuration?: boolean; }]
        def workspace
          attributes.fetch(:workspace)
        end

        #
        # Text document specific client capabilities.
        #
        # @return [TextDocumentClientCapabilities]
        def text_document
          attributes.fetch(:textDocument)
        end

        #
        # Window specific client capabilities.
        #
        # @return [{ workDoneProgress?: boolean; }]
        def window
          attributes.fetch(:window)
        end

        #
        # Experimental client capabilities.
        #
        # @return [any]
        def experimental
          attributes.fetch(:experimental)
        end

        attr_reader :attributes

        def to_hash
          attributes
        end

        def to_json(*args)
          to_hash.to_json(*args)
        end
      end
    end
  end
end
