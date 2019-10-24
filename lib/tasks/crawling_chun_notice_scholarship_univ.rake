## rake "crawling_chun_notice_scholarship_univ:crawling_chun_notice_scholarship_univ"

namespace :crawling_chun_notice_scholarship_univ do
  require 'nokogiri'
  require 'open-uri'
  
  task crawling_chun_notice_scholarship_univ: :environment do

    #크롤링(nokogiri) : 강원대학교 장학안내(첫 번째 글)
    doc = Nokogiri::HTML(open("http://www.kangwon.ac.kr/www/index.do"))
    @posts = doc.css('#tab3_cont > .first_cont')
    @posts.each do |x|
      @tit = x.css('p.tit').text.gsub("전체", "").gsub("춘천", "").gsub("삼척", "").gsub("도계", "").gsub("삼척·도계", "").gsub(/[\r\n\t]/, "")
      @camp = x.css('span.campus').text.gsub(/[\r\n\t]/, "")
      @date1 = x.css('.date_area > span.year_month').text.gsub(". ", "-").gsub(/[\r\n\t]/, "")
      @date2 = x.css('.date_area > span.day').text.gsub(/[\r\n\t]/, "")
      @res = CrawlChunNotice.create(kind: "대학장학", title: @tit, campus: @camp, date: "#{@date1}-#{@date2}")
      @res.save
    end
    
    #크롤링(nokogiri) : 강원대학교 장학안내
    @posts = doc.css('#tab3_cont > ul > li')
    @posts.each do |x|
      @tit = x.css('a').text.gsub(/[\r\n\t]/, "")
      @camp = x.css('span.campus').text.gsub(/[\r\n\t]/, "")
      @date = x.css('span.date').text.gsub(/[\r\n\t]/, "")
      @res = CrawlChunNotice.create(kind: "대학장학", title: @tit, campus: @camp, date: @date)
      @res.save
    end
    
  end
end