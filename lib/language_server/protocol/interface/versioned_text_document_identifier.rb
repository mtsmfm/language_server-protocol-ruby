module LanguageServer
  module Protocol
    module Interface
      class VersionedTextDocumentIdentifier < Base
        attr_required_keys :version
      end
    end
  end
end
