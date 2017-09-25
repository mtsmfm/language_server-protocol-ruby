module LanguageServer
  module Protocol
    module Interface
      #
      # Known error codes for an `InitializeError`;
      #
      class InitializeError < Base
        define_attribute_methods(:retry)

        def initialize(retry:)
          super
        end
      end
    end
  end
end
