## rake "crawling_chun_student_header:crawling_chun_student_header"

namespace :crawling_chun_student_header do
  require 'nokogiri'
  require 'open-uri'
  
  task crawling_chun_student_header: :environment do
    
    # 크롤링(nokogiri) : 강원대학교 총학생회 공지사항
    doc = Nokogiri::HTML(open("http://www.knuch.com/notice/notice"))
    @posts = doc.css('#contents > div.board-list-div > table > tbody > tr')
    @posts.each do |x|
      @tit = x.css('td.subject').text
      @date = x.css('td:nth-child(4)').text
      @res = CrawlChunNotice.create(kind: "총학생회 공지", title: @tit.gsub(/[\r\n\t]/, ""), campus: "춘천", date: @date.gsub(/[\r\n\t]/, ""))
    end
    
  end
end