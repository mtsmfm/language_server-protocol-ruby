module LanguageServer
  module Protocol
    module Interface
      #
      # An event describing a change to a text document. If range and rangeLength are omitted
      # the new text is considered to be the full content of the document.
      #
      class TextDocumentContentChangeEvent < Base
        attr_required_keys :text
        attr_optional_keys :range, :range_length
      end
    end
  end
end
