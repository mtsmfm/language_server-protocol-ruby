module LanguageServer
  module Protocol
    module Interface
      class DidChangeWatchedFilesParams < Base
        define_attribute_methods(:changes)

        def initialize(changes:)
          super
        end
      end
    end
  end
end
