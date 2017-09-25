module LanguageServer
  module Protocol
    module Interface
      class Diagnostic < Base
        define_attribute_methods(:range, :message, :severity, :code, :source)

        def initialize(range:, message:, severity: nil, code: nil, source: nil)
          super
        end
      end
    end
  end
end
