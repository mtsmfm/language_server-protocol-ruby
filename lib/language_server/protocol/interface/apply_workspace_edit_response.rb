module LanguageServer
  module Protocol
    module Interface
      class ApplyWorkspaceEditResponse
        def initialize(applied:)
          @attributes = {}

          @attributes[:applied] = applied

          @attributes.freeze
        end

        #
        # Indicates whether the edit was applied or not.
        #
        # @return [boolean]
        def applied
          attributes.fetch(:applied)
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
