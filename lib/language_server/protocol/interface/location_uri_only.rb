module LanguageServer
  module Protocol
    module Interface
      #
      # Location with only uri and does not include range.
      #
      # @since 3.18.0
      #
      class LocationUriOnly
        def initialize(uri:)
          @attributes = {}

          @attributes[:uri] = uri

          @attributes.freeze
        end

        # @return [DocumentUri]
        def uri
          attributes.fetch(:uri)
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
