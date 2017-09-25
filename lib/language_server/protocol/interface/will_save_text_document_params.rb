module LanguageServer
  module Protocol
    module Interface
      #
      # The parameters send in a will save text document notification.
      #
      class WillSaveTextDocumentParams < Base
        define_attribute_methods(:text_document, :reason)

        def initialize(text_document:, reason:)
          super
        end
      end
    end
  end
end
