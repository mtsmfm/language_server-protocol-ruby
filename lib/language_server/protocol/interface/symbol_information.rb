module LanguageServer
  module Protocol
    module Interface
      #
      # Represents information about programming constructs like variables, classes,
      # interfaces etc.
      #
      class SymbolInformation < Base
        attr_required_keys :name, :kind, :location
        attr_optional_keys :container_name
      end
    end
  end
end
