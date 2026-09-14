module LanguageServer
  module Protocol
    module Interface
      #
      # @since 3.18.0
      #
      class ClientShowMessageActionItemOptions
        def initialize(additional_properties_support: nil)
          @attributes = {}

          @attributes[:additionalPropertiesSupport] = additional_properties_support if additional_properties_support

          @attributes.freeze
        end

        #
        # Whether the client supports additional attributes which
        # are preserved and send back to the server in the
        # request's response.
        #
        # @return [boolean]
        def additional_properties_support
          attributes.fetch(:additionalPropertiesSupport)
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
