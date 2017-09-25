module LanguageServer
  module Protocol
    module Interface
      class Location < Base
        attr_required_keys :uri, :range
      end
    end
  end
end
