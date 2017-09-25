module LanguageServer
  module Protocol
    module Interface
      #
      # An event describing a file change.
      #
      class FileEvent < Base
        attr_required_keys :uri, :type
      end
    end
  end
end
