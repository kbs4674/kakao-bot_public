require 'test_helper'

class AlarmsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get alarms_index_url
    assert_response :success
  end

end
