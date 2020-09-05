module LanguageServer
  module Protocol
    module Interface
      class WorkspaceSymbolClientCapabilities
        def initialize(dynamic_registration: nil, symbol_kind: nil)
          @attributes = {}

          @attributes[:dynamicRegistration] = dynamic_registration if dynamic_registration
          @attributes[:symbolKind] = symbol_kind if symbol_kind

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
        # @return [{ valueSet?: any[]; }]
        def symbol_kind
          attributes.fetch(:symbolKind)
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
