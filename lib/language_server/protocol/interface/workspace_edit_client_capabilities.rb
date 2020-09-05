module LanguageServer
  module Protocol
    module Interface
      class WorkspaceEditClientCapabilities
        def initialize(document_changes: nil, resource_operations: nil, failure_handling: nil)
          @attributes = {}

          @attributes[:documentChanges] = document_changes if document_changes
          @attributes[:resourceOperations] = resource_operations if resource_operations
          @attributes[:failureHandling] = failure_handling if failure_handling

          @attributes.freeze
        end

        #
        # The client supports versioned document changes in `WorkspaceEdit`s
        #
        # @return [boolean]
        def document_changes
          attributes.fetch(:documentChanges)
        end

        #
        # The resource operations the client supports. Clients should at least
        # support 'create', 'rename' and 'delete' files and folders.
        #
        # @return [ResourceOperationKind[]]
        def resource_operations
          attributes.fetch(:resourceOperations)
        end

        #
        # The failure handling strategy of a client if applying the workspace edit
        # fails.
        #
        # @return [FailureHandlingKind]
        def failure_handling
          attributes.fetch(:failureHandling)
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
