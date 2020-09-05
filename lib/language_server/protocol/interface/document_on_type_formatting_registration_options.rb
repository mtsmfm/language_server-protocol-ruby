module LanguageServer
  module Protocol
    module Interface
      class DocumentOnTypeFormattingRegistrationOptions < DocumentOnTypeFormattingOptions
        def initialize(first_trigger_character:, more_trigger_character: nil)
          @attributes = {}

          @attributes[:firstTriggerCharacter] = first_trigger_character
          @attributes[:moreTriggerCharacter] = more_trigger_character if more_trigger_character

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
