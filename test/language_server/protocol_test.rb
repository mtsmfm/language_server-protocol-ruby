require "test_helper"
require "open3"

class LanguageServer::ProtocolTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::LanguageServer::Protocol::VERSION
  end

  def test_initialize_call
    stdin, stdout, stderr, wait_thr = *Open3.popen3("bundle exec ruby test/example.rb")

    stdin.print to_jsonrpc(jsonrpc: 2.0, id: 0, method: :initialize, params: {processId: 1234})

    sleep 1 unless wait_thr.stop?

    expected_body = {
      "id"=>0,
      "result"=>{"capabilities"=>{"textDocumentSync"=>{"change"=>1}, "completionProvider"=>{"resolveProvider"=>true, "triggerCharacters"=>["."]}, "definitionProvider"=>true}},
      "jsonrpc"=>"2.0"
    }

    assert{ stdout.read == to_jsonrpc(expected_body) }
    assert { stderr.read == "" }
  end

  def to_jsonrpc(hash)
    hash_str = hash.to_json

    "Content-Length: #{hash_str.bytesize}\r\n" + "\r\n" + hash_str
  end
end
