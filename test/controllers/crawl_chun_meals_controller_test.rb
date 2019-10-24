require 'test_helper'

class CrawlChunMealsControllerTest < ActionDispatch::IntegrationTest
  test "should get dor_normal" do
    get crawl_chun_meals_dor_normal_url
    assert_response :success
  end

  test "should get old_btl" do
    get crawl_chun_meals_old_btl_url
    assert_response :success
  end

  test "should get new_btl" do
    get crawl_chun_meals_new_btl_url
    assert_response :success
  end

  test "should get bak" do
    get crawl_chun_meals_bak_url
    assert_response :success
  end

  test "should get cheon" do
    get crawl_chun_meals_cheon_url
    assert_response :success
  end

end
