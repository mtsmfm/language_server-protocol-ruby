module LanguageServer
  module Protocol
    module Interface
      #
      # Text document specific client capabilities.
      #
      class TextDocumentClientCapabilities < Base
        attr_optional_keys :synchronization, :completion, :hover,
          :signature_help, :references, :document_highlight,
          :document_symbol, :formatting, :range_formatting,
          :on_type_formatting, :definition, :code_action,
          :code_lens, :document_link, :renamenil
      end
    end
  end
end
