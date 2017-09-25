module LanguageServer
  module Protocol
    module Interface
      class RenameParams < Base
        define_attribute_methods(:text_document, :position, :new_name)

        def initialize(text_document:, position:, new_name:)
          super
        end
      end
    end
  end
end
