module LanguageServer
  module Protocol
    module Interface
      class PublishDiagnosticsParams < Base
        #
        # The URI for which diagnostic information is reported.
        #
        # @return [string]
        define_attribute_method :uri

        #
        # An array of diagnostic information items.
        #
        # @return [Diagnostic[]]
        define_attribute_method :diagnostics

        def initialize(uri:, diagnostics:)
          super
        end
      end
    end
  end
end
