module LanguageServer
  module Protocol
    module Interface
      #
      # Known error codes for an `InitializeError`;
      #
      class InitializeError < Base
        #
        # Indicates whether the client execute the following retry logic:
        # (1) show the message provided by the ResponseError to the user
        # (2) user selects retry or cancel
        # (3) if user selected retry the initialize method is sent again.
        #
        # @return [boolean]
        define_attribute_method :retry

        def initialize(retry:)
          super
        end
      end
    end
  end
end
