module LanguageServer
  module Protocol
    module Interface
      #
      # Server capabilities for a {@link WorkspaceSymbolRequest}.
      #
      class WorkspaceSymbolOptions
        def initialize(resolve_provider: nil, work_done_progress: nil)
          @attributes = {}

          @attributes[:resolveProvider] = resolve_provider unless resolve_provider.nil?
          @attributes[:workDoneProgress] = work_done_progress unless work_done_progress.nil?

          @attributes.freeze
        end

        #
        # The server provides support to resolve additional
        # information for a workspace symbol.
        #
        # @since 3.17.0
        #
        # @return [boolean]
        def resolve_provider
          attributes.fetch(:resolveProvider)
        end

        # @return [boolean]
        def work_done_progress
          attributes.fetch(:workDoneProgress)
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
