module LanguageServer
  module Protocol
    module Interface
      class ResponseError < Base
        #
        # A number indicating the error type that occurred.
        #
        # @return [number]
        define_attribute_method :code

        #
        # A string providing a short description of the error.
        #
        # @return [string]
        define_attribute_method :message

        #
        # A Primitive or Structured value that contains additional
        # information about the error. Can be omitted.
        #
        # @return [D]
        define_attribute_method :data

        def initialize(code:, message:, data: nil)
          super
        end
      end
    end
  end
end
