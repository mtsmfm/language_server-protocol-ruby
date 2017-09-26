module LanguageServer
  module Protocol
    module Interface
      class Location < Base
        # @return [string]
        define_attribute_method :uri

        # @return [Range]
        define_attribute_method :range

        def initialize(uri:, range:)
          super
        end
      end
    end
  end
end
