module LanguageServer
  module Protocol
    module Interface
      class CompletionRegistrationOptions < Base
        define_attribute_methods(:trigger_characters, :resolve_provider)

        def initialize(trigger_characters: nil, resolve_provider: nil)
          super
        end
      end
    end
  end
end
