require "test_helper"
require "open3"
require 'active_support/all'

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

  def to_jsonrpc(hash)
    hash_str = hash.to_json

    "Content-Length: #{hash_str.bytesize}\r\n" + "\r\n" + hash_str
  end
end
