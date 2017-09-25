module LanguageServer
  module Protocol
    module Interface
      class Range < Base
        attr_required_keys :start, :end
      end
    end
  end
end
