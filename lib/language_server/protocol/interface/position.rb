module LanguageServer
  module Protocol
    module Interface
      class Position < Base
        attr_required_keys :line, :character
      end
    end
  end
end
