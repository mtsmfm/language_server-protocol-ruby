module LanguageServer
  module Protocol
    module Interface
      class TextDocumentItem < Base
        #
        # The text document's URI.
        #
        # @return [string]
        define_attribute_method :uri

        #
        # The text document's language identifier.
        #
        # @return [string]
        define_attribute_method :language_id

        #
        # The version number of this document (it will strictly increase after each
        # change, including undo/redo).
        #
        # @return [number]
        define_attribute_method :version

        #
        # The content of the opened text document.
        #
        # @return [string]
        define_attribute_method :text

        def initialize(uri:, language_id:, version:, text:)
          super
        end
      end
    end
  end
end
