module LanguageServer
  module Protocol
    module Interface
      #
      # An event describing a change to a text document. If range and rangeLength are omitted
      # the new text is considered to be the full content of the document.
      #
      class TextDocumentContentChangeEvent < Base
        #
        # The range of the document that changed.
        #
        # @return [Range]
        define_attribute_method :range

        #
        # The length of the range that got replaced.
        #
        # @return [number]
        define_attribute_method :range_length

        #
        # The new text of the range/document.
        #
        # @return [string]
        define_attribute_method :text

        def initialize(range: nil, range_length: nil, text:)
          super
        end
      end
    end
  end
end
