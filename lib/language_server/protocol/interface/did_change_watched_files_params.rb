module LanguageServer
  module Protocol
    module Interface
      class DidChangeWatchedFilesParams < Base
        #
        # The actual file events.
        #
        # @return [FileEvent[]]
        define_attribute_method :changes

        def initialize(changes:)
          super
        end
      end
    end
  end
end
