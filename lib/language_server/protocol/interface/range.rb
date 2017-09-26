module LanguageServer
  module Protocol
    module Interface
      class Range < Base
        #
        # The range's start position.
        #
        # @return [Position]
        define_attribute_method :start

        #
        # The range's end position.
        #
        # @return [Position]
        define_attribute_method :end

        def initialize(start:, end:)
          super
        end
      end
    end
  end
end
