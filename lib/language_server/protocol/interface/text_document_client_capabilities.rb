module LanguageServer
  module Protocol
    module Interface
      #
      # Text document specific client capabilities.
      #
      class TextDocumentClientCapabilities < Base
        define_attribute_methods(:synchronization, :completion, :hover, :signature_help, :references, :document_highlight, :document_symbol, :formatting, :range_formatting, :on_type_formatting, :definition, :code_action, :code_lens, :document_link, :renamenil)

        def initialize(synchronization: nil, completion: nil, hover: nil, signature_help: nil, references: nil, document_highlight: nil, document_symbol: nil, formatting: nil, range_formatting: nil, on_type_formatting: nil, definition: nil, code_action: nil, code_lens: nil, document_link: nil, renamenil: nil)
          super
        end
      end
    end
  end
end
