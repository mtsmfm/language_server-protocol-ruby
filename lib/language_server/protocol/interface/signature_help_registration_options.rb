module LanguageServer
  module Protocol
    module Interface
      class SignatureHelpRegistrationOptions < SignatureHelpOptions
        def initialize(work_done_progress: nil, trigger_characters: nil, retrigger_characters: nil)
          @attributes = {}

          @attributes[:workDoneProgress] = work_done_progress if work_done_progress
          @attributes[:triggerCharacters] = trigger_characters if trigger_characters
          @attributes[:retriggerCharacters] = retrigger_characters if retrigger_characters

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
