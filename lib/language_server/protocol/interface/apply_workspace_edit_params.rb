module LanguageServer
  module Protocol
    module Interface
      #
      # The parameters passed via an apply workspace edit request.
      #
      class ApplyWorkspaceEditParams
        def initialize(label: nil, edit:, metadata: nil)
          @attributes = {}

          @attributes[:label] = label if label
          @attributes[:edit] = edit
          @attributes[:metadata] = metadata if metadata

          @attributes.freeze
        end

        #
        # An optional label of the workspace edit. This label is
        # presented in the user interface for example on an undo
        # stack to undo the workspace edit.
        #
        # @return [string]
        def label
          attributes.fetch(:label)
        end

        #
        # The edits to apply.
        #
        # @return [WorkspaceEdit]
        def edit
          attributes.fetch(:edit)
        end

        #
        # Additional data about the edit.
        #
        # @since 3.18.0
        #
        # @return [WorkspaceEditMetadata]
        def metadata
          attributes.fetch(:metadata)
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
