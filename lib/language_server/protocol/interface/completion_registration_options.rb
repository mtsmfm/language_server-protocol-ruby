module LanguageServer
  module Protocol
    module Interface
      class CompletionRegistrationOptions < TextDocumentRegistrationOptions
        def initialize(document_selector:, trigger_characters: nil, resolve_provider: nil)
          @attributes = {}

          @attributes[:triggerCharacters] = trigger_characters if trigger_characters
          @attributes[:resolveProvider] = resolve_provider if resolve_provider

          @attributes.freeze
        end

        #
        # Most tools trigger completion request automatically without explicitly requesting
        # it using a keyboard shortcut (e.g. Ctrl+Space). Typically they do so when the user
        # starts to type an identifier. For example if the user types `c` in a JavaScript file
        # code complete will automatically pop up present `console` besides others as a
        # completion item. Characters that make up identifiers don't need to be listed here.
        #
        # If code complete should automatically be trigger on characters not being valid inside
        # an identifier (for example `.` in JavaScript) list them in `triggerCharacters`.
        #
        # @return [string[]]
        def trigger_characters
          attributes.fetch(:triggerCharacters)
        end

        #
        # The server provides support to resolve additional
        # information for a completion item.
        #
        # @return [boolean]
        def resolve_provider
          attributes.fetch(:resolveProvider)
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
