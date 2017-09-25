module LanguageServer
  module Protocol
    module Interface
      class NotificationMessage < Base
        define_attribute_methods(:method, :params)

        def initialize(method:, params: nil)
          super
        end
      end
    end
  end
end
