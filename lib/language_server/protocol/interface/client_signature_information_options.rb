module LanguageServer
  module Protocol
    module Interface
      #
      # @since 3.18.0
      #
      class ClientSignatureInformationOptions
        def initialize(documentation_format: nil, parameter_information: nil, active_parameter_support: nil, no_active_parameter_support: nil)
          @attributes = {}

          @attributes[:documentationFormat] = documentation_format if documentation_format
          @attributes[:parameterInformation] = parameter_information if parameter_information
          @attributes[:activeParameterSupport] = active_parameter_support if active_parameter_support
          @attributes[:noActiveParameterSupport] = no_active_parameter_support if no_active_parameter_support

          @attributes.freeze
        end

        #
        # Client supports the following content formats for the documentation
        # property. The order describes the preferred format of the client.
        #
        # @return [MarkupKind[]]
        def documentation_format
          attributes.fetch(:documentationFormat)
        end

        #
        # Client capabilities specific to parameter information.
        #
        # @return [ClientSignatureParameterInformationOptions]
        def parameter_information
          attributes.fetch(:parameterInformation)
        end

        #
        # The client supports the `activeParameter` property on `SignatureInformation`
        # literal.
        #
        # @since 3.16.0
        #
        # @return [boolean]
        def active_parameter_support
          attributes.fetch(:activeParameterSupport)
        end

        #
        # The client supports the `activeParameter` property on
        # `SignatureHelp`/`SignatureInformation` being set to `null` to
        # indicate that no parameter should be active.
        #
        # @since 3.18.0
        #
        # @return [boolean]
        def no_active_parameter_support
          attributes.fetch(:noActiveParameterSupport)
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
