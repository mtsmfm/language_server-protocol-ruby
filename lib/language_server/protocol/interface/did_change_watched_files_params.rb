module LanguageServer
  module Protocol
    module Interface
      class DidChangeWatchedFilesParams < Base
        attr_required_keys :changes
      end
    end
  end
end
