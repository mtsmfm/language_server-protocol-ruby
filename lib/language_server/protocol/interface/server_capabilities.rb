module LanguageServer
  module Protocol
    module Interface
      class ServerCapabilities < Base
        #
        # Defines how text documents are synced. Is either a detailed structure defining each notification or
        # for backwards compatibility the TextDocumentSyncKind number.
        #
        # @return [number | TextDocumentSyncOptions]
        define_attribute_method :text_document_sync

        #
        # The server provides hover support.
        #
        # @return [boolean]
        define_attribute_method :hover_provider

        #
        # The server provides completion support.
        #
        # @return [CompletionOptions]
        define_attribute_method :completion_provider

        #
        # The server provides signature help support.
        #
        # @return [SignatureHelpOptions]
        define_attribute_method :signature_help_provider

        #
        # The server provides goto definition support.
        #
        # @return [boolean]
        define_attribute_method :definition_provider

        #
        # The server provides find references support.
        #
        # @return [boolean]
        define_attribute_method :references_provider

        #
        # The server provides document highlight support.
        #
        # @return [boolean]
        define_attribute_method :document_highlight_provider

        #
        # The server provides document symbol support.
        #
        # @return [boolean]
        define_attribute_method :document_symbol_provider

        #
        # The server provides workspace symbol support.
        #
        # @return [boolean]
        define_attribute_method :workspace_symbol_provider

        #
        # The server provides code actions.
        #
        # @return [boolean]
        define_attribute_method :code_action_provider

        #
        # The server provides code lens.
        #
        # @return [CodeLensOptions]
        define_attribute_method :code_lens_provider

        #
        # The server provides document formatting.
        #
        # @return [boolean]
        define_attribute_method :document_formatting_provider

        #
        # The server provides document range formatting.
        #
        # @return [boolean]
        define_attribute_method :document_range_formatting_provider

        #
        # The server provides document formatting on typing.
        #
        # @return [DocumentOnTypeFormattingOptions]
        define_attribute_method :document_on_type_formatting_provider

        #
        # The server provides rename support.
        #
        # @return [boolean]
        define_attribute_method :rename_provider

        #
        # The server provides document link support.
        #
        # @return [DocumentLinkOptions]
        define_attribute_method :document_link_provider

        #
        # The server provides execute command support.
        #
        # @return [ExecuteCommandOptions]
        define_attribute_method :execute_command_provider

        #
        # Experimental server capabilities.
        #
        # @return [any]
        define_attribute_method :experimental

        def initialize(text_document_sync: nil, hover_provider: nil, completion_provider: nil, signature_help_provider: nil, definition_provider: nil, references_provider: nil, document_highlight_provider: nil, document_symbol_provider: nil, workspace_symbol_provider: nil, code_action_provider: nil, code_lens_provider: nil, document_formatting_provider: nil, document_range_formatting_provider: nil, document_on_type_formatting_provider: nil, rename_provider: nil, document_link_provider: nil, execute_command_provider: nil, experimental: nil)
          super
        end
      end
    end
  end
end
