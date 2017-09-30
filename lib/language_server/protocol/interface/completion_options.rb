module LanguageServer
  module Protocol
    module Interface
      #
      # Completion options.
      #
      class CompletionOptions < Base
        #
        # The server provides support to resolve additional
        # information for a completion item.
        #
        # @return [boolean]
        define_attribute_method :resolve_provider

        #
        # The characters that trigger completion automatically.
        #
        # @return [string[]]
        define_attribute_method :trigger_characters

        def initialize(resolve_provider: nil, trigger_characters: nil)
          super
        end
      end
    end
  end
end
