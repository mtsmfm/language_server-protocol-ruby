module LanguageServer
  module Protocol
    module Interface
      #
      # Value-object describing what options formatting should use.
      #
      class FormattingOptions < Base
        attr_required_keys :tab_size, :insert_spaces
      end
    end
  end
end
