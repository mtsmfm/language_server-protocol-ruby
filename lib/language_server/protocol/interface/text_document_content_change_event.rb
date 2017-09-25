module LanguageServer
  module Protocol
    module Interface
      #
      # An event describing a change to a text document. If range and rangeLength are omitted
      # the new text is considered to be the full content of the document.
      #
      class TextDocumentContentChangeEvent < Base
        define_attribute_methods(:text, :range, :range_length)

        def initialize(text:, range: nil, range_length: nil)
          super
        end
      end
    end
  end
end
