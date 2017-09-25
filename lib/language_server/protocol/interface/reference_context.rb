module LanguageServer
  module Protocol
    module Interface
      class ReferenceContext < Base
        attr_required_keys :include_declaration
      end
    end
  end
end
