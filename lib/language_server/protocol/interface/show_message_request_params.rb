module LanguageServer
  module Protocol
    module Interface
      class ShowMessageRequestParams < Base
        #
        # The message type. See {@link MessageType}
        #
        # @return [number]
        define_attribute_method :type

        #
        # The actual message
        #
        # @return [string]
        define_attribute_method :message

        #
        # The message action items to present.
        #
        # @return [MessageActionItem[]]
        define_attribute_method :actions

        def initialize(type:, message:, actions: nil)
          super
        end
      end
    end
  end
end
