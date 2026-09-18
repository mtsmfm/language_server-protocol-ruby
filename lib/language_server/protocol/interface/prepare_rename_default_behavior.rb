module LanguageServer
  module Protocol
    module Interface
      #
      # @since 3.18.0
      #
      class PrepareRenameDefaultBehavior
        def initialize(default_behavior:)
          @attributes = {}

          @attributes[:defaultBehavior] = default_behavior

          @attributes.freeze
        end

        # @return [boolean]
        def default_behavior
          attributes.fetch(:defaultBehavior)
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
