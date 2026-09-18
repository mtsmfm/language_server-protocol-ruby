module LanguageServer
  module Protocol
    module Interface
      #
      # The Client Capabilities of a {@link CodeActionRequest}.
      #
      class CodeActionClientCapabilities
        def initialize(dynamic_registration: nil, code_action_literal_support: nil, is_preferred_support: nil, disabled_support: nil, data_support: nil, resolve_support: nil, honors_change_annotations: nil, documentation_support: nil, tag_support: nil)
          @attributes = {}

          @attributes[:dynamicRegistration] = dynamic_registration unless dynamic_registration.nil?
          @attributes[:codeActionLiteralSupport] = code_action_literal_support unless code_action_literal_support.nil?
          @attributes[:isPreferredSupport] = is_preferred_support unless is_preferred_support.nil?
          @attributes[:disabledSupport] = disabled_support unless disabled_support.nil?
          @attributes[:dataSupport] = data_support unless data_support.nil?
          @attributes[:resolveSupport] = resolve_support unless resolve_support.nil?
          @attributes[:honorsChangeAnnotations] = honors_change_annotations unless honors_change_annotations.nil?
          @attributes[:documentationSupport] = documentation_support unless documentation_support.nil?
          @attributes[:tagSupport] = tag_support unless tag_support.nil?

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
        # The client support code action literals of type `CodeAction` as a valid
        # response of the `textDocument/codeAction` request. If the property is not
        # set the request can only return `Command` literals.
        #
        # @since 3.8.0
        #
        # @return [ClientCodeActionLiteralOptions]
        def code_action_literal_support
          attributes.fetch(:codeActionLiteralSupport)
        end

        #
        # Whether code action supports the `isPreferred` property.
        #
        # @since 3.15.0
        #
        # @return [boolean]
        def is_preferred_support
          attributes.fetch(:isPreferredSupport)
        end

        #
        # Whether code action supports the `disabled` property.
        #
        # @since 3.16.0
        #
        # @return [boolean]
        def disabled_support
          attributes.fetch(:disabledSupport)
        end

        #
        # Whether code action supports the `data` property which is
        # preserved between a `textDocument/codeAction` and a
        # `codeAction/resolve` request.
        #
        # @since 3.16.0
        #
        # @return [boolean]
        def data_support
          attributes.fetch(:dataSupport)
        end

        #
        # Whether the client supports resolving additional code action
        # properties via a separate `codeAction/resolve` request.
        #
        # @since 3.16.0
        #
        # @return [ClientCodeActionResolveOptions]
        def resolve_support
          attributes.fetch(:resolveSupport)
        end

        #
        # Whether the client honors the change annotations in
        # text edits and resource operations returned via the
        # `CodeAction#edit` property by for example presenting
        # the workspace edit in the user interface and asking
        # for confirmation.
        #
        # @since 3.16.0
        #
        # @return [boolean]
        def honors_change_annotations
          attributes.fetch(:honorsChangeAnnotations)
        end

        #
        # Whether the client supports documentation for a class of
        # code actions.
        #
        # @since 3.18.0
        #
        # @return [boolean]
        def documentation_support
          attributes.fetch(:documentationSupport)
        end

        #
        # Client supports the tag property on a code action. Clients
        # supporting tags have to handle unknown tags gracefully.
        #
        # @since 3.18.0
        #
        # @return [CodeActionTagOptions]
        def tag_support
          attributes.fetch(:tagSupport)
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
