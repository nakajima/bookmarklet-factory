require File.dirname(__FILE__) + '/../test_helper'

class SpamCheckerTest < ActiveSupport::TestCase
  def test_not_spammy
    assert ! SpamChecker.new("function() { }").spam?
  end

  def test_spammy_when_does_not_include_function
    assert SpamChecker.new("something").spam?
  end
end
