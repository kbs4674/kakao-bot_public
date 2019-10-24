require 'test_helper'

class BotEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy_comment" do
    get bot_events_destroy_comment_url
    assert_response :success
  end

end
