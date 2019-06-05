## rake "crawling_chun_weather:crawling_chun_weather"

namespace :crawling_chun_weather do
  require 'rubygems'
  require 'rest_client'
  require 'cgi'
  
  task crawling_chun_weather: :environment do

    CrawlChunWeather.all.each do |x|
      x.destroy
    end
    
    # API DB 최신화
    url = "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastSpaceData?serviceKey=#{ENV["GO_DATA_API"]}"
    if Time.zone.now.strftime('%H00').to_i >= 0 && Time.zone.now.strftime('%H00').to_i < 900
      headers = { :params => { CGI::escape('numOfRows') => '50',CGI::escape('pageNo') => '1', CGI::escape('base_date') => "#{(Time.zone.now - 1.day).strftime('%Y%m%d')}", CGI::escape('base_time') => "0500", CGI::escape('nx') => '73', CGI::escape('ny') => '133' } }
    else
      headers = { :params => { CGI::escape('numOfRows') => '50',CGI::escape('pageNo') => '1', CGI::escape('base_date') => "#{Time.zone.now.strftime('%Y%m%d')}", CGI::escape('base_time') => "0500", CGI::escape('nx') => '73', CGI::escape('ny') => '133' } }
    end
    
    @weather = RestClient::Request.execute :method => 'GET', :url => url , :headers => headers
    @weather_to_xml = @weather.body
    @doc = Nokogiri::XML(@weather_to_xml)
    # category Mapping
    @weather_category = @doc.xpath("//category") # 3시간 기온(T3H), 하늘 상태(SKY), 강수확률(POP) 항목
    @weather_fcstValue = @doc.xpath("//fcstValue") # category 수치
    @weather_fcstTime = @doc.xpath("//fcstTime") # 예측 시간
    @weather_fcstDate = @doc.xpath("//fcstDate") # 예측 날짜
    
    @weather_to_hash = @weather_category.zip(@weather_fcstValue, @weather_fcstTime, @weather_fcstDate) # category, cstValue, fcstTime 변수를 하나의 배열로 합침
    
    
    # DB에 데이터가 쓰이는 코드
    for num in 0..50
      if (@weather_to_hash[num][0].text == "T3H" rescue false)
        @weather_result = CrawlChunWeather.new
        @weather_result.province ="강원도 춘천시"
        @weather_result.status = "3시간 기온"
        @weather_result.degree = @weather_to_hash[num][1].text
        @weather_result.time = @weather_to_hash[num][2].text
        @weather_result.date = @weather_to_hash[num][3].text
        @weather_result.save
      end
      if (@weather_to_hash[num][0].text == "POP" rescue false)
        @weather_result = CrawlChunWeather.new
        @weather_result.status = "강수확률"
        @weather_result.rainy = @weather_to_hash[num][1].text
        @weather_result.time = @weather_to_hash[num][2].text
        @weather_result.date = @weather_to_hash[num][3].text
        @weather_result.save
      end
    end
    
  end
end