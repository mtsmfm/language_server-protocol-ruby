module LanguageServer
  module Protocol
    module Interface
      #
      # A document highlight is a range inside a text document which deserves
      # special attention. Usually a document highlight is visualized by changing
      # the background color of its range.
      #
      class DocumentHighlight < Base
        attr_required_keys :range
        attr_optional_keys :kind
      end
    end
  end
end
