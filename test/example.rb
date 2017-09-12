require "language_server-protocol"

module LanguageServer::Protocol
  writer = Transport::Stdio::Writer.new
  reader = Transport::Stdio::Reader.new

  subscribers = {
    initialize: -> {
      Interface::InitializeResult.new(
        capabilities: Interface::ServerCapabilities.new(
          text_document_sync: Interface::TextDocumentSyncOptions.new(
          change: Constant::TextDocumentSyncKind::FULL
        ),
        completion_provider: Interface::CompletionOptions.new(
          resolve_provider: true,
          trigger_characters: %w(.)
        ),
        definition_provider: true
        )
      )
    }
  }

  reader.read do |request|
    result = subscribers[request[:method].to_sym].call
    writer.write(id: request[:id], result: result)
    exit
  end
end
