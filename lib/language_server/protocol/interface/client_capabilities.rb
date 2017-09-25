module LanguageServer
  module Protocol
    module Interface
      class ClientCapabilities < Base
        define_attribute_methods(:workspace, :text_document, :experimental)

        def initialize(workspace: nil, text_document: nil, experimental: nil)
          super
        end
      end
    end
  end
end
