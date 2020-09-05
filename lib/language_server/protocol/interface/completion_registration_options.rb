module LanguageServer
  module Protocol
    module Interface
      class CompletionRegistrationOptions < CompletionOptions
        def initialize(work_done_progress: nil, trigger_characters: nil, all_commit_characters: nil, resolve_provider: nil)
          @attributes = {}

          @attributes[:workDoneProgress] = work_done_progress if work_done_progress
          @attributes[:triggerCharacters] = trigger_characters if trigger_characters
          @attributes[:allCommitCharacters] = all_commit_characters if all_commit_characters
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
