module LanguageServer
  module Protocol
    module Interface
      class CodeActionOptions < WorkDoneProgressOptions
        def initialize(work_done_progress: nil, code_action_kinds: nil)
          @attributes = {}

          @attributes[:workDoneProgress] = work_done_progress if work_done_progress
          @attributes[:codeActionKinds] = code_action_kinds if code_action_kinds

          @attributes.freeze
        end

        #
        # CodeActionKinds that this server may return.
        #
        # The list of kinds may be generic, such as `CodeActionKind.Refactor`, or the server
        # may list out every specific kind they provide.
        #
        # @return [string[]]
        def code_action_kinds
          attributes.fetch(:codeActionKinds)
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
