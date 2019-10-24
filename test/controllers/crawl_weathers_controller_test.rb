require 'test_helper'

class CrawlWeathersControllerTest < ActionDispatch::IntegrationTest
  test "should get weather" do
    get crawl_weathers_weather_url
    assert_response :success
  end

  test "should get fine_dust" do
    get crawl_weathers_fine_dust_url
    assert_response :success
  end

  test "should get micro_fine_dust" do
    get crawl_weathers_micro_fine_dust_url
    assert_response :success
  end

end
