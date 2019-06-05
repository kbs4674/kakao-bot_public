## rake "crawling_chun_notice:crawling_chun_notice"

namespace :crawling_chun_notice do
  require 'nokogiri'
  require 'open-uri'
  
  task crawling_chun_notice: :environment do
    
    CrawlChunNotice.all.each do |x|
      if Time.now - x.created_at <= 15.days
        x.destroy
      end
    end

    #크롤링(nokogiri) : 강원대학교 공지사항(첫 번째 글)
    doc = Nokogiri::HTML(open("http://www.kangwon.ac.kr/www/index.do"))
    @posts = doc.css('#tab1_cont > .first_cont')
    @posts.each do |x|
      @tit = x.css('p.tit').text.gsub("전체", "").gsub("춘천", "").gsub("삼척", "").gsub("도계", "").gsub("삼척·도계", "")
      @camp = x.css('span.campus').text
      @date1 = x.css('.date_area > span.year_month').text.gsub(". ", "-")
      @date2 = x.css('.date_area > span.day').text
      @res = CrawlChunNotice.create(kind: "공지사항", title: @tit, campus: @camp, date: "#{@date1}-#{@date2}")
      @res.save
    end
    
    #크롤링(nokogiri) : 강원대학교 공지사항
    @posts = doc.css('#tab1_cont > ul > li')
    @posts.each do |x|
      @tit = x.css('a').text
      @camp = x.css('span.campus').text
      @date = x.css('span.date').text
      @res = CrawlChunNotice.create(kind: "공지사항", title: @tit, campus: @camp, date: @date)
      @res.save
    end
    
  end
end