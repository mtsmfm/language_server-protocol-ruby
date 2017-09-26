module LanguageServer
  module Protocol
    module Interface
      class CompletionRegistrationOptions < Base
        #
        # The characters that trigger completion automatically.
        #
        # @return [string[]]
        define_attribute_method :trigger_characters

        #
        # The server provides support to resolve additional
        # information for a completion item.
        #
        # @return [boolean]
        define_attribute_method :resolve_provider

        def initialize(trigger_characters: nil, resolve_provider: nil)
          super
        end
      end
    end
  end
end
