module LanguageServer
  module Protocol
    module Interface
      class Position < Base
        #
        # Line position in a document (zero-based).
        #
        # @return [number]
        define_attribute_method :line

        #
        # Character offset on a line in a document (zero-based).
        #
        # @return [number]
        define_attribute_method :character

        def initialize(line:, character:)
          super
        end
      end
    end
  end
end
