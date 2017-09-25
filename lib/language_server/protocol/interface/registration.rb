module LanguageServer
  module Protocol
    module Interface
      #
      # General paramters to to regsiter for a capability.
      #
      class Registration < Base
        attr_required_keys :id, :method
        attr_optional_keys :register_options
      end
    end
  end
end
