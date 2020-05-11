module LanguageServer
  module Protocol
    module Interface
      class SignatureHelpRegistrationOptions < TextDocumentRegistrationOptions
        def initialize(document_selector:, trigger_characters: nil)
          @attributes = {}

          @attributes[:documentSelector] = document_selector
          @attributes[:triggerCharacters] = trigger_characters if trigger_characters

          @attributes.freeze
        end

        #
        # The characters that trigger signature help
        # automatically.
        #
        # @return [string[]]
        def trigger_characters
          attributes.fetch(:triggerCharacters)
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
