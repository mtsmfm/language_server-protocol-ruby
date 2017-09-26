module LanguageServer
  module Protocol
    module Interface
      class RenameParams < Base
        #
        # The document to format.
        #
        # @return [TextDocumentIdentifier]
        define_attribute_method :text_document

        #
        # The position at which this request was sent.
        #
        # @return [Position]
        define_attribute_method :position

        #
        # The new name of the symbol. If the given name is not valid the
        # request must return a [ResponseError](#ResponseError) with an
        # appropriate message set.
        #
        # @return [string]
        define_attribute_method :new_name

        def initialize(text_document:, position:, new_name:)
          super
        end
      end
    end
  end
end
