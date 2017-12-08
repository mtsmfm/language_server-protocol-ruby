module LanguageServer
  module Protocol
    module Interface
      #
      # The parameters of a Workspace Symbol Request.
      #
      class WorkspaceSymbolParams
        def initialize(query:)
          @attributes = {}

          @attributes[:query] = query

          @attributes.freeze
        end

        #
        # A non-empty query string
        #
        # @return [string]
        def query
          attributes.fetch(:query)
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
