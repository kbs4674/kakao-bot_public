## rake "crawling_hangang_temperature:crawling_hangang_temperature"

namespace :crawling_hangang_temperature do
  require 'nokogiri'
  require 'open-uri'
  require 'mechanize'
  
  task crawling_hangang_temperature: :environment do

    CrawlHangangTemp.all.each do |x|
      x.destroy
    end
  
    doc = Nokogiri::HTML(open("https://www.wpws.kr/hangang/"))
    @temp = doc.css("#temp").text
    CrawlHangangTemp.create(title: @temp)
    
  end
end