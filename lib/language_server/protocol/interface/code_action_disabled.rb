module LanguageServer
  module Protocol
    module Interface
      #
      # Captures why the code action is currently disabled.
      #
      # @since 3.18.0
      #
      class CodeActionDisabled
        def initialize(reason:)
          @attributes = {}

          @attributes[:reason] = reason

          @attributes.freeze
        end

        #
        # Human readable description of why the code action is currently disabled.
        #
        # This is displayed in the code actions UI.
        #
        # @return [string]
        def reason
          attributes.fetch(:reason)
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
