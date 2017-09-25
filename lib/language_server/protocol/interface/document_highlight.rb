module LanguageServer
  module Protocol
    module Interface
      #
      # A document highlight is a range inside a text document which deserves
      # special attention. Usually a document highlight is visualized by changing
      # the background color of its range.
      #
      class DocumentHighlight < Base
        define_attribute_methods(:range, :kind)

        def initialize(range:, kind: nil)
          super
        end
      end
    end
  end
end
