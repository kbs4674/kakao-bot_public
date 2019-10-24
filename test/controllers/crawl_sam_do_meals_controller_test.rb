require 'test_helper'

class CrawlSamDoMealsControllerTest < ActionDispatch::IntegrationTest
  test "should get samcheock_meal_normal_json" do
    get crawl_sam_do_meals_samcheock_meal_normal_json_url
    assert_response :success
  end

  test "should get samcheock_meal_rice_topping_json" do
    get crawl_sam_do_meals_samcheock_meal_rice_topping_json_url
    assert_response :success
  end

  test "should get samcheock_meal_special_json" do
    get crawl_sam_do_meals_samcheock_meal_special_json_url
    assert_response :success
  end

  test "should get samcheock_meal_dormitory_json" do
    get crawl_sam_do_meals_samcheock_meal_dormitory_json_url
    assert_response :success
  end

  test "should get dogye_meal_normal_json" do
    get crawl_sam_do_meals_dogye_meal_normal_json_url
    assert_response :success
  end

  test "should get dogye_meal_rice_topping_json" do
    get crawl_sam_do_meals_dogye_meal_rice_topping_json_url
    assert_response :success
  end

  test "should get dogye_meal_staff_json" do
    get crawl_sam_do_meals_dogye_meal_staff_json_url
    assert_response :success
  end

  test "should get dogye_meal_dormitory_json" do
    get crawl_sam_do_meals_dogye_meal_dormitory_json_url
    assert_response :success
  end

end
