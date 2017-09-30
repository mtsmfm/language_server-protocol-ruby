module LanguageServer
  module Protocol
    module Interface
      #
      # Represents information about programming constructs like variables, classes,
      # interfaces etc.
      #
      class SymbolInformation < Base
        #
        # The name of this symbol.
        #
        # @return [string]
        define_attribute_method :name

        #
        # The kind of this symbol.
        #
        # @return [number]
        define_attribute_method :kind

        #
        # The location of this symbol.
        #
        # @return [Location]
        define_attribute_method :location

        #
        # The name of the symbol containing this symbol.
        #
        # @return [string]
        define_attribute_method :container_name

        def initialize(name:, kind:, location:, container_name: nil)
          super
        end
      end
    end
  end
end
