module LanguageServer
  module Protocol
    module Interface
      class DocumentFilter < Base
        define_attribute_methods(:language, :scheme, :pattern)

        def initialize(language: nil, scheme: nil, pattern: nil)
          super
        end
      end
    end
  end
end
