module LanguageServer
  module Protocol
    module Interface
      class RequestMessage < Base
        define_attribute_methods(:id, :method, :params)

        def initialize(id:, method:, params: nil)
          super
        end
      end
    end
  end
end
