module LanguageServer
  module Protocol
    module Interface
      class DocumentOnTypeFormattingRegistrationOptions < Base
        define_attribute_methods(:first_trigger_character, :more_trigger_character)

        def initialize(first_trigger_character:, more_trigger_character: nil)
          super
        end
      end
    end
  end
end
