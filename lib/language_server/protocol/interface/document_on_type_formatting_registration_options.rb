module LanguageServer
  module Protocol
    module Interface
      class DocumentOnTypeFormattingRegistrationOptions < Base
        #
        # A character on which formatting should be triggered, like `}`.
        #
        # @return [string]
        define_attribute_method :first_trigger_character

        #
        # More trigger characters.
        #
        # @return [string[]]
        define_attribute_method :more_trigger_character

        def initialize(first_trigger_character:, more_trigger_character: nil)
          super
        end
      end
    end
  end
end
