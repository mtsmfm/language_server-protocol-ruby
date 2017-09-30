module LanguageServer
  module Protocol
    module Interface
      #
      # An event describing a file change.
      #
      class FileEvent < Base
        #
        # The file's URI.
        #
        # @return [string]
        define_attribute_method :uri

        #
        # The change type.
        #
        # @return [number]
        define_attribute_method :type

        def initialize(uri:, type:)
          super
        end
      end
    end
  end
end
