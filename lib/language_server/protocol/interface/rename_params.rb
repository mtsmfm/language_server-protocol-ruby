module LanguageServer
  module Protocol
    module Interface
      class RenameParams < Base
        attr_required_keys :text_document, :position, :new_name
      end
    end
  end
end
