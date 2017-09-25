module LanguageServer
  module Protocol
    module Interface
      class Range < Base
        define_attribute_methods(:start, :end)

        def initialize(start:, end:)
          super
        end
      end
    end
  end
end
