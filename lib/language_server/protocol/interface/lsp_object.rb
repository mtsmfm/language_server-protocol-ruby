module LanguageServer
  module Protocol
    module Interface
      #
      # LSP object definition.
      # @since 3.17.0
      #
      class LSPObject
        def initialize()
          @attributes = {}


          @attributes.freeze
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
