module LanguageServer
  module Protocol
    module Interface
      class ReferenceParams < Base
        # @return [ReferenceContext]
        define_attribute_method :context

        def initialize(context:)
          super
        end
      end
    end
  end
end
