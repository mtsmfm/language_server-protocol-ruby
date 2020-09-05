module LanguageServer
  module Protocol
    module Interface
      class PublishDiagnosticsClientCapabilities
        def initialize(related_information: nil, tag_support: nil, version_support: nil)
          @attributes = {}

          @attributes[:relatedInformation] = related_information if related_information
          @attributes[:tagSupport] = tag_support if tag_support
          @attributes[:versionSupport] = version_support if version_support

          @attributes.freeze
        end

        #
        # Whether the clients accepts diagnostics with related information.
        #
        # @return [boolean]
        def related_information
          attributes.fetch(:relatedInformation)
        end

        #
        # Client supports the tag property to provide meta data about a diagnostic.
        # Clients supporting tags have to handle unknown tags gracefully.
        #
        # @return [{ valueSet: DiagnosticTag[]; }]
        def tag_support
          attributes.fetch(:tagSupport)
        end

        #
        # Whether the client interprets the version property of the
        # `textDocument/publishDiagnostics` notification's parameter.
        #
        # @return [boolean]
        def version_support
          attributes.fetch(:versionSupport)
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
