module LanguageServer
  module Protocol
    module Interface
      #
      # @since 3.18.0
      #
      class ClientCodeActionLiteralOptions
        def initialize(code_action_kind:)
          @attributes = {}

          @attributes[:codeActionKind] = code_action_kind

          @attributes.freeze
        end

        #
        # The code action kind is support with the following value
        # set.
        #
        # @return [ClientCodeActionKindOptions]
        def code_action_kind
          attributes.fetch(:codeActionKind)
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
