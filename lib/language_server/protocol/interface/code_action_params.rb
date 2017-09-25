module LanguageServer
  module Protocol
    module Interface
      #
      # Params for the CodeActionRequest
      #
      class CodeActionParams < Base
        attr_required_keys :text_document, :range, :context
      end
    end
  end
end
