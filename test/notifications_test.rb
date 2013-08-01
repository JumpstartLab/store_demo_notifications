require './test/test_helper'
require 'notifications'

class NotificationsTest < Minitest::Test
  def test_wired_together
    assert_equal 42, Notifications.answer
  end
end
