module LanguageServer
  module Protocol
    module Interface
      class TextEdit < Base
        attr_required_keys :range, :new_text
      end
    end
  end
end
