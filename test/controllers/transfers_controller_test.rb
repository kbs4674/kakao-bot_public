require 'test_helper'

class TransfersControllerTest < ActionDispatch::IntegrationTest
  test "should get itx" do
    get transfers_itx_url
    assert_response :success
  end

  test "should get subway" do
    get transfers_subway_url
    assert_response :success
  end

end
