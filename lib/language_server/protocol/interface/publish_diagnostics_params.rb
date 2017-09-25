module LanguageServer
  module Protocol
    module Interface
      class PublishDiagnosticsParams < Base
        define_attribute_methods(:uri, :diagnostics)

        def initialize(uri:, diagnostics:)
          super
        end
      end
    end
  end
end
