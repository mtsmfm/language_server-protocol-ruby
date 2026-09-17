module LanguageServer
  module Protocol
    module Interface
      #
      # Client Capabilities for a {@link SignatureHelpRequest}.
      #
      class SignatureHelpClientCapabilities
        def initialize(dynamic_registration: nil, signature_information: nil, context_support: nil)
          @attributes = {}

          @attributes[:dynamicRegistration] = dynamic_registration unless dynamic_registration.nil?
          @attributes[:signatureInformation] = signature_information unless signature_information.nil?
          @attributes[:contextSupport] = context_support unless context_support.nil?

          @attributes.freeze
        end

        #
        # Whether signature help supports dynamic registration.
        #
        # @return [boolean]
        def dynamic_registration
          attributes.fetch(:dynamicRegistration)
        end

        #
        # The client supports the following `SignatureInformation`
        # specific properties.
        #
        # @return [ClientSignatureInformationOptions]
        def signature_information
          attributes.fetch(:signatureInformation)
        end

        #
        # The client supports to send additional context information for a
        # `textDocument/signatureHelp` request. A client that opts into
        # contextSupport will also support the `retriggerCharacters` on
        # `SignatureHelpOptions`.
        #
        # @since 3.15.0
        #
        # @return [boolean]
        def context_support
          attributes.fetch(:contextSupport)
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
