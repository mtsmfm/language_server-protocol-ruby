module LanguageServer
  module Protocol
    module Interface
      class MessageActionItem < Base
        define_attribute_methods(:title)

        def initialize(title:)
          super
        end
      end
    end
  end
end
