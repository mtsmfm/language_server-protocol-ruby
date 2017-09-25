module LanguageServer
  module Protocol
    module Interface
      #
      # General paramters to to regsiter for a capability.
      #
      class Registration < Base
        define_attribute_methods(:id, :method, :register_options)

        def initialize(id:, method:, register_options: nil)
          super
        end
      end
    end
  end
end
