## rake "crawling_chun_dorm_notice:crawling_chun_dorm_notice"

namespace :crawling_chun_dorm_notice do
  require 'nokogiri'
  require 'open-uri'
  
  task crawling_chun_dorm_notice: :environment do
    
    # 크롤링(nokogiri) : 강원대학교 기숙사 공지사항
    doc = Nokogiri::HTML(open("http://knudorm.kangwon.ac.kr/admin/board/list.jsp?board_nm=notice"))
    @posts = doc.css('table.Notice_Board > tbody > tr')
    @posts.each do |x|
      @tit = x.css('td.f_b').text
      @date = x.css('td:nth-child(4)').text
      if not @tit == ""
        @res = CrawlChunNotice.create(kind: "기숙사(춘천) 공지사항", title: @tit.gsub(/[\r\n\t]/, ""), campus: "춘천", date: @date.gsub(/[\r\n\t]/, ""))
      end
    end
    
  end
end