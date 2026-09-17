module LanguageServer
  module Protocol
    module Interface
      #
      # The parameters of a {@link WorkspaceSymbolRequest}.
      #
      class WorkspaceSymbolParams
        def initialize(query:, work_done_token: nil, partial_result_token: nil)
          @attributes = {}

          @attributes[:query] = query
          @attributes[:workDoneToken] = work_done_token unless work_done_token.nil?
          @attributes[:partialResultToken] = partial_result_token unless partial_result_token.nil?

          @attributes.freeze
        end

        #
        # A query string to filter symbols by. Clients may send an empty
        # string here to request all symbols.
        #
        # The `query`-parameter should be interpreted in a *relaxed way* as editors
        # will apply their own highlighting and scoring on the results. A good rule
        # of thumb is to match case-insensitive and to simply check that the
        # characters of *query* appear in their order in a candidate symbol.
        # Servers shouldn't use prefix, substring, or similar strict matching.
        #
        # @return [string]
        def query
          attributes.fetch(:query)
        end

        #
        # An optional token that a server can use to report work done progress.
        #
        # @return [ProgressToken]
        def work_done_token
          attributes.fetch(:workDoneToken)
        end

        #
        # An optional token that a server can use to report partial results (e.g. streaming) to
        # the client.
        #
        # @return [ProgressToken]
        def partial_result_token
          attributes.fetch(:partialResultToken)
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
