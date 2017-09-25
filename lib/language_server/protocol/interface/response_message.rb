module LanguageServer
  module Protocol
    module Interface
      class ResponseMessage < Base
        define_attribute_methods(:id, :result, :error)

        def initialize(id:, result: nil, error: nil)
          super
        end
      end
    end
  end
end
