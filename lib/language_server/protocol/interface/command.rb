module LanguageServer
  module Protocol
    module Interface
      class Command < Base
        attr_required_keys :title, :command
        attr_optional_keys :arguments
      end
    end
  end
end
