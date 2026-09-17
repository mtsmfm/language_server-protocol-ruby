module LanguageServer
  module Protocol
    module Interface
      #
      # A document filter where `pattern` is required field.
      #
      # @since 3.18.0
      #
      class TextDocumentFilterPattern
        def initialize(language: nil, scheme: nil, pattern:)
          @attributes = {}

          @attributes[:language] = language unless language.nil?
          @attributes[:scheme] = scheme unless scheme.nil?
          @attributes[:pattern] = pattern

          @attributes.freeze
        end

        #
        # A language id, like `typescript`.
        #
        # @return [string]
        def language
          attributes.fetch(:language)
        end

        #
        # A Uri {@link Uri.scheme scheme}, like `file` or `untitled`.
        #
        # @return [string]
        def scheme
          attributes.fetch(:scheme)
        end

        #
        # A glob pattern, like **​/*.{ts,js}. See TextDocumentFilter for examples.
        #
        # @since 3.18.0 - support for relative patterns. Whether clients support
        # relative patterns depends on the client capability
        # `textDocuments.filters.relativePatternSupport`.
        #
        # @return [GlobPattern]
        def pattern
          attributes.fetch(:pattern)
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
