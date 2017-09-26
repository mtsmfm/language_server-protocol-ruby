module LanguageServer
  module Protocol
    module Interface
      class VersionedTextDocumentIdentifier < Base
        #
        # The version number of this document.
        #
        # @return [number]
        define_attribute_method :version

        def initialize(version:)
          super
        end
      end
    end
  end
end
