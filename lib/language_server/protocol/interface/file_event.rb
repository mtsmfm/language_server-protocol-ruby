module LanguageServer
  module Protocol
    module Interface
      #
      # An event describing a file change.
      #
      class FileEvent < Base
        define_attribute_methods(:uri, :type)

        def initialize(uri:, type:)
          super
        end
      end
    end
  end
end
