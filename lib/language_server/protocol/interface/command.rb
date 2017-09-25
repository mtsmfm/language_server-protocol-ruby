module LanguageServer
  module Protocol
    module Interface
      class Command < Base
        define_attribute_methods(:title, :command, :arguments)

        def initialize(title:, command:, arguments: nil)
          super
        end
      end
    end
  end
end
