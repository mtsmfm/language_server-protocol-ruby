module LanguageServer
  module Protocol
    module Interface
      #
      # Value-object describing what options formatting should use.
      #
      class FormattingOptions < Base
        define_attribute_methods(:tab_size, :insert_spaces)

        def initialize(tab_size:, insert_spaces:)
          super
        end
      end
    end
  end
end
