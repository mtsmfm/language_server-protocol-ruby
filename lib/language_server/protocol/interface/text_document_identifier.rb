module LanguageServer
  module Protocol
    module Interface
      class TextDocumentIdentifier < Base
        #
        # The text document's URI.
        #
        # @return [string]
        define_attribute_method :uri

        def initialize(uri:)
          super
        end
      end
    end
  end
end
