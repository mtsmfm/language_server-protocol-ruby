require "test_helper"

class LanguageServer::Protocol::UtilsTest < Minitest::Test
  def test_lower_camerize
    value_and_expected = {
      'capital' => 'capital',
      'capital_of_american' => 'capitalOfAmerican',
      'capitalOfAmerican' => 'capitalOfAmerican',
      'CapitalOfAmerican' => 'capitalOfAmerican'
    }

    value_and_expected.each do |value, expected|
      assert_equal(LanguageServer::Protocol::Utils.to_lower_camerize(value), expected)
    end
  end
end
