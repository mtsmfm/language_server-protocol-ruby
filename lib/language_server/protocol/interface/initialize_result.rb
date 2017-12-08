module LanguageServer
  module Protocol
    module Interface
      class InitializeResult
        def initialize(capabilities:)
          @attributes = {}

          @attributes[:capabilities] = capabilities

          @attributes.freeze
        end

        #
        # The capabilities the language server provides.
        #
        # @return [ServerCapabilities]
        def capabilities
          attributes.fetch(:capabilities)
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
