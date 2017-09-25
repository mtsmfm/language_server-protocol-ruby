module LanguageServer
  module Protocol
    module Interface
      #
      # Represents information about programming constructs like variables, classes,
      # interfaces etc.
      #
      class SymbolInformation < Base
        define_attribute_methods(:name, :kind, :location, :container_name)

        def initialize(name:, kind:, location:, container_name: nil)
          super
        end
      end
    end
  end
end
