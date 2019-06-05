## rake "crawling_chun_meal_rice_topping:crawling_chun_meal_rice_topping"
## 천지관 덮밥 메뉴

namespace :crawling_chun_meal_rice_topping do
  require 'nokogiri'
  require 'open-uri'
  require 'mechanize'
  
  task crawling_chun_meal_rice_topping: :environment do

    # 천지관 교직원 식단 메뉴
    doc2 = Nokogiri::HTML(open("http://knucoop.kangwon.ac.kr/weekly_menu_01.asp"))
    @chun_meal_analyst = doc2.css('table > tbody')
    @chun_meal_analyst.each do |x|
      # 월요일 식단
      if Time.zone.now.strftime("%A") == "Monday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          chun_meal = doc2.css('tr:nth-child(6) > td:nth-child(3)').text.strip
          @cheon_meal_time = "점심"
          @result_day = Time.zone.now.strftime('%m월 %d일')
        end
      end
      
      # 화요일 식단
      if Time.zone.now.strftime("%A") == "Tuesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          chun_meal = doc2.css('tr:nth-child(6) > td:nth-child(4)').text.strip
          @cheon_meal_time = "점심"
          @result_day = Time.zone.now.strftime('%m월 %d일')
        end
      end
      
      # 수요일 식단
      if Time.zone.now.strftime("%A") == "Wednesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          chun_meal = doc2.css('tr:nth-child(6) > td:nth-child(5)').text.strip
          @cheon_meal_time = "점심"
          @result_day = Time.zone.now.strftime('%m월 %d일')
        end
      end
      
      # 목요일 식단
      if Time.zone.now.strftime("%A") == "Thursday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          chun_meal = doc2.css('tr:nth-child(6) > td:nth-child(6)').text.strip
          @cheon_meal_time = "점심"
          @result_day = Time.zone.now.strftime('%m월 %d일')
        end
      end
      
      # 금요일 식단
      if Time.zone.now.strftime("%A") == "Friday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          chun_meal = doc2.css('tr:nth-child(6) > td:nth-child(7)').text.strip
          @cheon_meal_time = "점심"
          @result_day = Time.zone.now.strftime('%m월 %d일')
        end
      end
      
      # 토요일 식단
      if Time.zone.now.strftime("%A") == "Saturday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          chun_meal = doc2.css('tr:nth-child(6) > td:nth-child(8)').text.strip
          @cheon_meal_time = "점심"
          @result_day = Time.zone.now.strftime('%m월 %d일')
        end
      end
      
      # 일요일 식단
      if Time.zone.now.strftime("%A") == "Sunday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          chun_meal = doc2.css('tr:nth-child(6) > td:nth-child(9)').text.strip
          @cheon_meal_time = "점심"
          @result_day = Time.zone.now.strftime('%m월 %d일')
        end
      end
      
      if chun_meal.nil?
        @today_cheon_meal = chun_meal
      else
        @today_cheon_meal = chun_meal.gsub("\r\n", " / ")
      end
    end
    CrawlChunMeal.create(title: "천지관 덮밥 등 특식 (#{@result_day} #{@cheon_meal_time}) : #{@today_cheon_meal}")
  end
end