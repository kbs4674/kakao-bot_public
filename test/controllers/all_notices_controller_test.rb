require 'test_helper'

class AllNoticesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @all_notice = all_notices(:one)
  end

  test "should get index" do
    get all_notices_url
    assert_response :success
  end

  test "should get new" do
    get new_all_notice_url
    assert_response :success
  end

  test "should create all_notice" do
    assert_difference('AllNotice.count') do
      post all_notices_url, params: { all_notice: { content: @all_notice.content, title: @all_notice.title, user_id: @all_notice.user_id } }
    end

    assert_redirected_to all_notice_url(AllNotice.last)
  end

  test "should show all_notice" do
    get all_notice_url(@all_notice)
    assert_response :success
  end

  test "should get edit" do
    get edit_all_notice_url(@all_notice)
    assert_response :success
  end

  test "should update all_notice" do
    patch all_notice_url(@all_notice), params: { all_notice: { content: @all_notice.content, title: @all_notice.title, user_id: @all_notice.user_id } }
    assert_redirected_to all_notice_url(@all_notice)
  end

  test "should destroy all_notice" do
    assert_difference('AllNotice.count', -1) do
      delete all_notice_url(@all_notice)
    end

    assert_redirected_to all_notices_url
  end
end
