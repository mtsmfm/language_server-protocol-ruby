module LanguageServer
  module Protocol
    module Interface
      #
      # A code action represents a change that can be performed in code, e.g. to fix a problem or
      # to refactor code.
      #
      # A CodeAction must set either `edit` and/or a `command`. If both are supplied, the `edit` is applied first, then the `command` is executed.
      #
      class CodeAction
        def initialize(title:, kind: nil, diagnostics: nil, edit: nil, command: nil)
          @attributes = {}

          @attributes[:title] = title
          @attributes[:kind] = kind if kind
          @attributes[:diagnostics] = diagnostics if diagnostics
          @attributes[:edit] = edit if edit
          @attributes[:command] = command if command

          @attributes.freeze
        end

        #
        # A short, human-readable, title for this code action.
        #
        # @return [string]
        def title
          attributes.fetch(:title)
        end

        #
        # The kind of the code action.
        #
        # Used to filter code actions.
        #
        # @return [string]
        def kind
          attributes.fetch(:kind)
        end

        #
        # The diagnostics that this code action resolves.
        #
        # @return [Diagnostic[]]
        def diagnostics
          attributes.fetch(:diagnostics)
        end

        #
        # The workspace edit this code action performs.
        #
        # @return [WorkspaceEdit]
        def edit
          attributes.fetch(:edit)
        end

        #
        # A command this code action executes. If a code action
        # provides an edit and a command, first the edit is
        # executed and then the command.
        #
        # @return [Command]
        def command
          attributes.fetch(:command)
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
