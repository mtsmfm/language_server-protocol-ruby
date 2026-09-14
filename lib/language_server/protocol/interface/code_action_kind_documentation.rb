module LanguageServer
  module Protocol
    module Interface
      #
      # Documentation for a class of code actions.
      #
      # @since 3.18.0
      #
      class CodeActionKindDocumentation
        def initialize(kind:, command:)
          @attributes = {}

          @attributes[:kind] = kind
          @attributes[:command] = command

          @attributes.freeze
        end

        #
        # The kind of the code action being documented.
        #
        # If the kind is generic, such as `CodeActionKind.Refactor`, the documentation will be shown whenever any
        # refactorings are returned. If the kind if more specific, such as `CodeActionKind.RefactorExtract`, the
        # documentation will only be shown when extract refactoring code actions are returned.
        #
        # @return [CodeActionKind]
        def kind
          attributes.fetch(:kind)
        end

        #
        # Command that is ued to display the documentation to the user.
        #
        # The title of this documentation code action is taken from {@linkcode Command.title}
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
