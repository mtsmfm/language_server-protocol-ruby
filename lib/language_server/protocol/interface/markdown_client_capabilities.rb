module LanguageServer
  module Protocol
    module Interface
      #
      # Client capabilities specific to the used markdown parser.
      #
      class MarkdownClientCapabilities
        def initialize(parser:, version: nil)
          @attributes = {}

          @attributes[:parser] = parser
          @attributes[:version] = version if version

          @attributes.freeze
        end

        #
        # The name of the parser.
        #
        # @return [string]
        def parser
          attributes.fetch(:parser)
        end

        #
        # The version of the parser.
        #
        # @return [string]
        def version
          attributes.fetch(:version)
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
