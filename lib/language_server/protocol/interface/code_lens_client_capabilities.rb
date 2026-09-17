module LanguageServer
  module Protocol
    module Interface
      #
      # The client capabilities  of a {@link CodeLensRequest}.
      #
      class CodeLensClientCapabilities
        def initialize(dynamic_registration: nil, resolve_support: nil)
          @attributes = {}

          @attributes[:dynamicRegistration] = dynamic_registration unless dynamic_registration.nil?
          @attributes[:resolveSupport] = resolve_support unless resolve_support.nil?

          @attributes.freeze
        end

        #
        # Whether code lens supports dynamic registration.
        #
        # @return [boolean]
        def dynamic_registration
          attributes.fetch(:dynamicRegistration)
        end

        #
        # Whether the client supports resolving additional code lens
        # properties via a separate `codeLens/resolve` request.
        #
        # @since 3.18.0
        #
        # @return [ClientCodeLensResolveOptions]
        def resolve_support
          attributes.fetch(:resolveSupport)
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
