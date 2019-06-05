## rake "crawling_chun_meal:crawling_chun_meal"

namespace :crawling_chun_meal do
  require 'nokogiri'
  require 'open-uri'
  require 'mechanize'
  
  task crawling_chun_meal: :environment do

    CrawlChunMeal.all.each do |x|
      x.destroy
    end
    
    # 백록관 학식
    doc = Nokogiri::HTML(open("http://knucoop.kangwon.ac.kr/weekly_menu_02.asp"))
    @bak_meal_analyst = doc.css('table > tbody')
    @bak_meal_analyst.each do |x|
      # 월요일 식단
      if Time.zone.now.strftime("%A") == "Monday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          back_meal = doc.css('tr:nth-child(5) > td:nth-child(2)').text.strip
          @bak_meal_time = "점심"
        else
          back_meal = doc.css('tr:nth-child(7) > td:nth-child(3)').text.strip
          @bak_meal_time = "저녁"
        end
      end
    
      # 화요일 식단
      if Time.zone.now.strftime("%A") == "Tuesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          back_meal = doc.css('tr:nth-child(5) > td:nth-child(3)').text.strip
          @bak_meal_time = "점심"
        else
          back_meal = doc.css('tr:nth-child(7) > td:nth-child(4)').text.strip
          @bak_meal_time = "저녁"
        end
      end
      
      # 수요일 식단
      if Time.zone.now.strftime("%A") == "Wednesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          back_meal = doc.css('tr:nth-child(5) > td:nth-child(4)').text.strip
          @bak_meal_time = "점심"
        else
          back_meal = doc.css('tr:nth-child(7) > td:nth-child(5)').text.strip
          @bak_meal_time = "저녁"
        end
      end
      
      # 목요일 식단
      if Time.zone.now.strftime("%A") == "Thursday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          back_meal = doc.css('tr:nth-child(5) > td:nth-child(5)').text.strip
          @bak_meal_time = "점심"
        else
          back_meal = doc.css('tr:nth-child(7) > td:nth-child(6)').text.strip
          @bak_meal_time = "저녁"
        end
      end
      
      # 금요일 식단
      if Time.zone.now.strftime("%A") == "Friday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          back_meal = doc.css('tr:nth-child(5) > td:nth-child(6)').text.strip
          @bak_meal_time = "점심"
        else
          back_meal = doc.css('tr:nth-child(7) > td:nth-child(7)').text.strip
          @bak_meal_time = "저녁"
        end
      end
      
      # 토요일 식단
      if Time.zone.now.strftime("%A") == "Saturday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          back_meal = doc.css('tr:nth-child(5) > td:nth-child(7)').text.strip
          @bak_meal_time = "점심"
        else
          back_meal = doc.css('tr:nth-child(7) > td:nth-child(8)').text.strip
          @bak_meal_time = "저녁"
        end
      end
      
      # 일요일 식단
      if Time.zone.now.strftime("%A") == "Sunday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          back_meal = doc.css('tr:nth-child(5) > td:nth-child(8)').text.strip
          @bak_meal_time = "점심"
        else
          back_meal = doc.css('tr:nth-child(7) > td:nth-child(9)').text.strip
          @bak_meal_time = "저녁"
        end
      end
      
      if back_meal.nil?
        @today_bak_meal = back_meal
      else
        @today_bak_meal = back_meal.gsub("\r\n", ", ")
      end
    end
    
    # 천지관 학식
    doc2 = Nokogiri::HTML(open("http://knucoop.kangwon.ac.kr/weekly_menu_01.asp"))
    @chun_meal_analyst = doc2.css('table > tbody')
    @chun_meal_analyst.each do |x|
      # 월요일 식단
      if Time.zone.now.strftime("%A") == "Monday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          chun_meal = doc2.css('tr:nth-child(2) > td:nth-child(3)').text.strip
          @cheon_meal_time = "아침"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          chun_meal = doc2.css('tr:nth-child(5) > td:nth-child(2)').text.strip
          @cheon_meal_time = "점심"
        else
          chun_meal = doc2.css('tr:nth-child(8) > td:nth-child(2)').text.strip
          @cheon_meal_time = "저녁"
        end
      end
      
      # 화요일 식단
      if Time.zone.now.strftime("%A") == "Tuesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          chun_meal = doc2.css('tr:nth-child(2) > td:nth-child(4)').text.strip
          @cheon_meal_time = "아침"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          chun_meal = doc2.css('tr:nth-child(5) > td:nth-child(3)').text.strip
          @cheon_meal_time = "점심"
        else
          chun_meal = doc2.css('tr:nth-child(8) > td:nth-child(3)').text.strip
          @cheon_meal_time = "저녁"
        end
      end
      
      # 수요일 식단
      if Time.zone.now.strftime("%A") == "Wednesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          chun_meal = doc2.css('tr:nth-child(2) > td:nth-child(5)').text.strip
          @cheon_meal_time = "아침"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          chun_meal = doc2.css('tr:nth-child(5) > td:nth-child(4)').text.strip
          @cheon_meal_time = "점심"
        else
          chun_meal = doc2.css('tr:nth-child(8) > td:nth-child(4)').text.strip
          @cheon_meal_time = "저녁"
        end
      end
      
      # 목요일 식단
      if Time.zone.now.strftime("%A") == "Thursday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          chun_meal = doc2.css('tr:nth-child(2) > td:nth-child(6)').text.strip
          @cheon_meal_time = "아침"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          chun_meal = doc2.css('tr:nth-child(5) > td:nth-child(5)').text.strip
          @cheon_meal_time = "점심"
        else
          chun_meal = doc2.css('tr:nth-child(8) > td:nth-child(5)').text.strip
          @cheon_meal_time = "저녁"
        end
      end
      
      # 금요일 식단
      if Time.zone.now.strftime("%A") == "Friday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          chun_meal = doc2.css('tr:nth-child(2) > td:nth-child(7)').text.strip
          @cheon_meal_time = "아침"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          chun_meal = doc2.css('tr:nth-child(5) > td:nth-child(6)').text.strip
          @cheon_meal_time = "점심"
        else
          chun_meal = doc2.css('tr:nth-child(8) > td:nth-child(6)').text.strip
          @cheon_meal_time = "저녁"
        end
      end
      
      # 토요일 식단
      if Time.zone.now.strftime("%A") == "Saturday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          chun_meal = doc2.css('tr:nth-child(2) > td:nth-child(8)').text.strip
          @cheon_meal_time = "아침"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          chun_meal = doc2.css('tr:nth-child(5) > td:nth-child(7)').text.strip
          @cheon_meal_time = "저녁"
        else
          chun_meal = doc2.css('tr:nth-child(8) > td:nth-child(7)').text.strip
          @cheon_meal_time = "점심"
        end
      end
      
      if chun_meal.nil?
        @today_cheon_meal = chun_meal
      else
        @today_cheon_meal = chun_meal.gsub("\r\n", ", ")
      end
    end
    
    # 재정 생활관 식단
    doc3 = Nokogiri::HTML(open("http://knudorm.kangwon.ac.kr/home/sub02/sub02_05_bj.jsp"))
    @dormitory_analyst = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01')
    @dormitory_analyst.each do |x|
      # 월요일 식단
      if Time.zone.now.strftime("%A") == "Monday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(2) > td:nth-child(2)').text.strip
          @dormitory_meal_time = "아침"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(2) > td:nth-child(3)').text.strip
          @dormitory_meal_time = "점심"
        else
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(2) > td:nth-child(4)').text.strip
          @dormitory_meal_time = "저녁"
        end
      end
      
      # 화요일 식단
      if Time.zone.now.strftime("%A") == "Tuesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(3) > td:nth-child(2)').text.strip
          @dormitory_meal_time = "아침"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(3) > td:nth-child(3)').text.strip
          @dormitory_meal_time = "점심"
        else
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(3) > td:nth-child(4)').text.strip
          @dormitory_meal_time = "저녁"
        end
      end
      
      # 수요일 식단
      if Time.zone.now.strftime("%A") == "Wednesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(4) > td:nth-child(2)').text.strip
          @dormitory_meal_time = "아침"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(4) > td:nth-child(3)').text.strip
          @dormitory_meal_time = "점심"
        else
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(4) > td:nth-child(4)').text.strip
          @dormitory_meal_time = "저녁"
        end
      end
      
      # 목요일 식단
      if Time.zone.now.strftime("%A") == "Thursday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(5) > td:nth-child(2)').text.strip
          @dormitory_meal_time = "아침"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(5) > td:nth-child(3)').text.strip
          @dormitory_meal_time = "점심"
        else
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(5) > td:nth-child(4)').text.strip
          @dormitory_meal_time = "저녁"
        end
      end
      
      # 금요일 식단
      if Time.zone.now.strftime("%A") == "Friday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(6) > td:nth-child(2)').text.strip
          @dormitory_meal_time = "아침"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i <= 14 )
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(6) > td:nth-child(3)').text.strip
          @dormitory_meal_time = "점심"
        else
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(6) > td:nth-child(4)').text.strip
          @dormitory_meal_time = "저녁"
        end
      end
      
      # 토요일 식단
      if Time.zone.now.strftime("%A") == "Saturday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(7) > td:nth-child(2)').text.strip
          @dormitory_meal_time = "아침"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(7) > td:nth-child(3)').text.strip
          @dormitory_meal_time = "점심"
        else
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(7) > td:nth-child(4)').text.strip
          @dormitory_meal_time = "저녁"
        end
      end
      
      # 일요일 식단
      if Time.zone.now.strftime("%A") == "Sunday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(8) > td:nth-child(2)').text.strip
          @dormitory_meal_time = "아침"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(8) > td:nth-child(3)').text.strip
          @dormitory_meal_time = "점심"
        else
          dormitory_meal_normal = doc3.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(8) > td:nth-child(4)').text.strip
          @dormitory_meal_time = "저녁"
        end
      end
      
      if dormitory_meal_normal.nil?
        @dormitory_meal_result = dormitory_meal_normal
      else
        @dormitory_meal_result = dormitory_meal_normal.gsub("\r\n", ", ")
      end
    end
    
    # 새롬관(구 BTL) 생활관 식단
    @BTL_analyst = doc3.css('#foodtab2 > table.table_type01')
    @BTL_analyst.each do |x|
      # 월요일 식단
      if Time.zone.now.strftime("%A") == "Monday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > tr:nth-child(2) > td:nth-child(2)').text.strip
          @BTL_meal_time = "아침"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > tr:nth-child(2) > td:nth-child(3)').text.strip
          @BTL_meal_time = "점심"
        else
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > tr:nth-child(2) > td:nth-child(4)').text.strip
          @BTL_meal_time = "저녁"
        end
      end
      
      # 화요일 식단
      if Time.zone.now.strftime("%A") == "Tuesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > tr:nth-child(3) > td:nth-child(2)').text.strip
          @BTL_meal_time = "아침"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > tr:nth-child(3) > td:nth-child(3)').text.strip
          @BTL_meal_time = "점심"
        else
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > tr:nth-child(3) > td:nth-child(4)').text.strip
          @BTL_meal_time = "저녁"
        end
      end
      
      # 수요일 식단
      if Time.zone.now.strftime("%A") == "Wednesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > tr:nth-child(4) > td:nth-child(2)').text.strip
          @BTL_meal_time = "아침"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > tr:nth-child(4) > td:nth-child(3)').text.strip
          @BTL_meal_time = "점심"
        else
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > tr:nth-child(4) > td:nth-child(4)').text.strip
          @BTL_meal_time = "저녁"
        end
      end
      
      # 목요일 식단
      if Time.zone.now.strftime("%A") == "Thursday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > tr:nth-child(5) > td:nth-child(2)').text.strip
          @BTL_meal_time = "아침"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > tr:nth-child(5) > td:nth-child(3)').text.strip
          @BTL_meal_time = "점심"
        else
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > tr:nth-child(5) > td:nth-child(4)').text.strip
          @BTL_meal_time = "저녁"
        end
      end
      
      # 금요일 식단
      if Time.zone.now.strftime("%A") == "Friday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > tr:nth-child(6) > td:nth-child(2)').text.strip
          @BTL_meal_time = "아침"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > tr:nth-child(6) > td:nth-child(3)').text.strip
          @BTL_meal_time = "점심"
        else
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > tr:nth-child(6) > td:nth-child(4)').text.strip
          @BTL_meal_time = "저녁"
        end
      end
      
      # 토요일 식단
      if Time.zone.now.strftime("%A") == "Saturday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > tr:nth-child(7) > td:nth-child(2)').text.strip
          @BTL_meal_time = "아침"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > tr:nth-child(7) > td:nth-child(3)').text.strip
          @BTL_meal_time = "점심"
        else
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > tr:nth-child(7) > td:nth-child(4)').text.strip
          @BTL_meal_time = "저녁"
        end
      end
      
      # 일요일 식단
      if Time.zone.now.strftime("%A") == "Sunday"
        if (Time.zone.now.strftime("%H").to_i > 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > tr:nth-child(8) > td:nth-child(2)').text.strip
          @BTL_meal_time = "아침"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > tr:nth-child(8) > td:nth-child(3)').text.strip
          @BTL_meal_time = "점심"
        else
          dormitory_meal_BTL = doc3.css('#foodtab2 > table.table_type01 > tr:nth-child(8) > td:nth-child(4)').text.strip
          @BTL_meal_time = "저녁"
        end
      end
      
      if dormitory_meal_BTL.nil?
        @BTL_meal_result = dormitory_meal_BTL
      else
        @BTL_meal_result = dormitory_meal_BTL.gsub("\r\n", ", ")
      end
    end
    
    # 이롬관(신 BTL) 생활관 식단
    @Lee_BTL_analyst = doc3.css('#foodtab3 > table.table_type01')
    @Lee_BTL_analyst.each do |x|
      # 월요일 식단
      if Time.zone.now.strftime("%A") == "Monday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_Lee_BTL = doc3.css('#foodtab3 > table.table_type01 > tr:nth-child(2) > td:nth-child(2)').text.strip
          @Lee_BTL_analyst = "아침"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_Lee_BTL = doc3.css('#foodtab3 > table.table_type01 > tr:nth-child(2) > td:nth-child(3)').text.strip
          @Lee_BTL_meal_time = "점심"
        else
          dormitory_meal_Lee_BTL = doc3.css('#foodtab3 > table.table_type01 > tr:nth-child(2) > td:nth-child(4)').text.strip
          @Lee_BTL_meal_time = "저녁"
        end
      end
      
      # 화요일 식단
      if Time.zone.now.strftime("%A") == "Tuesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_Lee_BTL = doc3.css('#foodtab3 > table.table_type01 > tr:nth-child(3) > td:nth-child(2)').text.strip
          @Lee_BTL_meal_time = "아침"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_Lee_BTL = doc3.css('#foodtab3 > table.table_type01 > tr:nth-child(3) > td:nth-child(3)').text.strip
          @Lee_BTL_meal_time = "점심"
        else
          dormitory_meal_Lee_BTL = doc3.css('#foodtab3 > table.table_type01 > tr:nth-child(3) > td:nth-child(4)').text.strip
          @Lee_BTL_meal_time = "저녁"
        end
      end
      
      # 수요일 식단
      if Time.zone.now.strftime("%A") == "Wednesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_Lee_BTL = doc3.css('#foodtab3 > table.table_type01 > tr:nth-child(4) > td:nth-child(2)').text.strip
          @Lee_BTL_meal_time = "아침"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_Lee_BTL = doc3.css('#foodtab3 > table.table_type01 > tr:nth-child(4) > td:nth-child(3)').text.strip
          @Lee_BTL_meal_time = "점심"
        else
          dormitory_meal_Lee_BTL = doc3.css('#foodtab3 > table.table_type01 > tr:nth-child(4) > td:nth-child(4)').text.strip
          @Lee_BTL_meal_time = "저녁"
        end
      end
      
      # 목요일 식단
      if Time.zone.now.strftime("%A") == "Thursday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_Lee_BTL = doc3.css('#foodtab3 > table.table_type01 > tr:nth-child(5) > td:nth-child(2)').text.strip
          @Lee_BTL_meal_time = "아침"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_Lee_BTL = doc3.css('#foodtab3 > table.table_type01 > tr:nth-child(5) > td:nth-child(3)').text.strip
          @Lee_BTL_meal_time = "점심"
        else
          dormitory_meal_Lee_BTL = doc3.css('#foodtab3 > table.table_type01 > tr:nth-child(5) > td:nth-child(4)').text.strip
          @Lee_BTL_meal_time = "저녁"
        end
      end
      
      # 금요일 식단
      if Time.zone.now.strftime("%A") == "Friday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_Lee_BTL = doc3.css('#foodtab3 > table.table_type01 > tr:nth-child(6) > td:nth-child(2)').text.strip
          @Lee_BTL_meal_time = "아침"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_Lee_BTL = doc3.css('#foodtab3 > table.table_type01 > tr:nth-child(6) > td:nth-child(3)').text.strip
          @Lee_BTL_meal_time = "점심"
        else
          dormitory_meal_Lee_BTL = doc3.css('#foodtab3 > table.table_type01 > tr:nth-child(6) > td:nth-child(4)').text.strip
          @Lee_BTL_meal_time = "저녁"
        end
      end
      
      # 토요일 식단
      if Time.zone.now.strftime("%A") == "Saturday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_Lee_BTL = doc3.css('#foodtab3 > table.table_type01 > tr:nth-child(7) > td:nth-child(2)').text.strip
          @Lee_BTL_meal_time = "아침"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_Lee_BTL = doc3.css('#foodtab3 > table.table_type01 > tr:nth-child(7) > td:nth-child(3)').text.strip
          @Lee_BTL_meal_time = "점심"
        else
          dormitory_meal_Lee_BTL = doc3.css('#foodtab3 > table.table_type01 > tr:nth-child(7) > td:nth-child(4)').text.strip
          @Lee_BTL_meal_time = "저녁"
        end
      end
      
      # 일요일 식단
      if Time.zone.now.strftime("%A") == "Sunday"
        if (Time.zone.now.strftime("%H").to_i > 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_Lee_BTL = doc3.css('#foodtab3 > table.table_type01 > tr:nth-child(8) > td:nth-child(2)').text.strip
          @Lee_BTL_meal_time = "아침"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_Lee_BTL = doc3.css('#foodtab3 > table.table_type01 > tr:nth-child(8) > td:nth-child(3)').text.strip
          @Lee_BTL_meal_time = "점심"
        else
          dormitory_meal_Lee_BTL = doc3.css('#foodtab3 > table.table_type01 > tr:nth-child(8) > td:nth-child(4)').text.strip
          @Lee_BTL_meal_time = "저녁"
        end
      end
      
      if dormitory_meal_Lee_BTL.nil?
        @Lee_BTL_meal_result = dormitory_meal_Lee_BTL
      else
        @Lee_BTL_meal_result = dormitory_meal_Lee_BTL.gsub("\r\n", ", ")
      end
    end
    
    CrawlChunMeal.create(title: "재정생활관 메뉴 (#{Time.zone.now.strftime('%m월 %d일')} #{@dormitory_meal_time}) : #{@dormitory_meal_result}")
    CrawlChunMeal.create(title: "새롬관(구 BTL) 메뉴 (#{Time.zone.now.strftime('%m월 %d일')} #{@BTL_meal_time}) : #{@BTL_meal_result}")
    CrawlChunMeal.create(title: "이룸관(신 BTL) 메뉴 (#{Time.zone.now.strftime('%m월 %d일')} #{@Lee_BTL_meal_time}) : #{@Lee_BTL_meal_result}")
    CrawlChunMeal.create(title: "백록관 백반메뉴 (#{Time.zone.now.strftime('%m월 %d일')} #{@bak_meal_time}) : #{@today_bak_meal}")
    CrawlChunMeal.create(title: "천지관 백반메뉴 (#{Time.zone.now.strftime('%m월 %d일')} #{@cheon_meal_time}) : #{@today_cheon_meal}")
  end
end