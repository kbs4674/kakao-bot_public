require 'test_helper'

class KakaoBotRandomTipsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get kakao_bot_random_tips_index_url
    assert_response :success
  end

end
