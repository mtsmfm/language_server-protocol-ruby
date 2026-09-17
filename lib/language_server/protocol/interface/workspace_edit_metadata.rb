module LanguageServer
  module Protocol
    module Interface
      #
      # Additional data about a workspace edit.
      #
      # @since 3.18.0
      #
      class WorkspaceEditMetadata
        def initialize(is_refactoring: nil)
          @attributes = {}

          @attributes[:isRefactoring] = is_refactoring unless is_refactoring.nil?

          @attributes.freeze
        end

        #
        # Signal to the editor that this edit is a refactoring.
        #
        # @return [boolean]
        def is_refactoring
          attributes.fetch(:isRefactoring)
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
