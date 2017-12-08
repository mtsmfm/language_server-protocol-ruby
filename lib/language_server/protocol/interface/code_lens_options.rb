module LanguageServer
  module Protocol
    module Interface
      #
      # Code Lens options.
      #
      class CodeLensOptions
        def initialize(resolve_provider: nil)
          @attributes = {}

          @attributes[:resolveProvider] = resolve_provider if resolve_provider

          @attributes.freeze
        end

        #
        # Code lens has a resolve provider as well.
        #
        # @return [boolean]
        def resolve_provider
          attributes.fetch(:resolveProvider)
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
