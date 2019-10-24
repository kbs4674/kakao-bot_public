require 'test_helper'

class InvitesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get invites_index_url
    assert_response :success
  end

  test "should get create" do
    get invites_create_url
    assert_response :success
  end

  test "should get destroy" do
    get invites_destroy_url
    assert_response :success
  end

end
