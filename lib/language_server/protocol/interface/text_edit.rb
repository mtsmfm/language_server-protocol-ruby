module LanguageServer
  module Protocol
    module Interface
      class TextEdit < Base
        #
        # The range of the text document to be manipulated. To insert
        # text into a document create a range where start === end.
        #
        # @return [Range]
        define_attribute_method :range

        #
        # The string to be inserted. For delete operations use an
        # empty string.
        #
        # @return [string]
        define_attribute_method :new_text

        def initialize(range:, new_text:)
          super
        end
      end
    end
  end
end
