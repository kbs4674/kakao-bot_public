require 'test_helper'

class CrawlingEverytimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @crawling_everytime = crawling_everytimes(:one)
  end

  test "should get index" do
    get crawling_everytimes_url
    assert_response :success
  end

  test "should get new" do
    get new_crawling_everytime_url
    assert_response :success
  end

  test "should create crawling_everytime" do
    assert_difference('CrawlingEverytime.count') do
      post crawling_everytimes_url, params: { crawling_everytime: { article_id: @crawling_everytime.article_id, category_id: @crawling_everytime.category_id, category_name: @crawling_everytime.category_name, comment_content: @crawling_everytime.comment_content, comment_id: @crawling_everytime.comment_id, content: @crawling_everytime.content, title: @crawling_everytime.title } }
    end

    assert_redirected_to crawling_everytime_url(CrawlingEverytime.last)
  end

  test "should show crawling_everytime" do
    get crawling_everytime_url(@crawling_everytime)
    assert_response :success
  end

  test "should get edit" do
    get edit_crawling_everytime_url(@crawling_everytime)
    assert_response :success
  end

  test "should update crawling_everytime" do
    patch crawling_everytime_url(@crawling_everytime), params: { crawling_everytime: { article_id: @crawling_everytime.article_id, category_id: @crawling_everytime.category_id, category_name: @crawling_everytime.category_name, comment_content: @crawling_everytime.comment_content, comment_id: @crawling_everytime.comment_id, content: @crawling_everytime.content, title: @crawling_everytime.title } }
    assert_redirected_to crawling_everytime_url(@crawling_everytime)
  end

  test "should destroy crawling_everytime" do
    assert_difference('CrawlingEverytime.count', -1) do
      delete crawling_everytime_url(@crawling_everytime)
    end

    assert_redirected_to crawling_everytimes_url
  end
end
