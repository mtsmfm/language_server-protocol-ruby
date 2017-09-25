module LanguageServer
  module Protocol
    module Interface
      #
      # General parameters to unregister a capability.
      #
      class Unregistration < Base
        define_attribute_methods(:id, :method)

        def initialize(id:, method:)
          super
        end
      end
    end
  end
end
