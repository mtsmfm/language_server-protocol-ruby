module LanguageServer
  module Protocol
    module Interface
      class InitializeResult < Base
        #
        # The capabilities the language server provides.
        #
        # @return [ServerCapabilities]
        define_attribute_method :capabilities

        def initialize(capabilities:)
          super
        end
      end
    end
  end
end
