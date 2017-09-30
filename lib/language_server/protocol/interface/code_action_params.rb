module LanguageServer
  module Protocol
    module Interface
      #
      # Params for the CodeActionRequest
      #
      class CodeActionParams < Base
        #
        # The document in which the command was invoked.
        #
        # @return [TextDocumentIdentifier]
        define_attribute_method :text_document

        #
        # The range for which the command was invoked.
        #
        # @return [Range]
        define_attribute_method :range

        #
        # Context carrying additional information.
        #
        # @return [CodeActionContext]
        define_attribute_method :context

        def initialize(text_document:, range:, context:)
          super
        end
      end
    end
  end
end
