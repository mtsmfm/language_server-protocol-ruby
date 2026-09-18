module LanguageServer
  module Protocol
    module Interface
      #
      # @since 3.18.0
      #
      class NotebookCellLanguage
        def initialize(language:)
          @attributes = {}

          @attributes[:language] = language

          @attributes.freeze
        end

        # @return [string]
        def language
          attributes.fetch(:language)
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
