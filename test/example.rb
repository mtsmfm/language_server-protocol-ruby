require "language_server-protocol"

LSP = LanguageServer::Protocol
writer = LSP::Transport::Stdio::Writer.new
reader = LSP::Transport::Stdio::Reader.new

subscribers = {
  initialize: -> {
    LSP::Interface::InitializeResult.new(
      capabilities: LSP::Interface::ServerCapabilities.new(
        text_document_sync: LSP::Interface::TextDocumentSyncOptions.new(
        change: LSP::Constant::TextDocumentSyncKind::FULL
      ),
      completion_provider: LSP::Interface::CompletionOptions.new(
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
