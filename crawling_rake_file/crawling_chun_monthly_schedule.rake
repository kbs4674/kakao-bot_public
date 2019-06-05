## rake "crawling_chun_monthly_schedule:crawling_chun_monthly_schedule"

namespace :crawling_chun_monthly_schedule do
  require 'nokogiri'
  require 'open-uri'
  require 'mechanize'
  
  task crawling_chun_monthly_schedule: :environment do

    CrawlChunMonthlySchedule.all.each do |x|
      x.destroy
    end
    
    #크롤링(nokogiri) : 강원대학교 학사일정
    doc = Nokogiri::HTML(open("http://www.kangwon.ac.kr/www/index.do"))
    @univ_array_title = Array.new;
    @univ_array_time = Array.new;
    @univ = doc.css("#container > section.layer.layer3 > div > section.schedule > ul > li > a")
    @univ.each do |x|
      @tit = x.css("span.text").text
      @time = x.css("span.date").text
      CrawlChunMonthlySchedule.create(title: @tit, date: @time)
    end
    
  end
end