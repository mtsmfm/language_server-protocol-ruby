module LanguageServer
  module Protocol
    module Interface
      #
      # Value-object describing what options formatting should use.
      #
      class FormattingOptions < Base
        #
        # Size of a tab in spaces.
        #
        # @return [number]
        define_attribute_method :tab_size

        #
        # Prefer spaces over tabs.
        #
        # @return [boolean]
        define_attribute_method :insert_spaces

        def initialize(tab_size:, insert_spaces:)
          super
        end
      end
    end
  end
end
