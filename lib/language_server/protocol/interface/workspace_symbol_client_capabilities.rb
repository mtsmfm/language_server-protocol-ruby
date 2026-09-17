module LanguageServer
  module Protocol
    module Interface
      #
      # Client capabilities for a {@link WorkspaceSymbolRequest}.
      #
      class WorkspaceSymbolClientCapabilities
        def initialize(dynamic_registration: nil, symbol_kind: nil, tag_support: nil, resolve_support: nil)
          @attributes = {}

          @attributes[:dynamicRegistration] = dynamic_registration unless dynamic_registration.nil?
          @attributes[:symbolKind] = symbol_kind unless symbol_kind.nil?
          @attributes[:tagSupport] = tag_support unless tag_support.nil?
          @attributes[:resolveSupport] = resolve_support unless resolve_support.nil?

          @attributes.freeze
        end

        #
        # Symbol request supports dynamic registration.
        #
        # @return [boolean]
        def dynamic_registration
          attributes.fetch(:dynamicRegistration)
        end

        #
        # Specific capabilities for the `SymbolKind` in the `workspace/symbol` request.
        #
        # @return [ClientSymbolKindOptions]
        def symbol_kind
          attributes.fetch(:symbolKind)
        end

        #
        # The client supports tags on `SymbolInformation`.
        # Clients supporting tags have to handle unknown tags gracefully.
        #
        # @since 3.16.0
        #
        # @return [ClientSymbolTagOptions]
        def tag_support
          attributes.fetch(:tagSupport)
        end

        #
        # The client support partial workspace symbols. The client will send the
        # request `workspaceSymbol/resolve` to the server to resolve additional
        # properties.
        #
        # @since 3.17.0
        #
        # @return [ClientSymbolResolveOptions]
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
