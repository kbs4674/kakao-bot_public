## rake "crawling_chun_monthly_schedule:crawling_chun_monthly_schedule"

namespace :crawling_chun_monthly_schedule do
  require 'nokogiri'
  require 'open-uri'
  
  task crawling_chun_monthly_schedule: :environment do
    
    #크롤링(nokogiri) : 강원대학교 매월 학사일정
    doc = Nokogiri::HTML(open("http://www.kangwon.ac.kr/www/index.do"))
    @univ = doc.css("#container > section.layer.layer3 > div > section.schedule > ul > li > a")
    @univ.each do |x|
      @tit = x.css("span.text").text
      @date = x.css("span.date").text
      @res = CrawlChunNotice.create(kind: "월별 학사일정(춘천)", title: @tit, campus: "춘천", date: @date)
    end
    
  end
end