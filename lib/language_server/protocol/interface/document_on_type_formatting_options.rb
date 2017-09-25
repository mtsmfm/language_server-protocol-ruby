module LanguageServer
  module Protocol
    module Interface
      #
      # Format document on type options
      #
      class DocumentOnTypeFormattingOptions < Base
        define_attribute_methods(:first_trigger_character, :more_trigger_character)

        def initialize(first_trigger_character:, more_trigger_character: nil)
          super
        end
      end
    end
  end
end
