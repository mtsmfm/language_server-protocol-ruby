module LanguageServer
  module Protocol
    module Interface
      class RenameRegistrationOptions < TextDocumentRegistrationOptions
        def initialize(document_selector:, prepare_provider: nil)
          @attributes = {}

          @attributes[:documentSelector] = document_selector
          @attributes[:prepareProvider] = prepare_provider if prepare_provider

          @attributes.freeze
        end

        #
        # Renames should be checked and tested for validity before being executed.
        #
        # @return [boolean]
        def prepare_provider
          attributes.fetch(:prepareProvider)
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
