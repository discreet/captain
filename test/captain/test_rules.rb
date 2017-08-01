require 'minitest/autorun'
require_relative '../../lib/captain/rules'

class TestRules < Minitest::Test
  def test_validate_rules
    rules = Captain::Rules.new(%w[title \n body])
    assert rules.validate! == true
  end
end
