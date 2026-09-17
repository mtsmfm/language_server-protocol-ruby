module LanguageServer
  module Protocol
    module Interface
      #
      # @since 3.18.0
      #
      class ClientSignatureParameterInformationOptions
        def initialize(label_offset_support: nil)
          @attributes = {}

          @attributes[:labelOffsetSupport] = label_offset_support unless label_offset_support.nil?

          @attributes.freeze
        end

        #
        # The client supports processing label offsets instead of a
        # simple label string.
        #
        # @since 3.14.0
        #
        # @return [boolean]
        def label_offset_support
          attributes.fetch(:labelOffsetSupport)
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
