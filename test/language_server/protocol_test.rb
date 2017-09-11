require "test_helper"

class LanguageServer::ProtocolTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::LanguageServer::Protocol::VERSION
  end

  def test_it_does_something_useful
    assert false
  end
end
