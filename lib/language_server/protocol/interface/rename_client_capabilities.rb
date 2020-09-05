module LanguageServer
  module Protocol
    module Interface
      class RenameClientCapabilities
        def initialize(dynamic_registration: nil, prepare_support: nil)
          @attributes = {}

          @attributes[:dynamicRegistration] = dynamic_registration if dynamic_registration
          @attributes[:prepareSupport] = prepare_support if prepare_support

          @attributes.freeze
        end

        #
        # Whether rename supports dynamic registration.
        #
        # @return [boolean]
        def dynamic_registration
          attributes.fetch(:dynamicRegistration)
        end

        #
        # Client supports testing for validity of rename operations
        # before execution.
        #
        # @return [boolean]
        def prepare_support
          attributes.fetch(:prepareSupport)
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
