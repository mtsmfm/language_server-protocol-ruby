module LanguageServer
  module Protocol
    module Interface
      class ShowMessageParams < Base
        #
        # The message type. See {@link MessageType}.
        #
        # @return [number]
        define_attribute_method :type

        #
        # The actual message.
        #
        # @return [string]
        define_attribute_method :message

        def initialize(type:, message:)
          super
        end
      end
    end
  end
end
