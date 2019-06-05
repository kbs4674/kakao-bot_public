## rake "crawling_fine_dust_gangwon:crawling_fine_dust_gangwon"

namespace :crawling_fine_dust_gangwon do
  require 'rubygems'
  require 'rest_client'
  require 'cgi'
  
  task crawling_fine_dust_gangwon: :environment do
    
    CrawlChunFineDust.all.each do |x|
      x.destroy
    end

    # API DB 최신화 : 미세먼지
    url = "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getCtprvnRltmMesureDnsty?serviceKey=#{ENV["GO_DATA_API"]}"
    headers = { :params => { CGI::escape('numOfRows') => '30',CGI::escape('pageNo') => '1', CGI::escape('sidoName') => "강원", CGI::escape('ver') => "1.3" } }
    @finedust = RestClient::Request.execute :method => 'GET', :url => url , :headers => headers
    @finedust_to_xml = @finedust.body
    @doc = Nokogiri::XML(@finedust_to_xml)
    # 미세먼지 Attribute Mapping
    @finedust_time = @doc.xpath("//dataTime") # 미세먼지 측정시간
    @finedust_station = @doc.xpath("//stationName") # 시 내 지역(동, 읍 등)
    @finedest_pm10 = @doc.xpath("//pm10Value") # PM10 수치 (미세먼지)
    @finedest_pm25 = @doc.xpath("//pm25Value") # PM25 수치 (초미세먼지)
    
    @finedust_to_hash = @finedust_time.zip(@finedust_station, @finedest_pm10, @finedest_pm25) # 미세먼지 시간, 농도, 수치를 하나로 합침
    
    for num in 0..@finedust_to_hash.length-1
      @finedust_result = CrawlChunFineDust.new
      @finedust_result.province = "강원도"
      @finedust_result.time = @finedust_to_hash[num][0].text
      if (@finedust_to_hash[num][1].text == "석사동")
        @finedust_result.station = "춘천시 석사동"
      else
        @finedust_result.station = @finedust_to_hash[num][1].text
      end
      @finedust_result.pm10 = @finedust_to_hash[num][2].text
      @finedust_result.pm25 = @finedust_to_hash[num][3].text
      
      if ((@finedust_to_hash[num][2].text == "-"))
        @finedust_result.state = "측정결과 없음.. 🤔"
      elsif ((@finedust_to_hash[num][2].text.to_i >= 0) && (@finedust_to_hash[num][2].text.to_i < 30))
        @finedust_result.state = "좋음 😁"
      elsif ((@finedust_to_hash[num][2].text.to_i >= 30) && (@finedust_to_hash[num][2].text.to_i < 80))
        @finedust_result.state = "보통 😃"
      elsif ((@finedust_to_hash[num][2].text.to_i >= 80) && (@finedust_to_hash[num][2].text.to_i < 150))
        @finedust_result.state = "나쁨 😨"
      elsif ((@finedust_to_hash[num][2].text.to_i >= 150) && (@finedust_to_hash[num][2].text.to_i < 250))
        @finedust_result.state = "매.우.나.쁨. 💀"
      elsif ((@finedust_to_hash[num][2].text.to_i >= 250))
        @finedust_result.state = "💀 지구를 뜰 준비를 해야할 듯.. (최고심각) 💀"
      end
      
      if ((@finedust_to_hash[num][3].text == "-"))
        @finedust_result.state_micro = "측정결과 없음.. 🤔"
      elsif ((@finedust_to_hash[num][3].text.to_i >= 0) && (@finedust_to_hash[num][3].text.to_i < 15))
        @finedust_result.state_micro = "좋음 😁"
      elsif ((@finedust_to_hash[num][3].text.to_i >= 15) && (@finedust_to_hash[num][3].text.to_i < 35))
        @finedust_result.state_micro = "보통 😃"
      elsif ((@finedust_to_hash[num][3].text.to_i >= 35) && (@finedust_to_hash[num][3].text.to_i < 75))
        @finedust_result.state_micro = "나쁨 😨"
      elsif ((@finedust_to_hash[num][3].text.to_i >= 75) && (@finedust_to_hash[num][3].text.to_i < 150))
        @finedust_result.state_micro = "매.우.나.쁨. 💀"
      elsif ((@finedust_to_hash[num][3].text.to_i >= 150))
        @finedust_result.state_micro = "💀 지구를 뜰 준비를 해야할 듯.. (최고심각) 💀"
      end
      
      @finedust_result.save
    end
    
  end
end