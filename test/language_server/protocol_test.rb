require "test_helper"
require "open3"
require 'active_support/all'

LSP = LanguageServer::Protocol

class LanguageServer::ProtocolTest < Minitest::Test
  [
    "ruby -r bundler/setup test/example.rb",
    "ruby -r bundler/setup -r active_support/all test/example.rb"
  ].each do |command|
    define_method "test_initialize_with_`#{command}`" do
      stdin, stdout, stderr, wait_thr = Open3.popen3(command)

      stdin.print to_jsonrpc(jsonrpc: 2.0, id: 0, method: :initialize, params: {processId: 1234})

      wait_thr.join(1)

      expected_body = {
        "id"=>0,
        "result"=>{"capabilities"=>{"textDocumentSync"=>{"change"=>1}, "completionProvider"=>{"resolveProvider"=>true, "triggerCharacters"=>["."]}, "definitionProvider"=>true}},
        "jsonrpc"=>"2.0"
      }

      assert { stdout.read == to_jsonrpc(expected_body) }
      assert { stderr.read == "" }
    end
  end

  def test_transport_io
    io = StringIO.new
    writer = LSP::Transport::Io::Writer.new(io)
    reader = LSP::Transport::Io::Reader.new(io)
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

    io.print to_jsonrpc(jsonrpc: 2.0, id: 0, method: :initialize, params: {processId: 1234})
    io.rewind

    reader.read do |request|
      assert { request[:method] == "initialize" }

      result = subscribers[request[:method].to_sym].call
      writer.write(id: request[:id], result: result)
    end

    expected_body = {
      "id"=>0,
      "result"=>{"capabilities"=>{"textDocumentSync"=>{"change"=>1}, "completionProvider"=>{"resolveProvider"=>true, "triggerCharacters"=>["."]}, "definitionProvider"=>true}},
      "jsonrpc"=>"2.0"
    }
    io.ungetc to_jsonrpc(expected_body)

    assert { io.read == to_jsonrpc(expected_body) }
  end

  def to_jsonrpc(hash)
    hash_str = hash.to_json

    "Content-Length: #{hash_str.bytesize}\r\n" + "\r\n" + hash_str
  end

  def test_sub_interface_set_super_attributes
    identifier = LSP::Interface::VersionedTextDocumentIdentifier.new(
      uri: "http://example.com",
      version: 1
    )

    assert { identifier.attributes == { uri: "http://example.com", version: 1 } }
  end
end
