## rake "crawling_chun_meal_normal:crawling_chun_meal_normal"

namespace :crawling_chun_meal_normal do
  require 'nokogiri'
  require 'open-uri'
  require 'mechanize'
  
  task crawling_chun_meal_normal: :environment do

    CrawlChunMeal.where(etc: "백록관").each do |t|
      t.destroy
    end
    
    # 백록관 학식
    doc = Nokogiri::HTML(open("http://knucoop.kangwon.ac.kr/weekly_menu_02.asp"))
    @bak_meal_analyst = doc.css('table > tbody')
    @bak_meal_analyst.each do |x|
      # 월요일 식단
      if Time.zone.now.strftime("%A") == "Monday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @bakMealDate = Time.zone.now.strftime('%m월 %d일')
          @bakMeal = doc.css('tr:nth-child(5) > td:nth-child(2)').text.strip
          @bak_meal_time = "점심"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          @bakMealDate = Time.zone.now.strftime('%m월 %d일')
          @bakMeal = doc.css('tr:nth-child(7) > td:nth-child(3)').text.strip
          @bak_meal_time = "저녁"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          @bakMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @bakMeal = doc.css('tr:nth-child(5) > td:nth-child(3)').text.strip
          @bak_meal_time = "점심"
        end
      end
    
      # 화요일 식단
      if Time.zone.now.strftime("%A") == "Tuesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @bakMeal = doc.css('tr:nth-child(5) > td:nth-child(3)').text.strip
          @bakMealDate = Time.zone.now.strftime('%m월 %d일')
          @bak_meal_time = "점심"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          @bakMeal = doc.css('tr:nth-child(7) > td:nth-child(4)').text.strip
          @bakMealDate = Time.zone.now.strftime('%m월 %d일')
          @bak_meal_time = "저녁"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          @bakMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @bakMeal = doc.css('tr:nth-child(5) > td:nth-child(4)').text.strip
          @bak_meal_time = "점심"
        end
      end
      
      # 수요일 식단
      if Time.zone.now.strftime("%A") == "Wednesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @bakMeal = doc.css('tr:nth-child(5) > td:nth-child(4)').text.strip
          @bakMealDate = Time.zone.now.strftime('%m월 %d일')
          @bak_meal_time = "점심"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          @bakMeal = doc.css('tr:nth-child(7) > td:nth-child(5)').text.strip
          @bakMealDate = Time.zone.now.strftime('%m월 %d일')
          @bak_meal_time = "저녁"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          @bakMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @bakMeal = doc.css('tr:nth-child(5) > td:nth-child(5)').text.strip
          @bak_meal_time = "점심"
        end
      end
      
      # 목요일 식단
      if Time.zone.now.strftime("%A") == "Thursday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @bakMeal = doc.css('tr:nth-child(5) > td:nth-child(5)').text.strip
          @bakMealDate = Time.zone.now.strftime('%m월 %d일')
          @bak_meal_time = "점심"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          @bakMeal = doc.css('tr:nth-child(7) > td:nth-child(6)').text.strip
          @bak_meal_time = "저녁"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          @bakMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @bakMeal = doc.css('tr:nth-child(5) > td:nth-child(6)').text.strip
          @bak_meal_time = "점심"
        end
      end
      
      # 금요일 식단
      if Time.zone.now.strftime("%A") == "Friday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @bakMeal = doc.css('tr:nth-child(5) > td:nth-child(6)').text.strip
          @bakMealDate = Time.zone.now.strftime('%m월 %d일')
          @bak_meal_time = "점심"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          @bakMeal = doc.css('tr:nth-child(7) > td:nth-child(7)').text.strip
          @bak_meal_time = "저녁"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          @bakMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @bakMeal = doc.css('tr:nth-child(5) > td:nth-child(7)').text.strip
          @bak_meal_time = "점심"
        end
      end
      
      # 토요일 식단
      if Time.zone.now.strftime("%A") == "Saturday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @bakMeal = doc.css('tr:nth-child(5) > td:nth-child(7)').text.strip
          @bakMealDate = Time.zone.now.strftime('%m월 %d일')
          @bak_meal_time = "점심"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          @bakMeal = doc.css('tr:nth-child(7) > td:nth-child(8)').text.strip
          @bakMealDate = Time.zone.now.strftime('%m월 %d일')
          @bak_meal_time = "저녁"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          @bakMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @bakMeal = doc.css('tr:nth-child(5) > td:nth-child(8)').text.strip
          @bak_meal_time = "점심"
        end
      end
      
      # 일요일 식단
      if Time.zone.now.strftime("%A") == "Sunday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @bakMeal = doc.css('tr:nth-child(5) > td:nth-child(8)').text.strip
          @bakMealDate = Time.zone.now.strftime('%m월 %d일')
          @bak_meal_time = "점심"
        else
          @bakMeal = doc.css('tr:nth-child(7) > td:nth-child(9)').text.strip
          @bakMealDate = Time.zone.now.strftime('%m월 %d일')
          @bak_meal_time = "저녁"
        end
      end
      
      if @bakMeal.nil?
        @today_bak_meal = @bakMeal
      else
        @today_bak_meal = @bakMeal.gsub("\r\n", ", ")
      end
    end
    
    
    CrawlChunMeal.where(etc: "천지관").each do |t|
      t.destroy
    end
    
    # 천지관 학식
    doc2 = Nokogiri::HTML(open("http://knucoop.kangwon.ac.kr/weekly_menu_01.asp"))
    @chun_meal_analyst = doc2.css('table > tbody')
    @chun_meal_analyst.each do |x|
      # 월요일 식단
      if Time.zone.now.strftime("%A") == "Monday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          @cheonMealDate = Time.zone.now.strftime('%m월 %d일')
          @cheonMeal = doc2.css('tr:nth-child(2) > td:nth-child(3)').text.strip
          @cheon_meal_time = "아침"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          @cheonMealDate = Time.zone.now.strftime('%m월 %d일')
          @cheonMeal = doc2.css('tr:nth-child(5) > td:nth-child(2)').text.strip
          @cheon_meal_time = "점심"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          @cheonMealDate = Time.zone.now.strftime('%m월 %d일')
          @cheonMeal = doc2.css('tr:nth-child(8) > td:nth-child(2)').text.strip
          @cheon_meal_time = "저녁"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          @cheonMealDate = Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @cheonMeal = "[내일] " + doc2.css('tr:nth-child(2) > td:nth-child(4)').text.strip
          @cheon_meal_time = "아침"
        end
      end
      
      # 화요일 식단
      if Time.zone.now.strftime("%A") == "Tuesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          @cheonMealDate = Time.zone.now.strftime('%m월 %d일')
          @cheonMeal = doc2.css('tr:nth-child(2) > td:nth-child(4)').text.strip
          @cheon_meal_time = "아침"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          @cheonMealDate = Time.zone.now.strftime('%m월 %d일')
          @cheonMeal = doc2.css('tr:nth-child(5) > td:nth-child(3)').text.strip
          @cheon_meal_time = "점심"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          @cheonMealDate = Time.zone.now.strftime('%m월 %d일')
          @cheonMeal = doc2.css('tr:nth-child(8) > td:nth-child(3)').text.strip
          @cheon_meal_time = "저녁"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          @cheonMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @cheonMeal = doc2.css('tr:nth-child(2) > td:nth-child(5)').text.strip
          @cheon_meal_time = "아침"
        end
      end
      
      # 수요일 식단
      if Time.zone.now.strftime("%A") == "Wednesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          @cheonMealDate = Time.zone.now.strftime('%m월 %d일')
          @cheonMeal = doc2.css('tr:nth-child(2) > td:nth-child(5)').text.strip
          @cheon_meal_time = "아침"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          @cheonMealDate = Time.zone.now.strftime('%m월 %d일')
          @cheonMeal = doc2.css('tr:nth-child(5) > td:nth-child(4)').text.strip
          @cheon_meal_time = "점심"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          @cheonMealDate = Time.zone.now.strftime('%m월 %d일')
          @cheonMeal = doc2.css('tr:nth-child(8) > td:nth-child(4)').text.strip
          @cheon_meal_time = "저녁"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          @cheonMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @cheonMeal = doc2.css('tr:nth-child(2) > td:nth-child(6)').text.strip
          @cheon_meal_time = "아침"
        end
      end
      
      # 목요일 식단
      if Time.zone.now.strftime("%A") == "Thursday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          @cheonMealDate = Time.zone.now.strftime('%m월 %d일')
          @cheonMeal = doc2.css('tr:nth-child(2) > td:nth-child(6)').text.strip
          @cheon_meal_time = "아침"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          @cheonMealDate = Time.zone.now.strftime('%m월 %d일')
          @cheonMeal = doc2.css('tr:nth-child(5) > td:nth-child(5)').text.strip
          @cheon_meal_time = "점심"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          @cheonMealDate = Time.zone.now.strftime('%m월 %d일')
          @cheonMeal = doc2.css('tr:nth-child(8) > td:nth-child(5)').text.strip
          @cheon_meal_time = "저녁"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          @cheonMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @cheonMeal = doc2.css('tr:nth-child(2) > td:nth-child(7)').text.strip
          @cheon_meal_time = "아침"
        end
      end
      
      # 금요일 식단
      if Time.zone.now.strftime("%A") == "Friday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          @cheonMealDate = Time.zone.now.strftime('%m월 %d일')
          @cheonMeal = doc2.css('tr:nth-child(2) > td:nth-child(7)').text.strip
          @cheon_meal_time = "아침"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          @cheonMealDate = Time.zone.now.strftime('%m월 %d일')
          @cheonMeal = doc2.css('tr:nth-child(5) > td:nth-child(6)').text.strip
          @cheon_meal_time = "점심"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          @cheonMealDate = Time.zone.now.strftime('%m월 %d일')
          @cheonMeal = doc2.css('tr:nth-child(8) > td:nth-child(6)').text.strip
          @cheon_meal_time = "저녁"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          @cheonMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @cheonMeal = doc2.css('tr:nth-child(2) > td:nth-child(8)').text.strip
          @cheon_meal_time = "아침"
        end
      end
      
      # 토요일 식단
      if Time.zone.now.strftime("%A") == "Saturday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          @cheonMealDate = Time.zone.now.strftime('%m월 %d일')
          @cheonMeal = doc2.css('tr:nth-child(2) > td:nth-child(8)').text.strip
          @cheon_meal_time = "아침"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          @cheonMealDate = Time.zone.now.strftime('%m월 %d일')
          @cheonMeal = doc2.css('tr:nth-child(5) > td:nth-child(7)').text.strip
          @cheon_meal_time = "점심"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          @cheonMealDate = Time.zone.now.strftime('%m월 %d일')
          @cheonMeal = doc2.css('tr:nth-child(8) > td:nth-child(7)').text.strip
          @cheon_meal_time = "저녁"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          @cheonMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @cheonMeal = doc2.css('tr:nth-child(2) > td:nth-child(9)').text.strip
          @cheon_meal_time = "아침"
        end
      end
      
      # 일요일 식단
      if Time.zone.now.strftime("%A") == "Sunday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          @cheonMealDate = Time.zone.now.strftime('%m월 %d일')
          @cheonMeal = doc2.css('tr:nth-child(2) > td:nth-child(9)').text.strip
          @cheon_meal_time = "아침"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          @cheonMealDate = Time.zone.now.strftime('%m월 %d일')
          @cheonMeal = doc2.css('tr:nth-child(5) > td:nth-child(8)').text.strip
          @cheon_meal_time = "점심"
        else
          @cheonMealDate = Time.zone.now.strftime('%m월 %d일')
          @cheonMeal = doc2.css('tr:nth-child(8) > td:nth-child(8)').text.strip
          @cheon_meal_time = "저녁"
        end
      end
      
      if @cheonMeal.nil?
        @today_cheon_meal = @cheonMeal
      else
        @today_cheon_meal = @cheonMeal.gsub("\r\n", ", ").gsub("\t", "")
      end
    end
    
    if (@today_bak_meal.nil? || @today_bak_meal.empty?)
      @today_bak_meal = "학식 미운영"
    end
    
    if (@today_cheon_meal.nil? || @today_cheon_meal.empty?)
      @today_cheon_meal = "학식 미운영"
    end

    # CrawlChunMeal.create(title: "새롬관(구 BTL) 메뉴 (#{Time.zone.now.strftime('%m월 %d일')} #{@BTL_meal_time}) : #{@BTL_meal_result}")
    CrawlChunMeal.create(title: "백록관 백반", menu: @today_bak_meal, meal_date: @bakMealDate, meal_time: "", kind_of_meal: @bak_meal_time, etc: "백록관")
    CrawlChunMeal.create(title: "천지관 백반", menu: @today_cheon_meal, meal_date: @cheonMealDate, meal_time: "", kind_of_meal: @cheon_meal_time, etc: "천지관")
  end
end