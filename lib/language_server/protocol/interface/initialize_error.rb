module LanguageServer
  module Protocol
    module Interface
      #
      # Known error codes for an `InitializeError`;
      #
      class InitializeError < Base
        attr_required_keys :retry
      end
    end
  end
end
