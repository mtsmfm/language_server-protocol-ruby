require "test_helper"

class LanguageServer::Protocol::Interface::BaseTest < Minitest::Test
  def test_that_it_assigns_lower_camel_case_keys
    instance = LanguageServer::Protocol::Interface::Base.new(underscore_case: 1)
    assert(instance.attributes[:underscoreCase], 1)
  end

  def test_that_it_does_not_inherit_required_keys_from_parent_class
    inherited_klass = Class.new(LanguageServer::Protocol::Interface::Base)
    inherited_klass.define_attribute_method(:key)
    instance = inherited_klass.new(key: 1)

    assert(instance.key, 1)
  end
end
