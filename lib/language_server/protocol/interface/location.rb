module LanguageServer
  module Protocol
    module Interface
      class Location < Base
        define_attribute_methods(:uri, :range)

        def initialize(uri:, range:)
          super
        end
      end
    end
  end
end
