module LanguageServer
  module Protocol
    module Interface
      class ServerCapabilities < Base
        define_attribute_methods(:text_document_sync, :hover_provider, :completion_provider, :signature_help_provider, :definition_provider, :references_provider, :document_highlight_provider, :document_symbol_provider, :workspace_symbol_provider, :code_action_provider, :code_lens_provider, :document_formatting_provider, :document_range_formatting_provider, :document_on_type_formatting_provider, :rename_provider, :document_link_provider, :execute_command_provider, :experimentalnil)

        def initialize(text_document_sync: nil, hover_provider: nil, completion_provider: nil, signature_help_provider: nil, definition_provider: nil, references_provider: nil, document_highlight_provider: nil, document_symbol_provider: nil, workspace_symbol_provider: nil, code_action_provider: nil, code_lens_provider: nil, document_formatting_provider: nil, document_range_formatting_provider: nil, document_on_type_formatting_provider: nil, rename_provider: nil, document_link_provider: nil, execute_command_provider: nil, experimentalnil: nil)
          super
        end
      end
    end
  end
end
