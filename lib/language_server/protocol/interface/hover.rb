module LanguageServer
  module Protocol
    module Interface
      #
      # The result of a hover request.
      #
      class Hover < Base
        define_attribute_methods(:contents, :range)

        def initialize(contents:, range: nil)
          super
        end
      end
    end
  end
end
