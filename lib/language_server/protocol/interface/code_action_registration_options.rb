module LanguageServer
  module Protocol
    module Interface
      class CodeActionRegistrationOptions < CodeActionOptions
        def initialize(work_done_progress: nil, code_action_kinds: nil, resolve_provider: nil)
          @attributes = {}

          @attributes[:workDoneProgress] = work_done_progress if work_done_progress
          @attributes[:codeActionKinds] = code_action_kinds if code_action_kinds
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
