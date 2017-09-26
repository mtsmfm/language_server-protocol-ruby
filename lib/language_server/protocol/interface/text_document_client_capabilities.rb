module LanguageServer
  module Protocol
    module Interface
      #
      # Text document specific client capabilities.
      #
      class TextDocumentClientCapabilities < Base
        # @return [{ dynamicRegistration?: boolean; willSave?: boolean; willSaveWaitUntil?: boolean; didSave?: boole...]
        define_attribute_method :synchronization

        #
        # Capabilities specific to the `textDocument/completion`
        #
        # @return [{ dynamicRegistration?: boolean; completionItem?: { snippetSupport?: boolean; }; }]
        define_attribute_method :completion

        #
        # Capabilities specific to the `textDocument/hover`
        #
        # @return [{ dynamicRegistration?: boolean; }]
        define_attribute_method :hover

        #
        # Capabilities specific to the `textDocument/signatureHelp`
        #
        # @return [{ dynamicRegistration?: boolean; }]
        define_attribute_method :signature_help

        #
        # Capabilities specific to the `textDocument/references`
        #
        # @return [{ dynamicRegistration?: boolean; }]
        define_attribute_method :references

        #
        # Capabilities specific to the `textDocument/documentHighlight`
        #
        # @return [{ dynamicRegistration?: boolean; }]
        define_attribute_method :document_highlight

        #
        # Capabilities specific to the `textDocument/documentSymbol`
        #
        # @return [{ dynamicRegistration?: boolean; }]
        define_attribute_method :document_symbol

        #
        # Capabilities specific to the `textDocument/formatting`
        #
        # @return [{ dynamicRegistration?: boolean; }]
        define_attribute_method :formatting

        #
        # Capabilities specific to the `textDocument/rangeFormatting`
        #
        # @return [{ dynamicRegistration?: boolean; }]
        define_attribute_method :range_formatting

        #
        # Capabilities specific to the `textDocument/onTypeFormatting`
        #
        # @return [{ dynamicRegistration?: boolean; }]
        define_attribute_method :on_type_formatting

        #
        # Capabilities specific to the `textDocument/definition`
        #
        # @return [{ dynamicRegistration?: boolean; }]
        define_attribute_method :definition

        #
        # Capabilities specific to the `textDocument/codeAction`
        #
        # @return [{ dynamicRegistration?: boolean; }]
        define_attribute_method :code_action

        #
        # Capabilities specific to the `textDocument/codeLens`
        #
        # @return [{ dynamicRegistration?: boolean; }]
        define_attribute_method :code_lens

        #
        # Capabilities specific to the `textDocument/documentLink`
        #
        # @return [{ dynamicRegistration?: boolean; }]
        define_attribute_method :document_link

        #
        # Capabilities specific to the `textDocument/rename`
        #
        # @return [{ dynamicRegistration?: boolean; }]
        define_attribute_method :rename

        def initialize(synchronization: nil, completion: nil, hover: nil, signature_help: nil, references: nil, document_highlight: nil, document_symbol: nil, formatting: nil, range_formatting: nil, on_type_formatting: nil, definition: nil, code_action: nil, code_lens: nil, document_link: nil, rename: nil)
          super
        end
      end
    end
  end
end
