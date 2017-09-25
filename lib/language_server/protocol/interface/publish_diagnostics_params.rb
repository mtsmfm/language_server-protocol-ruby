module LanguageServer
  module Protocol
    module Interface
      class PublishDiagnosticsParams < Base
        attr_required_keys :uri, :diagnostics
      end
    end
  end
end
