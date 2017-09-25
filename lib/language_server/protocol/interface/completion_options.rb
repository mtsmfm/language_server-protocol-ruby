module LanguageServer
  module Protocol
    module Interface
      #
      # Completion options.
      #
      class CompletionOptions < Base
        define_attribute_methods(:resolve_provider, :trigger_characters)

        def initialize(resolve_provider: nil, trigger_characters: nil)
          super
        end
      end
    end
  end
end
