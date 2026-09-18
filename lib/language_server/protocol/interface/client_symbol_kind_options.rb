module LanguageServer
  module Protocol
    module Interface
      #
      # @since 3.18.0
      #
      class ClientSymbolKindOptions
        def initialize(value_set: nil)
          @attributes = {}

          @attributes[:valueSet] = value_set unless value_set.nil?

          @attributes.freeze
        end

        #
        # The symbol kind values the client supports. When this
        # property exists the client also guarantees that it will
        # handle values outside its set gracefully and falls back
        # to a default value when unknown.
        #
        # If this property is not present the client only supports
        # the symbol kinds from `File` to `Array` as defined in
        # the initial version of the protocol.
        #
        # @return [SymbolKind[]]
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
