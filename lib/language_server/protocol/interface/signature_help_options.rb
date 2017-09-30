module LanguageServer
  module Protocol
    module Interface
      #
      # Signature help options.
      #
      class SignatureHelpOptions < Base
        #
        # The characters that trigger signature help
        # automatically.
        #
        # @return [string[]]
        define_attribute_method :trigger_characters

        def initialize(trigger_characters: nil)
          super
        end
      end
    end
  end
end
