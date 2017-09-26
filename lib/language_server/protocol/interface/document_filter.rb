module LanguageServer
  module Protocol
    module Interface
      class DocumentFilter < Base
        #
        # A language id, like `typescript`.
        #
        # @return [string]
        define_attribute_method :language

        #
        # A Uri [scheme](#Uri.scheme), like `file` or `untitled`.
        #
        # @return [string]
        define_attribute_method :scheme

        #
        # A glob pattern, like `*.{ts,js}`.
        #
        # @return [string]
        define_attribute_method :pattern

        def initialize(language: nil, scheme: nil, pattern: nil)
          super
        end
      end
    end
  end
end
