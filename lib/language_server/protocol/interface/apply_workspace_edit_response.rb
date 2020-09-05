module LanguageServer
  module Protocol
    module Interface
      class ApplyWorkspaceEditResponse
        def initialize(applied:, failure_reason: nil)
          @attributes = {}

          @attributes[:applied] = applied
          @attributes[:failureReason] = failure_reason if failure_reason

          @attributes.freeze
        end

        #
        # Indicates whether the edit was applied or not.
        #
        # @return [boolean]
        def applied
          attributes.fetch(:applied)
        end

        #
        # An optional textual description for why the edit was not applied.
        # This may be used may be used by the server for diagnostic
        # logging or to provide a suitable error for a request that
        # triggered the edit.
        #
        # @return [string]
        def failure_reason
          attributes.fetch(:failureReason)
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
