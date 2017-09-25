require "test_helper"

class LanguageServer::Protocol::Interface::BaseTest < Minitest::Test
  def build_class(parent_class = LanguageServer::Protocol::Interface::Base)
    Class.new(parent_class)
  end

  def test_that_it_has_a_contained_rpc_version
    base = LanguageServer::Protocol::Interface::Base.new
    assert { base.attributes[:jsonrpc] == '2.0' }
  end

  def test_that_it_required_keys
    inherited_interface = build_class
    inherited_interface.define_required_keys(:key)

    assert_raises(ArgumentError) do
      inherited_interface.new
    end

    # not raised
    inherited_interface.new(key: 'value')
  end

  def test_that_it_does_not_inherit_required_keys_from_parent_class
    parent_class = build_class
    parent_class.define_required_keys(:key)
    assert_equal(parent_class.required_keys, [:key])

    child_class = build_class(parent_class)
    assert_empty(child_class.required_keys)
  end

  def test_that_it_defines_accessor_method
    klass = build_class
    klass.define_required_keys(:key)

    instance = klass.new(key: 'value')
    assert(instance.key, 'value')
  end
end
