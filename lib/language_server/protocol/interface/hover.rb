module LanguageServer
  module Protocol
    module Interface
      #
      # The result of a hover request.
      #
      class Hover < Base
        attr_required_keys :contents
        attr_optional_keys :range
      end
    end
  end
end
