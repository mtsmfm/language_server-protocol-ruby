require "test_helper"

class LanguageServer::Protocol::Interface::BaseTest < Minitest::Test
  def build_class(parent_class = LanguageServer::Protocol::Interface::Base)
    Class.new(parent_class)
  end

  def test_that_it_defines_required_keys
    inherited_interface = build_class
    inherited_interface.attr_required_keys(:required)

    assert_raises(ArgumentError) do
      inherited_interface.new
    end

    # not raised
    inherited_interface.new(required: 1)
  end

  def test_that_it_raises_argument_error_given_extra_keys
    inherited_interface = build_class

    assert_raises(ArgumentError) do
      inherited_interface.new(extra: 1)
    end
  end

  def test_that_it_defines_optional_keys
    inherited_interface = build_class
    inherited_interface.attr_optional_keys(:optional)

    # not raised
    inherited_interface.new(optional: 1)
  end

  def test_that_it_does_not_inherit_required_keys_from_parent_class
    parent_class = build_class
    parent_class.attr_required_keys(:required)
    assert_equal(parent_class.required_keys, [:required])

    child_class = build_class(parent_class)
    assert_empty(child_class.required_keys)
  end

  def test_that_it_defines_accessor_method
    klass = build_class
    klass.attr_required_keys(:required)
    klass.attr_optional_keys(:optional)

    instance = klass.new(required: 1, optional: 2)
    assert(instance.required, 1)
    assert(instance.optional, 2)
  end
end
