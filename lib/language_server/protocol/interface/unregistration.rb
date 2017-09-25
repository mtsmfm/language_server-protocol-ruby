module LanguageServer
  module Protocol
    module Interface
      #
      # General parameters to unregister a capability.
      #
      class Unregistration < Base
        attr_required_keys :id, :method
      end
    end
  end
end
