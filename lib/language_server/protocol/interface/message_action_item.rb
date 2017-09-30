module LanguageServer
  module Protocol
    module Interface
      class MessageActionItem < Base
        #
        # A short title like 'Retry', 'Open Log' etc.
        #
        # @return [string]
        define_attribute_method :title

        def initialize(title:)
          super
        end
      end
    end
  end
end
