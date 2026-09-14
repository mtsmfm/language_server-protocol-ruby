module LanguageServer
  module Protocol
    module Interface
      #
      # Provider options for a {@link CodeActionRequest}.
      #
      class CodeActionOptions
        def initialize(code_action_kinds: nil, documentation: nil, resolve_provider: nil, work_done_progress: nil)
          @attributes = {}

          @attributes[:codeActionKinds] = code_action_kinds if code_action_kinds
          @attributes[:documentation] = documentation if documentation
          @attributes[:resolveProvider] = resolve_provider if resolve_provider
          @attributes[:workDoneProgress] = work_done_progress if work_done_progress

          @attributes.freeze
        end

        #
        # CodeActionKinds that this server may return.
        #
        # The list of kinds may be generic, such as `CodeActionKind.Refactor`, or the server
        # may list out every specific kind they provide.
        #
        # @return [CodeActionKind[]]
        def code_action_kinds
          attributes.fetch(:codeActionKinds)
        end

        #
        # Static documentation for a class of code actions.
        #
        # Documentation from the provider should be shown in the code actions menu if either:
        #
        # - Code actions of `kind` are requested by the editor. In this case, the editor will show the documentation that
        #   most closely matches the requested code action kind. For example, if a provider has documentation for
        #   both `Refactor` and `RefactorExtract`, when the user requests code actions for `RefactorExtract`,
        #   the editor will use the documentation for `RefactorExtract` instead of the documentation for `Refactor`.
        #
        # - Any code actions of `kind` are returned by the provider.
        #
        # At most one documentation entry should be shown per provider.
        #
        # @since 3.18.0
        #
        # @return [CodeActionKindDocumentation[]]
        def documentation
          attributes.fetch(:documentation)
        end

        #
        # The server provides support to resolve additional
        # information for a code action.
        #
        # @since 3.16.0
        #
        # @return [boolean]
        def resolve_provider
          attributes.fetch(:resolveProvider)
        end

        # @return [boolean]
        def work_done_progress
          attributes.fetch(:workDoneProgress)
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
