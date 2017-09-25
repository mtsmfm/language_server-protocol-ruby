module LanguageServer
  module Protocol
    module Interface
      class SignatureHelpRegistrationOptions < Base
        define_attribute_methods(:trigger_characters)

        def initialize(trigger_characters: nil)
          super
        end
      end
    end
  end
end
