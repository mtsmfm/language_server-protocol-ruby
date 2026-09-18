module LanguageServer
  module Protocol
    module Interface
      #
      # @since 3.18.0
      # @deprecated use MarkupContent instead.
      #
      class MarkedStringWithLanguage
        def initialize(language:, value:)
          @attributes = {}

          @attributes[:language] = language
          @attributes[:value] = value

          @attributes.freeze
        end

        # @return [string]
        def language
          attributes.fetch(:language)
        end

        # @return [string]
        def value
          attributes.fetch(:value)
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
