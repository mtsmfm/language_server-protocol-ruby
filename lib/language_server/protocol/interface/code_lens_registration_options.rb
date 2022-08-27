module LanguageServer
  module Protocol
    module Interface
      #
      # Registration options for a [CodeLensRequest](#CodeLensRequest).
      #
      class CodeLensRegistrationOptions
        def initialize(document_selector:, resolve_provider: nil, work_done_progress: nil)
          @attributes = {}

          @attributes[:documentSelector] = document_selector
          @attributes[:resolveProvider] = resolve_provider if resolve_provider
          @attributes[:workDoneProgress] = work_done_progress if work_done_progress

          @attributes.freeze
        end

        #
        # A document selector to identify the scope of the registration. If set to null
        # the document selector provided on the client side will be used.
        #
        # @return [DocumentSelector | null]
        def document_selector
          attributes.fetch(:documentSelector)
        end

        #
        # Code lens has a resolve provider as well.
        #
        # @return [boolean | nil]
        def resolve_provider
          attributes.fetch(:resolveProvider)
        end

        # @return [boolean | nil]
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
