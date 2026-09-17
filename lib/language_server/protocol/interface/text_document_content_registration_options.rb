module LanguageServer
  module Protocol
    module Interface
      #
      # Text document content provider registration options.
      #
      # @since 3.18.0
      #
      class TextDocumentContentRegistrationOptions
        def initialize(schemes:, id: nil)
          @attributes = {}

          @attributes[:schemes] = schemes
          @attributes[:id] = id unless id.nil?

          @attributes.freeze
        end

        #
        # The schemes for which the server provides content.
        #
        # @return [string[]]
        def schemes
          attributes.fetch(:schemes)
        end

        #
        # The id used to register the request. The id can be used to deregister
        # the request again. See also Registration#id.
        #
        # @return [string]
        def id
          attributes.fetch(:id)
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
