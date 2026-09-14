module LanguageServer
  module Protocol
    module Interface
      #
      # @since 3.18.0
      #
      class ClientCodeActionKindOptions
        def initialize(value_set:)
          @attributes = {}

          @attributes[:valueSet] = value_set

          @attributes.freeze
        end

        #
        # The code action kind values the client supports. When this
        # property exists the client also guarantees that it will
        # handle values outside its set gracefully and falls back
        # to a default value when unknown.
        #
        # @return [CodeActionKind[]]
        def value_set
          attributes.fetch(:valueSet)
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
