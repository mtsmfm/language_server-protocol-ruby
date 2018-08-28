module LanguageServer
  module Protocol
    module Interface
      #
      # Contains additional diagnostic information about the context in which
      # a code action is run.
      #
      class CodeActionContext
        def initialize(diagnostics:, only: nil)
          @attributes = {}

          @attributes[:diagnostics] = diagnostics
          @attributes[:only] = only if only

          @attributes.freeze
        end

        #
        # An array of diagnostics.
        #
        # @return [Diagnostic[]]
        def diagnostics
          attributes.fetch(:diagnostics)
        end

        #
        # Requested kind of actions to return.
        #
        # Actions not of this kind are filtered out by the client before being shown. So servers
        # can omit computing them.
        #
        # @return [string[]]
        def only
          attributes.fetch(:only)
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
