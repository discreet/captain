require 'minitest/autorun'
require_relative '../../lib/captain/version'

class TestVersion < Minitest::Test
  def test_get_current_increment
    properties = "foo\nmajor\nbar"
    increment = properties[/major$|minor$|patch$/]
    assert increment == 'major'
  end

  def test_change_current_increment
    properties = "foo\nmajor\nbar"
    version = 'patch'
    new_increment = properties.gsub(/(major$|minor$|patch$)/, version)
    assert new_increment.include?('patch')
  end
end
