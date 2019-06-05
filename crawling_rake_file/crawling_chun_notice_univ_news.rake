## rake "crawling_chun_notice_univ_news:crawling_chun_notice_univ_news"

namespace :crawling_chun_notice_univ_news do
  require 'nokogiri'
  require 'open-uri'
  
  task crawling_chun_notice_univ_news: :environment do
    
    #크롤링(nokogiri) : 강원대학교 학사일정(첫 번째 글)
    doc = Nokogiri::HTML(open("http://www.kangwon.ac.kr/www/index.do"))
    @posts = doc.css('#tab2_cont > .first_cont')
    @posts.each do |x|
      @tit = x.css('p.tit').text.gsub("전체", "").gsub("춘천", "").gsub("삼척", "").gsub("도계", "").gsub("삼척·도계", "")
      @camp = x.css('span.campus').text
      @date1 = x.css('.date_area > span.year_month').text.gsub(". ", "-")
      @date2 = x.css('.date_area > span.day').text
      @res = CrawlChunNotice.create(kind: "학사공지", title: @tit, campus: @camp, date: "#{@date1}-#{@date2}")
      @res.save
    end
    
    #크롤링(nokogiri) : 강원대학교 학사일정
    @posts = doc.css('#tab2_cont > ul > li')
    @posts.each do |x|
      @tit = x.css('a').text
      @camp = x.css('span.campus').text
      @date = x.css('span.date').text
      @res = CrawlChunNotice.create(kind: "학사공지", title: @tit, campus: @camp, date: @date)
      @res.save
    end
    
  end
end