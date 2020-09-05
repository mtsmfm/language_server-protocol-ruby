module LanguageServer
  module Protocol
    module Interface
      class CodeActionClientCapabilities
        def initialize(dynamic_registration: nil, code_action_literal_support: nil, is_preferred_support: nil)
          @attributes = {}

          @attributes[:dynamicRegistration] = dynamic_registration if dynamic_registration
          @attributes[:codeActionLiteralSupport] = code_action_literal_support if code_action_literal_support
          @attributes[:isPreferredSupport] = is_preferred_support if is_preferred_support

          @attributes.freeze
        end

        #
        # Whether code action supports dynamic registration.
        #
        # @return [boolean]
        def dynamic_registration
          attributes.fetch(:dynamicRegistration)
        end

        #
        # The client supports code action literals as a valid
        # response of the `textDocument/codeAction` request.
        #
        # @return [{ codeActionKind: { valueSet: string[]; }; }]
        def code_action_literal_support
          attributes.fetch(:codeActionLiteralSupport)
        end

        #
        # Whether code action supports the `isPreferred` property.
        #
        # @return [boolean]
        def is_preferred_support
          attributes.fetch(:isPreferredSupport)
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
