require "test_helper"

class LanguageServer::Protocol::Interface::BaseTest < Minitest::Test
  def test_that_it_has_a_contained_rpc_version
    base = LanguageServer::Protocol::Interface::Base.new
    assert { base.attributes[:jsonrpc] == '2.0' }
  end
end
