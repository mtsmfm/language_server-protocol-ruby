module LanguageServer
  module Protocol
    module Interface
      #
      # The parameters of a Workspace Symbol Request.
      #
      class WorkspaceSymbolParams < PartialResultParams
        def initialize(partial_result_token: nil, query:)
          @attributes = {}

          @attributes[:partialResultToken] = partial_result_token if partial_result_token
          @attributes[:query] = query

          @attributes.freeze
        end

        #
        # A query string to filter symbols by. Clients may send an empty
        # string here to request all symbols.
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
