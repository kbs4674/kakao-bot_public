## rake "crawling_chun_meal_cheon_rice_special:crawling_chun_meal_cheon_rice_special"
## 천지관 덮밥 메뉴

namespace :crawling_chun_meal_cheon_rice_special do
  require 'nokogiri'
  require 'open-uri'
  require 'mechanize'
  
  task crawling_chun_meal_cheon_rice_special: :environment do

    # 천지관 덮밥 등 특식 메뉴
    doc2 = Nokogiri::HTML(open("http://knucoop.kangwon.ac.kr/weekly_menu_01.asp"))
    @cheonMeal_analyst = doc2.css('table > tbody')
    @cheonMeal_analyst.each do |x|
      # 월요일 식단
      if Time.zone.now.strftime("%A") == "Monday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @cheonMeal = doc2.css('tr:nth-child(6) > td:nth-child(2)').text.strip
          @cheon_meal_time = "점심"
          @result_day = Time.zone.now.strftime('%m월 %d일')
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i <= 23 )
          @cheonMeal = doc2.css('tr:nth-child(6) > td:nth-child(3)').text.strip
          @cheon_meal_time = "점심"
          @result_day = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
        end
      end
      
      # 화요일 식단
      if Time.zone.now.strftime("%A") == "Tuesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @cheonMeal = doc2.css('tr:nth-child(6) > td:nth-child(3)').text.strip
          @cheon_meal_time = "점심"
          @result_day = Time.zone.now.strftime('%m월 %d일')
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i <= 23 )
          @cheonMeal = doc2.css('tr:nth-child(6) > td:nth-child(4)').text.strip
          @cheon_meal_time = "점심"
          @result_day = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
        end
      end
      
      # 수요일 식단
      if Time.zone.now.strftime("%A") == "Wednesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @cheonMeal = doc2.css('tr:nth-child(6) > td:nth-child(4)').text.strip
          @cheon_meal_time = "점심"
          @result_day = Time.zone.now.strftime('%m월 %d일')
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i <= 23 )
          @cheonMeal = doc2.css('tr:nth-child(6) > td:nth-child(5)').text.strip
          @cheon_meal_time = "점심"
          @result_day = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
        end
      end
      
      # 목요일 식단
      if Time.zone.now.strftime("%A") == "Thursday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @cheonMeal = doc2.css('tr:nth-child(6) > td:nth-child(5)').text.strip
          @cheon_meal_time = "점심"
          @result_day = Time.zone.now.strftime('%m월 %d일')
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i <= 23 )
          @cheonMeal = doc2.css('tr:nth-child(6) > td:nth-child(6)').text.strip
          @cheon_meal_time = "점심"
          @result_day = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
        end
      end
      
      # 금요일 식단
      if Time.zone.now.strftime("%A") == "Friday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @cheonMeal = doc2.css('tr:nth-child(6) > td:nth-child(6)').text.strip
          @cheon_meal_time = "점심"
          @result_day = Time.zone.now.strftime('%m월 %d일')
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i <= 23 )
          @cheonMeal = doc2.css('tr:nth-child(6) > td:nth-child(7)').text.strip
          @cheon_meal_time = "점심"
          @result_day = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
        end
      end
      
      # 토요일 식단
      if Time.zone.now.strftime("%A") == "Saturday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @cheonMeal = doc2.css('tr:nth-child(6) > td:nth-child(7)').text.strip
          @cheon_meal_time = "점심"
          @result_day = Time.zone.now.strftime('%m월 %d일')
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i <= 23 )
          @cheonMeal = doc2.css('tr:nth-child(6) > td:nth-child(8)').text.strip
          @cheon_meal_time = "점심"
          @result_day = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
        end
      end
      
      # 일요일 식단
      if Time.zone.now.strftime("%A") == "Sunday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @cheonMeal = doc2.css('tr:nth-child(6) > td:nth-child(8)').text.strip
          @cheon_meal_time = "점심"
          @result_day = Time.zone.now.strftime('%m월 %d일')
        end
      end
      
      if @cheonMeal.nil?
        @today_cheon_meal = @cheonMeal
      else
        @today_cheon_meal = @cheonMeal.gsub("\r\n", " / ")
      end
    end
    
    if @today_cheon_meal.nil?
      @today_cheon_meal = "학식 미운영"
      @result_day = Time.zone.now.strftime('%m월 %d일')
      @cheon_meal_time = ""
    end
    
    # CrawlChunMeal.create(title: "천지관 덮밥 등 특식 (#{@result_day.gsub(/[\r\n\t]/, "")} #{@cheon_meal_time.gsub(/[\r\n\t]/, "")}) : #{@today_cheon_meal.gsub(/[\r\n\t]/, "")}")
    CrawlChunMeal.create(title: "천지관 덮밥 등 특식", menu: @today_cheon_meal, meal_date: @result_day, meal_time: "", kind_of_meal: @cheon_meal_time, etc: "천지관")
  end
end