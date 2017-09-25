module LanguageServer
  module Protocol
    module Interface
      #
      # Params for the CodeActionRequest
      #
      class CodeActionParams < Base
        define_attribute_methods(:text_document, :range, :context)

        def initialize(text_document:, range:, context:)
          super
        end
      end
    end
  end
end
