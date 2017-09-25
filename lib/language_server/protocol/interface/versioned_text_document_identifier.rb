module LanguageServer
  module Protocol
    module Interface
      class VersionedTextDocumentIdentifier < TextDocumentIdentifier
        define_attribute_methods(:version)

        def initialize(version:)
          super
        end
      end
    end
  end
end
