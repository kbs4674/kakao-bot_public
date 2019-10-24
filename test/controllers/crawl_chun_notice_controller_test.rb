require 'test_helper'

class CrawlChunNoticeControllerTest < ActionDispatch::IntegrationTest
  test "should get campus_notice" do
    get crawl_chun_notice_campus_notice_url
    assert_response :success
  end

end
