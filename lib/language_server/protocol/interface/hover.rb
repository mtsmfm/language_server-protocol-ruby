module LanguageServer
  module Protocol
    module Interface
      #
      # The result of a hover request.
      #
      class Hover < Base
        #
        # The hover's content
        #
        # @return [string | { language: string; value: string; } | MarkedString[]]
        define_attribute_method :contents

        #
        # An optional range is a range inside a text document
        # that is used to visualize a hover, e.g. by changing the background color.
        #
        # @return [Range]
        define_attribute_method :range

        def initialize(contents:, range: nil)
          super
        end
      end
    end
  end
end
