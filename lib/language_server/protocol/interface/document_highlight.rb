module LanguageServer
  module Protocol
    module Interface
      #
      # A document highlight is a range inside a text document which deserves
      # special attention. Usually a document highlight is visualized by changing
      # the background color of its range.
      #
      class DocumentHighlight < Base
        #
        # The range this highlight applies to.
        #
        # @return [Range]
        define_attribute_method :range

        #
        # The highlight kind, default is DocumentHighlightKind.Text.
        #
        # @return [number]
        define_attribute_method :kind

        def initialize(range:, kind: nil)
          super
        end
      end
    end
  end
end
