module LanguageServer
  module Protocol
    module Constant
      autoload :CompletionItemKind, "language_server/protocol/constant/completion_item_kind"
      autoload :CompletionTriggerKind, "language_server/protocol/constant/completion_trigger_kind"
      autoload :DiagnosticSeverity, "language_server/protocol/constant/diagnostic_severity"
      autoload :DocumentHighlightKind, "language_server/protocol/constant/document_highlight_kind"
      autoload :ErrorCodes, "language_server/protocol/constant/error_codes"
      autoload :FileChangeType, "language_server/protocol/constant/file_change_type"
      autoload :InitializeError, "language_server/protocol/constant/initialize_error"
      autoload :InsertTextFormat, "language_server/protocol/constant/insert_text_format"
      autoload :MarkupKind, "language_server/protocol/constant/markup_kind"
      autoload :MessageType, "language_server/protocol/constant/message_type"
      autoload :SymbolKind, "language_server/protocol/constant/symbol_kind"
      autoload :TextDocumentSaveReason, "language_server/protocol/constant/text_document_save_reason"
      autoload :TextDocumentSyncKind, "language_server/protocol/constant/text_document_sync_kind"
      autoload :WatchKind, "language_server/protocol/constant/watch_kind"

      require "language_server/protocol/constant/completion_item_kind"
      require "language_server/protocol/constant/completion_trigger_kind"
      require "language_server/protocol/constant/diagnostic_severity"
      require "language_server/protocol/constant/document_highlight_kind"
      require "language_server/protocol/constant/error_codes"
      require "language_server/protocol/constant/file_change_type"
      require "language_server/protocol/constant/initialize_error"
      require "language_server/protocol/constant/insert_text_format"
      require "language_server/protocol/constant/markup_kind"
      require "language_server/protocol/constant/message_type"
      require "language_server/protocol/constant/symbol_kind"
      require "language_server/protocol/constant/text_document_save_reason"
      require "language_server/protocol/constant/text_document_sync_kind"
      require "language_server/protocol/constant/watch_kind"
    end
  end
end
