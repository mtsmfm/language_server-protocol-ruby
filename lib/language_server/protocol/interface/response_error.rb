module LanguageServer
  module Protocol
    module Interface
      class ResponseError < Base
        define_attribute_methods(:code, :message, :data)

        def initialize(code:, message:, data: nil)
          super
        end
      end
    end
  end
end
