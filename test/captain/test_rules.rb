require 'minitest/autorun'
require_relative '../../lib/captain/rules'

class TestRules < Minitest::Test
  def test_validate_rules
    rules = Captain::Rules.new(['foo', "\n", 'baz'])
    assert rules.validate! == true
  end
end
