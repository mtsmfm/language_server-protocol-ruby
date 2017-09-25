module LanguageServer
  module Protocol
    module Interface
      class ServerCapabilities < Base
        attr_optional_keys :text_document_sync, :hover_provider, :completion_provider,
          :signature_help_provider, :definition_provider, :references_provider,
          :document_highlight_provider, :document_symbol_provider, :workspace_symbol_provider,
          :code_action_provider, :code_lens_provider, :document_formatting_provider,
          :document_range_formatting_provider, :document_on_type_formatting_provider,
          :rename_provider, :document_link_provider, :execute_command_provider, :experimentalnil
      end
    end
  end
end
