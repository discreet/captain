require 'minitest/autorun'
require_relative '../../lib/captain/changes'

class TestChanges < Minitest::Test
  def test_changes_in_present_directory
    changes = Captain::Changes.new('.')
    assert changes.directory == Dir.pwd
  end

  # figure out how to test changed? method
end
