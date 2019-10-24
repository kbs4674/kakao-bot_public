## rake "crawling_chun_meal_staff:crawling_chun_meal_staff"
## 천지관 / 백록관 교직원 메뉴

namespace :crawling_chun_meal_staff do
  require 'nokogiri'
  require 'open-uri'
  require 'mechanize'
  
  task crawling_chun_meal_staff: :environment do

    # 백록관 학식
    doc = Nokogiri::HTML(open("http://knucoop.kangwon.ac.kr/weekly_menu_02.asp"))
    @bak_meal_analyst = doc.css('table > tbody')
    @bak_meal_analyst.each do |x|
      # 월요일 식단
      if Time.zone.now.strftime("%A") == "Monday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14)
          @backMeal = doc.css('tr:nth-child(4) > td:nth-child(3)').text.strip
          @bak_meal_time = "점심"
          @bakResultDay = Time.zone.now.strftime('%m월 %d일')

        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i <= 23)
          @backMeal = doc.css('tr:nth-child(4) > td:nth-child(4)').text.strip
          @bak_meal_time = "점심"
          @bakResultDay = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
        end
      end
    
      # 화요일 식단
      if Time.zone.now.strftime("%A") == "Tuesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14)
          @backMeal = doc.css('tr:nth-child(4) > td:nth-child(4)').text.strip
          @bak_meal_time = "점심"
          @bakResultDay = Time.zone.now.strftime('%m월 %d일')
        
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i <= 23)
          @backMeal = doc.css('tr:nth-child(4) > td:nth-child(5)').text.strip
          @bak_meal_time = "점심"
          @bakResultDay = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
        end
      end
      
      # 수요일 식단
      if Time.zone.now.strftime("%A") == "Wednesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @backMeal = doc.css('tr:nth-child(4) > td:nth-child(5)').text.strip
          @bak_meal_time = "점심"
          @bakResultDay = Time.zone.now.strftime('%m월 %d일')
        
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i <= 23)
          @backMeal = doc.css('tr:nth-child(4) > td:nth-child(6)').text.strip
          @bak_meal_time = "점심"
          @bakResultDay = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
        end
      end
      
      # 목요일 식단
      if Time.zone.now.strftime("%A") == "Thursday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @backMeal = doc.css('tr:nth-child(4) > td:nth-child(6)').text.strip
          @bak_meal_time = "점심"
          @bakResultDay = Time.zone.now.strftime('%m월 %d일')
        
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i <= 23)
          @backMeal = doc.css('tr:nth-child(4) > td:nth-child(7)').text.strip
          @bak_meal_time = "점심"
          @bakResultDay = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
        end
      end
      
      # 금요일 식단
      if Time.zone.now.strftime("%A") == "Friday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @backMeal = doc.css('tr:nth-child(4) > td:nth-child(7)').text.strip
          @bak_meal_time = "점심"
          @bakResultDay = Time.zone.now.strftime('%m월 %d일')
        
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i <= 23)
          @backMeal = doc.css('tr:nth-child(4) > td:nth-child(8)').text.strip
          @bak_meal_time = "점심"
          @bakResultDay = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
        end
      end
      
      # 토요일 식단
      if Time.zone.now.strftime("%A") == "Saturday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @backMeal = doc.css('tr:nth-child(4) > td:nth-child(8)').text.strip
          @bak_meal_time = "점심"
          @bakResultDay = Time.zone.now.strftime('%m월 %d일')
        
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i <= 23)
          @backMeal = doc.css('tr:nth-child(4) > td:nth-child(9)').text.strip
          @bak_meal_time = "점심"
          @bakResultDay = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
        end
      end
      
      # 일요일 식단
      if Time.zone.now.strftime("%A") == "Sunday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @backMeal = doc.css('tr:nth-child(4) > td:nth-child(9)').text.strip
          @bak_meal_time = "점심"
          @bakResultDay = Time.zone.now.strftime('%m월 %d일')
        end
      end
      
      if @backMeal.nil?
        @today_bak_meal = @backMeal
      else
        @today_bak_meal = @backMeal.gsub("\r\n", ", ")
      end
    end
    
    # 천지관 교직원 식단 메뉴
    doc2 = Nokogiri::HTML(open("http://knucoop.kangwon.ac.kr/weekly_menu_01.asp"))
    @cheonMeal_analyst = doc2.css('table > tbody')
    @cheonMeal_analyst.each do |x|
      # 월요일 식단
      if Time.zone.now.strftime("%A") == "Monday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @cheonMeal = doc2.css('tr:nth-child(4) > td:nth-child(3)').text.strip
          @cheon_meal_time = "점심"
          @cheonResultDay = Time.zone.now.strftime('%m월 %d일')
        
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i <= 23)
          @cheonMeal = doc2.css('tr:nth-child(4) > td:nth-child(4)').text.strip
          @cheon_meal_time = "점심"
          @cheonResultDay = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
        end
      end
      
      # 화요일 식단
      if Time.zone.now.strftime("%A") == "Tuesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @cheonMeal = doc2.css('tr:nth-child(4) > td:nth-child(4)').text.strip
          @cheon_meal_time = "점심"
          @cheonResultDay = Time.zone.now.strftime('%m월 %d일')
        
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i <= 23)
          @cheonMeal = doc2.css('tr:nth-child(4) > td:nth-child(5)').text.strip
          @cheon_meal_time = "점심"
          @cheonResultDay = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
        end
      end
      
      # 수요일 식단
      if Time.zone.now.strftime("%A") == "Wednesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @cheonMeal = doc2.css('tr:nth-child(4) > td:nth-child(5)').text.strip
          @cheon_meal_time = "점심"
          @cheonResultDay = Time.zone.now.strftime('%m월 %d일')
        
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i <= 23)
          @cheonMeal = doc2.css('tr:nth-child(4) > td:nth-child(6)').text.strip
          @cheon_meal_time = "점심"
          @cheonResultDay = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
        end
      end
      
      # 목요일 식단
      if Time.zone.now.strftime("%A") == "Thursday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @cheonMeal = doc2.css('tr:nth-child(4) > td:nth-child(6)').text.strip
          @cheon_meal_time = "점심"
          @cheonResultDay = Time.zone.now.strftime('%m월 %d일')
        
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i <= 23)
          @cheonMeal = doc2.css('tr:nth-child(4) > td:nth-child(7)').text.strip
          @cheon_meal_time = "점심"
          @cheonResultDay = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
        end
      end
      
      # 금요일 식단
      if Time.zone.now.strftime("%A") == "Friday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @cheonMeal = doc2.css('tr:nth-child(4) > td:nth-child(7)').text.strip
          @cheon_meal_time = "점심"
          @cheonResultDay = Time.zone.now.strftime('%m월 %d일')
        
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i <= 23)
          @cheonMeal = doc2.css('tr:nth-child(4) > td:nth-child(8)').text.strip
          @cheon_meal_time = "점심"
          @cheonResultDay = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
        end
      end
      
      # 토요일 식단
      if Time.zone.now.strftime("%A") == "Saturday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @cheonMeal = doc2.css('tr:nth-child(4) > td:nth-child(8)').text.strip
          @cheon_meal_time = "점심"
          @cheonResultDay = Time.zone.now.strftime('%m월 %d일')
        
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i <= 23)
          @cheonMeal = doc2.css('tr:nth-child(4) > td:nth-child(9)').text.strip
          @cheon_meal_time = "점심"
          @cheonResultDay = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
        end
      end
      
      # 일요일 식단
      if Time.zone.now.strftime("%A") == "Sunday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @cheonMeal = doc2.css('tr:nth-child(4) > td:nth-child(9)').text.strip
          @cheon_meal_time = "점심"
          @cheonResultDay = Time.zone.now.strftime('%m월 %d일')
        end
      end
      
      if @cheonMeal.nil?
        @today_cheon_meal = @cheonMeal
      else
        @today_cheon_meal = @cheonMeal.gsub("\r\n", ", ")
      end
    end
    
    if @today_cheon_meal.nil?
      @today_cheon_meal = "학식 미운영"
      @cheonResultDay = Time.zone.now.strftime('%m월 %d일')
      @cheon_meal_time = ""
    end
    
    if @today_bak_meal.nil?
      @today_bak_meal = "학식 미운영"
      @bakResultDay = Time.zone.now.strftime('%m월 %d일')
      @bak_meal_time = ""
    end

    # CrawlChunMeal.create(title: "백록관 교직원 식단 (#{@bakResultDay.gsub(/[\r\n\t]/, "")} #{@bak_meal_time.gsub(/[\r\n\t]/, "")}) : #{@today_bak_meal.gsub(/[\r\n\t]/, "")}")
    CrawlChunMeal.create(title: "백록관 교직원 식단", menu: @today_bak_meal, meal_date: @bakResultDay, meal_time: "", kind_of_meal: @bak_meal_time, etc: "백록관")
    CrawlChunMeal.create(title: "천지관 교직원 식단", menu: @today_cheon_meal, meal_date: @cheonResultDay, meal_time: "", kind_of_meal: @cheon_meal_time, etc: "천지관")
  end
end