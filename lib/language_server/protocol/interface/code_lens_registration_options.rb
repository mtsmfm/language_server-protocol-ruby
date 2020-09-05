module LanguageServer
  module Protocol
    module Interface
      class CodeLensRegistrationOptions < CodeLensOptions
        def initialize(work_done_progress: nil, resolve_provider: nil)
          @attributes = {}

          @attributes[:workDoneProgress] = work_done_progress if work_done_progress
          @attributes[:resolveProvider] = resolve_provider if resolve_provider

          @attributes.freeze
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
