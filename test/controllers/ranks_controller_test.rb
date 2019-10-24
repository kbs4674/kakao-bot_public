require 'test_helper'

class RanksControllerTest < ActionDispatch::IntegrationTest
  test "should get opgg_lol" do
    get ranks_opgg_lol_url
    assert_response :success
  end

  test "should get opgg_lol_json" do
    get ranks_opgg_lol_json_url
    assert_response :success
  end

  test "should get opgg_lol_current_game" do
    get ranks_opgg_lol_current_game_url
    assert_response :success
  end

  test "should get opgg_lol_current_game_json" do
    get ranks_opgg_lol_current_game_json_url
    assert_response :success
  end

  test "should get naver_music" do
    get ranks_naver_music_url
    assert_response :success
  end

  test "should get naver_music_json" do
    get ranks_naver_music_json_url
    assert_response :success
  end

end
