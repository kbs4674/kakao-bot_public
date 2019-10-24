## rake "crawling_chun_meal_dorm_normal:crawling_chun_meal_dorm_normal"
#

namespace :crawling_chun_meal_dorm_normal do
  require 'nokogiri'
  require 'open-uri'
  require 'mechanize'
  
  task crawling_chun_meal_dorm_normal: :environment do
    CrawlChunMeal.where(etc: "기숙사").each do |t|
      t.destroy
    end
    
    # 재정 생활관 식단
    doc = Nokogiri::HTML(open("http://knudorm.kangwon.ac.kr/home/sub02/sub02_05_bj.jsp"))
    @dormitory_analyst = doc.css('#foodtab1 > #foodtab1_building1 > table.table_type01')
    @dormitory_analyst.each do |x|
      # 월요일 식단
      if Time.zone.now.strftime("%A") == "Monday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_normal = doc.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(2) > td:nth-child(2)').text.strip
          @dormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @dormitoryKindOfMeal = "아침"
          @dormitoryMealTime = "07:30 ~ 09:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_normal = doc.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(2) > td:nth-child(3)').text.strip
          @dormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @dormitoryKindOfMeal = "점심"
          @dormitoryMealTime = "11:30 ~ 13:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          dormitory_meal_normal = doc.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(2) > td:nth-child(4)').text.strip
          @dormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @dormitoryKindOfMeal = "저녁"
          @dormitoryMealTime = "17:30 ~ 19:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          dormitory_meal_normal = doc.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(3) > td:nth-child(2)').text.strip
          @dormitoryMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @dormitoryKindOfMeal = "아침"
          @dormitoryMealTime = "07:30 ~ 09:00"
        end
      end
      
      # 화요일 식단
      if Time.zone.now.strftime("%A") == "Tuesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_normal = doc.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(3) > td:nth-child(2)').text.strip
          @dormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @dormitoryKindOfMeal = "아침"
          @dormitoryMealTime = "07:30 ~ 09:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_normal = doc.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(3) > td:nth-child(3)').text.strip
          @dormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @dormitoryKindOfMeal = "점심"
          @dormitoryMealTime = "11:30 ~ 13:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          dormitory_meal_normal = doc.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(3) > td:nth-child(4)').text.strip
          @dormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @dormitoryKindOfMeal = "저녁"
          @dormitoryMealTime = "17:30 ~ 19:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          dormitory_meal_normal = doc.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(4) > td:nth-child(2)').text.strip
          @dormitoryMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @dormitoryKindOfMeal = "아침"
          @dormitoryMealTime = "07:30 ~ 09:00"
        end
      end
      
      # 수요일 식단
      if Time.zone.now.strftime("%A") == "Wednesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_normal = doc.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(4) > td:nth-child(2)').text.strip
          @dormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @dormitoryKindOfMeal = "아침"
          @dormitoryMealTime = "07:30 ~ 09:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_normal = doc.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(4) > td:nth-child(3)').text.strip
          @dormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @dormitoryKindOfMeal = "점심"
          @dormitoryMealTime = "11:30 ~ 13:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          dormitory_meal_normal = doc.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(4) > td:nth-child(4)').text.strip
          @dormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @dormitoryKindOfMeal = "저녁"
          @dormitoryMealTime = "17:30 ~ 19:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          dormitory_meal_normal = doc.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(5) > td:nth-child(2)').text.strip
          @dormitoryMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @dormitoryKindOfMeal = "아침"
          @dormitoryMealTime = "07:30 ~ 09:00"
        end
      end
      
      # 목요일 식단
      if Time.zone.now.strftime("%A") == "Thursday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_normal = doc.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(5) > td:nth-child(2)').text.strip
          @dormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @dormitoryKindOfMeal = "아침"
          @dormitoryMealTime = "07:30 ~ 09:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_normal = doc.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(5) > td:nth-child(3)').text.strip
          @dormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @dormitoryKindOfMeal = "점심"
          @dormitoryMealTime = "11:30 ~ 13:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          dormitory_meal_normal = doc.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(5) > td:nth-child(4)').text.strip
          @dormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @dormitoryKindOfMeal = "저녁"
          @dormitoryMealTime = "17:30 ~ 19:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          dormitory_meal_normal = doc.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(6) > td:nth-child(2)').text.strip
          @dormitoryMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @dormitoryKindOfMeal = "아침"
          @dormitoryMealTime = "07:30 ~ 09:00"
        end
      end
      
      # 금요일 식단
      if Time.zone.now.strftime("%A") == "Friday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_normal = doc.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(6) > td:nth-child(2)').text.strip
          @dormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @dormitoryKindOfMeal = "아침"
          @dormitoryMealTime = "07:30 ~ 09:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i <= 14 )
          dormitory_meal_normal = doc.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(6) > td:nth-child(3)').text.strip
          @dormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @dormitoryKindOfMeal = "점심"
          @dormitoryMealTime = "11:30 ~ 13:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          dormitory_meal_normal = doc.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(6) > td:nth-child(4)').text.strip
          @dormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @dormitoryKindOfMeal = "저녁"
          @dormitoryMealTime = "17:30 ~ 19:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          dormitory_meal_normal = doc.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(7) > td:nth-child(2)').text.strip
          @dormitoryMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @dormitoryKindOfMeal = "아침"
          @dormitoryMealTime = "07:30 ~ 09:00"
        end
      end
      
      # 토요일 식단
      if Time.zone.now.strftime("%A") == "Saturday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_normal = doc.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(7) > td:nth-child(2)').text.strip
          @dormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @dormitoryKindOfMeal = "아침"
          @dormitoryMealTime = "주말 운영 ×"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_normal = doc.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(7) > td:nth-child(3)').text.strip
          @dormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @dormitoryKindOfMeal = "점심"
          @dormitoryMealTime = "주말 운영 ×"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          dormitory_meal_normal = doc.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(7) > td:nth-child(4)').text.strip
          @dormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @dormitoryKindOfMeal = "저녁"
          @dormitoryMealTime = "주말 운영 ×"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i <= 23 )
          dormitory_meal_normal = doc.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(8) > td:nth-child(2)').text.strip
          @dormitoryMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @dormitoryKindOfMeal = "아침"
          @dormitoryMealTime = "07:30 ~ 09:00"
        end
      end
      
      # 일요일 식단
      if Time.zone.now.strftime("%A") == "Sunday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_normal = doc.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(8) > td:nth-child(2)').text.strip
          @dormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @dormitoryKindOfMeal = "아침"
          @dormitoryMealTime = "주말 운영 ×"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_normal = doc.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(8) > td:nth-child(3)').text.strip
          @dormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @dormitoryKindOfMeal = "점심"
          @dormitoryMealTime = "주말 운영 ×"
        else
          dormitory_meal_normal = doc.css('#foodtab1 > #foodtab1_building1 > table.table_type01 > tr:nth-child(8) > td:nth-child(4)').text.strip
          @dormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @dormitoryKindOfMeal = "저녁"
          @dormitoryMealTime = "주말 운영 ×"
        end
      end
      
      if dormitory_meal_normal.nil?
        @dormitory_meal_result = dormitory_meal_normal
      else
        @dormitory_meal_result = dormitory_meal_normal.gsub("\r\n", ", ").gsub("\t", "")
      end
    end

    # 새롬관(구 BTL) 생활관 식단
    @BTL_analyst = doc.css('#foodtab2 > table.table_type01')
    @BTL_analyst.each do |x|
      # 월요일 식단
      if Time.zone.now.strftime("%A") == "Monday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_BTL = doc.css('#foodtab2 > table.table_type01 > tr:nth-child(2) > td:nth-child(2)').text.strip
          @BTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @BTLKindOfMeal = "아침"
          @BTLMealTime = "08:00 ~ 09:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_BTL = doc.css('#foodtab2 > table.table_type01 > tr:nth-child(2) > td:nth-child(3)').text.strip
          @BTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @BTLKindOfMeal = "점심"
          @BTLMealTime = "11:30 ~ 13:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          dormitory_meal_BTL = doc.css('#foodtab2 > table.table_type01 > tr:nth-child(2) > td:nth-child(4)').text.strip
          @BTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @BTLKindOfMeal = "저녁"
          @BTLMealTime = "17:00 ~ 18:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i <= 23 )
          dormitory_meal_BTL = doc.css('#foodtab2 > table.table_type01 > tr:nth-child(3) > td:nth-child(2)').text.strip
          @BTLMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @BTLKindOfMeal = "아침"
          @BTLMealTime = "08:00 ~ 09:00"
        end
      end

      # 화요일 식단
      if Time.zone.now.strftime("%A") == "Tuesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_BTL = doc.css('#foodtab2 > table.table_type01 > tr:nth-child(3) > td:nth-child(2)').text.strip
          @BTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @BTLKindOfMeal = "아침"
          @BTLMealTime = "08:00 ~ 09:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_BTL = doc.css('#foodtab2 > table.table_type01 > tr:nth-child(3) > td:nth-child(3)').text.strip
          @BTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @BTLKindOfMeal = "점심"
          @BTLMealTime = "11:30 ~ 13:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          dormitory_meal_BTL = doc.css('#foodtab2 > table.table_type01 > tr:nth-child(3) > td:nth-child(4)').text.strip
          @BTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @BTLKindOfMeal = "저녁"
          @BTLMealTime = "17:00 ~ 18:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i <= 23 )
          dormitory_meal_BTL = doc.css('#foodtab2 > table.table_type01 > tr:nth-child(4) > td:nth-child(2)').text.strip
          @BTLMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @BTLKindOfMeal = "아침"
          @BTLMealTime = "08:00 ~ 09:00"
        end
      end

      # 수요일 식단
      if Time.zone.now.strftime("%A") == "Wednesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_BTL = doc.css('#foodtab2 > table.table_type01 > tr:nth-child(4) > td:nth-child(2)').text.strip
          @BTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @BTLKindOfMeal = "아침"
          @BTLMealTime = "08:00 ~ 09:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_BTL = doc.css('#foodtab2 > table.table_type01 > tr:nth-child(4) > td:nth-child(3)').text.strip
          @BTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @BTLKindOfMeal = "점심"
          @BTLMealTime = "11:30 ~ 13:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          dormitory_meal_BTL = doc.css('#foodtab2 > table.table_type01 > tr:nth-child(4) > td:nth-child(4)').text.strip
          @BTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @BTLKindOfMeal = "저녁"
          @BTLMealTime = "17:00 ~ 18:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i <= 23 )
          dormitory_meal_BTL = doc.css('#foodtab2 > table.table_type01 > tr:nth-child(5) > td:nth-child(2)').text.strip
          @BTLMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @BTLKindOfMeal = "아침"
          @BTLMealTime = "08:00 ~ 09:00"
        end
      end

      # 목요일 식단
      if Time.zone.now.strftime("%A") == "Thursday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_BTL = doc.css('#foodtab2 > table.table_type01 > tr:nth-child(5) > td:nth-child(2)').text.strip
          @BTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @BTLKindOfMeal = "아침"
          @BTLMealTime = "08:00 ~ 09:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_BTL = doc.css('#foodtab2 > table.table_type01 > tr:nth-child(5) > td:nth-child(3)').text.strip
          @BTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @BTLKindOfMeal = "점심"
          @BTLMealTime = "11:30 ~ 13:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          dormitory_meal_BTL = doc.css('#foodtab2 > table.table_type01 > tr:nth-child(5) > td:nth-child(4)').text.strip
          @BTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @BTLKindOfMeal = "저녁"
          @BTLMealTime = "17:00 ~ 18:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i <= 23 )
          dormitory_meal_BTL = doc.css('#foodtab2 > table.table_type01 > tr:nth-child(6) > td:nth-child(2)').text.strip
          @BTLMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @BTLKindOfMeal = "아침"
          @BTLMealTime = "08:00 ~ 09:00"
        end
      end

      # 금요일 식단
      if Time.zone.now.strftime("%A") == "Friday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_BTL = doc.css('#foodtab2 > table.table_type01 > tr:nth-child(6) > td:nth-child(2)').text.strip
          @BTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @BTLKindOfMeal = "아침"
          @BTLMealTime = "08:00 ~ 09:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_BTL = doc.css('#foodtab2 > table.table_type01 > tr:nth-child(6) > td:nth-child(3)').text.strip
          @BTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @BTLKindOfMeal = "점심"
          @BTLMealTime = "11:30 ~ 13:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          dormitory_meal_BTL = doc.css('#foodtab2 > table.table_type01 > tr:nth-child(6) > td:nth-child(4)').text.strip
          @BTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @BTLKindOfMeal = "저녁"
          @BTLMealTime = "17:00 ~ 18:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i <= 23 )
          dormitory_meal_BTL = doc.css('#foodtab2 > table.table_type01 > tr:nth-child(7) > td:nth-child(2)').text.strip
          @BTLMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @BTLKindOfMeal = "아침"
          @BTLMealTime = "08:00 ~ 09:00"
        end
      end

      # 토요일 식단
      if Time.zone.now.strftime("%A") == "Saturday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_BTL = doc.css('#foodtab2 > table.table_type01 > tr:nth-child(7) > td:nth-child(2)').text.strip
          @BTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @BTLKindOfMeal = "아침"
          @BTLMealTime = "08:00 ~ 09:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_BTL = doc.css('#foodtab2 > table.table_type01 > tr:nth-child(7) > td:nth-child(3)').text.strip
          @BTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @BTLKindOfMeal = "점심"
          @BTLMealTime = "12:00 ~ 13:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          dormitory_meal_BTL = doc.css('#foodtab2 > table.table_type01 > tr:nth-child(7) > td:nth-child(4)').text.strip
          @BTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @BTLKindOfMeal = "저녁"
          @BTLMealTime = "17:30 ~ 18:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i <= 23 )
          dormitory_meal_BTL = doc.css('#foodtab2 > table.table_type01 > tr:nth-child(8) > td:nth-child(2)').text.strip
          @BTLMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @BTLKindOfMeal = "아침"
          @BTLMealTime = "08:00 ~ 09:00"
        end
      end

      # 일요일 식단
      if Time.zone.now.strftime("%A") == "Sunday"
        if (Time.zone.now.strftime("%H").to_i > 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_BTL = doc.css('#foodtab2 > table.table_type01 > tr:nth-child(8) > td:nth-child(2)').text.strip
          @BTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @BTLKindOfMeal = "아침"
          @BTLMealTime = "08:00 ~ 09:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 14 )
          dormitory_meal_BTL = doc.css('#foodtab2 > table.table_type01 > tr:nth-child(8) > td:nth-child(3)').text.strip
          @BTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @BTLKindOfMeal = "점심"
          @BTLMealTime = "12:00 ~ 13:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i <= 23 )
          dormitory_meal_BTL = doc.css('#foodtab2 > table.table_type01 > tr:nth-child(8) > td:nth-child(4)').text.strip
          @BTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @BTLKindOfMeal = "저녁"
          @BTLMealTime = "17:30 ~ 18:30"
        end
      end

      if dormitory_meal_BTL.nil?
        @BTL_meal_result = dormitory_meal_BTL
      else
        @BTL_meal_result = dormitory_meal_BTL.gsub("\r\n", ", ").gsub("\t", "")
      end
    end

    # 이롬관(신 BTL) 생활관 식단
    @Lee_BTL_analyst = doc.css('#foodtab3 > table.table_type01')
    @Lee_BTL_analyst.each do |x|
      # 월요일 식단
      if Time.zone.now.strftime("%A") == "Monday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_Lee_BTL = doc.css('#foodtab3 > table.table_type01 > tr:nth-child(2) > td:nth-child(2)').text.strip
          @LeeBTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @LeeBTLKindOfMeal = "아침"
          @LeeBTLMealTime = "08:00 ~ 09:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 13 )
          dormitory_meal_Lee_BTL = doc.css('#foodtab3 > table.table_type01 > tr:nth-child(2) > td:nth-child(3)').text.strip
          @LeeBTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @LeeBTLKindOfMeal = "점심"
          @LeeBTLMealTime = "11:30 ~ 13:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 13 && Time.zone.now.strftime("%H").to_i < 19 )
          dormitory_meal_Lee_BTL = doc.css('#foodtab3 > table.table_type01 > tr:nth-child(2) > td:nth-child(4)').text.strip
          @LeeBTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @LeeBTLKindOfMeal = "저녁"
          @LeeBTLMealTime = "17:30 ~ 18:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          dormitory_meal_Lee_BTL = doc.css('#foodtab3 > table.table_type01 > tr:nth-child(3) > td:nth-child(2)').text.strip
          @LeeBTLMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @LeeBTLKindOfMeal = "아침"
          @LeeBTLMealTime = "08:00 ~ 09:00"
        end
      end

      # 화요일 식단
      if Time.zone.now.strftime("%A") == "Tuesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_Lee_BTL = doc.css('#foodtab3 > table.table_type01 > tr:nth-child(3) > td:nth-child(2)').text.strip
          @LeeBTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @LeeBTLKindOfMeal = "아침"
          @LeeBTLMealTime = "08:00 ~ 09:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 13 )
          dormitory_meal_Lee_BTL = doc.css('#foodtab3 > table.table_type01 > tr:nth-child(3) > td:nth-child(3)').text.strip
          @LeeBTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @LeeBTLKindOfMeal = "점심"
          @LeeBTLMealTime = "11:30 ~ 13:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 13 && Time.zone.now.strftime("%H").to_i < 19 )
          dormitory_meal_Lee_BTL = doc.css('#foodtab3 > table.table_type01 > tr:nth-child(3) > td:nth-child(4)').text.strip
          @LeeBTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @LeeBTLKindOfMeal = "저녁"
          @LeeBTLMealTime = "17:30 ~ 18:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          dormitory_meal_Lee_BTL = doc.css('#foodtab3 > table.table_type01 > tr:nth-child(4) > td:nth-child(2)').text.strip
          @LeeBTLMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @LeeBTLKindOfMeal = "아침"
          @LeeBTLMealTime = "08:00 ~ 09:00"
        end
      end

      # 수요일 식단
      if Time.zone.now.strftime("%A") == "Wednesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_Lee_BTL = doc.css('#foodtab3 > table.table_type01 > tr:nth-child(4) > td:nth-child(2)').text.strip
          @LeeBTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @LeeBTLKindOfMeal = "아침"
          @LeeBTLMealTime = "08:00 ~ 09:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 13 )
          dormitory_meal_Lee_BTL = doc.css('#foodtab3 > table.table_type01 > tr:nth-child(4) > td:nth-child(3)').text.strip
          @LeeBTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @LeeBTLKindOfMeal = "점심"
          @LeeBTLMealTime = "11:30 ~ 13:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 13 && Time.zone.now.strftime("%H").to_i < 19 )
          dormitory_meal_Lee_BTL = doc.css('#foodtab3 > table.table_type01 > tr:nth-child(4) > td:nth-child(4)').text.strip
          @LeeBTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @LeeBTLKindOfMeal = "저녁"
          @LeeBTLMealTime = "17:30 ~ 18:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          dormitory_meal_Lee_BTL = doc.css('#foodtab3 > table.table_type01 > tr:nth-child(5) > td:nth-child(2)').text.strip
          @LeeBTLMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @LeeBTLKindOfMeal = "아침"
          @LeeBTLMealTime = "08:00 ~ 09:00"
        end
      end

      # 목요일 식단
      if Time.zone.now.strftime("%A") == "Thursday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_Lee_BTL = doc.css('#foodtab3 > table.table_type01 > tr:nth-child(5) > td:nth-child(2)').text.strip
          @LeeBTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @LeeBTLKindOfMeal = "아침"
          @LeeBTLMealTime = "08:00 ~ 09:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 13 )
          dormitory_meal_Lee_BTL = doc.css('#foodtab3 > table.table_type01 > tr:nth-child(5) > td:nth-child(3)').text.strip
          @LeeBTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @LeeBTLKindOfMeal = "점심"
          @LeeBTLMealTime = "11:30 ~ 13:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 13 && Time.zone.now.strftime("%H").to_i < 19 )
          dormitory_meal_Lee_BTL = doc.css('#foodtab3 > table.table_type01 > tr:nth-child(5) > td:nth-child(4)').text.strip
          @LeeBTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @LeeBTLKindOfMeal = "저녁"
          @LeeBTLMealTime = "17:30 ~ 18:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          dormitory_meal_Lee_BTL = doc.css('#foodtab3 > table.table_type01 > tr:nth-child(6) > td:nth-child(2)').text.strip
          @LeeBTLMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @LeeBTLKindOfMeal = "아침"
          @LeeBTLMealTime = "08:00 ~ 09:00"
        end
      end

      # 금요일 식단
      if Time.zone.now.strftime("%A") == "Friday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_Lee_BTL = doc.css('#foodtab3 > table.table_type01 > tr:nth-child(6) > td:nth-child(2)').text.strip
          @LeeBTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @LeeBTLKindOfMeal = "아침"
          @LeeBTLMealTime = "08:00 ~ 09:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 13 )
          dormitory_meal_Lee_BTL = doc.css('#foodtab3 > table.table_type01 > tr:nth-child(6) > td:nth-child(3)').text.strip
          @LeeBTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @LeeBTLKindOfMeal = "점심"
          @LeeBTLMealTime = "11:30 ~ 13:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 13 && Time.zone.now.strftime("%H").to_i < 19 )
          dormitory_meal_Lee_BTL = doc.css('#foodtab3 > table.table_type01 > tr:nth-child(6) > td:nth-child(4)').text.strip
          @LeeBTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @LeeBTLKindOfMeal = "저녁"
          @LeeBTLMealTime = "17:30 ~ 18:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          dormitory_meal_Lee_BTL = doc.css('#foodtab3 > table.table_type01 > tr:nth-child(7) > td:nth-child(2)').text.strip
          @LeeBTLMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @LeeBTLKindOfMeal = "아침"
          @LeeBTLMealTime = "08:00 ~ 09:00"
        end
      end

      # 토요일 식단
      if Time.zone.now.strftime("%A") == "Saturday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_Lee_BTL = doc.css('#foodtab3 > table.table_type01 > tr:nth-child(7) > td:nth-child(2)').text.strip
          @LeeBTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @LeeBTLKindOfMeal = "아침"
          @LeeBTLMealTime = "08:00 ~ 09:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 13 )
          dormitory_meal_Lee_BTL = doc.css('#foodtab3 > table.table_type01 > tr:nth-child(7) > td:nth-child(3)').text.strip
          @LeeBTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @LeeBTLKindOfMeal = "점심"
          @LeeBTLMealTime = "12:00 ~ 13:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 13 && Time.zone.now.strftime("%H").to_i < 19 )
          dormitory_meal_Lee_BTL = doc.css('#foodtab3 > table.table_type01 > tr:nth-child(7) > td:nth-child(4)').text.strip
          @LeeBTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @LeeBTLKindOfMeal = "저녁"
          @LeeBTLMealTime = "17:30 ~ 18:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          dormitory_meal_Lee_BTL = doc.css('#foodtab3 > table.table_type01 > tr:nth-child(8) > td:nth-child(2)').text.strip
          @LeeBTLMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @LeeBTLKindOfMeal = "아침"
          @LeeBTLMealTime = "08:00 ~ 09:00"
        end
      end

      # 일요일 식단
      if Time.zone.now.strftime("%A") == "Sunday"
        if (Time.zone.now.strftime("%H").to_i > 0 && Time.zone.now.strftime("%H").to_i <= 8 )
          dormitory_meal_Lee_BTL = doc.css('#foodtab3 > table.table_type01 > tr:nth-child(8) > td:nth-child(2)').text.strip
          @LeeBTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @LeeBTLKindOfMeal = "아침"
          @LeeBTLMealTime = "08:00 ~ 09:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 9 && Time.zone.now.strftime("%H").to_i < 13 )
          dormitory_meal_Lee_BTL = doc.css('#foodtab3 > table.table_type01 > tr:nth-child(8) > td:nth-child(3)').text.strip
          @LeeBTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @LeeBTLKindOfMeal = "점심"
          @LeeBTLMealTime = "12:00 ~ 13:00"
        else
          dormitory_meal_Lee_BTL = doc.css('#foodtab3 > table.table_type01 > tr:nth-child(8) > td:nth-child(4)').text.strip
          @LeeBTLMealDate = Time.zone.now.strftime('%m월 %d일')
          @LeeBTLKindOfMeal = "저녁"
          @LeeBTLMealTime = "17:30 ~ 18:30"
        end
      end

      if dormitory_meal_Lee_BTL.nil?
        @Lee_BTL_meal_result = dormitory_meal_Lee_BTL
      else
        @Lee_BTL_meal_result = dormitory_meal_Lee_BTL.gsub("\r\n", ", ").gsub("\t", "")
      end
    end
    
    if @dormitory_meal_result.empty?
      @dormitory_meal_result = "학식 미운영"
    end
    
    if @BTL_meal_result.empty?
      @BTL_meal_result = "학식 미운영"
    end
    
    if @Lee_BTL_meal_result.empty?
      @Lee_BTL_meal_result = "학식 미운영"
    end

    # CrawlChunMeal.create(title: "새롬관(구 BTL) 메뉴 (#{Time.zone.now.strftime('%m월 %d일')} #{@BTLKindOfMeal}) : #{@BTL_meal_result}")
    CrawlChunMeal.create(title: "재정생활관", menu: @dormitory_meal_result, meal_date: @dormitoryMealDate, meal_time: @dormitoryMealTime, kind_of_meal: @dormitoryKindOfMeal, etc: "기숙사")
    CrawlChunMeal.create(title: "새롬관(구 BTL)", menu: @BTL_meal_result, meal_date: @BTLMealDate, meal_time: @BTLMealTime, kind_of_meal: @BTLKindOfMeal, etc: "기숙사")
    CrawlChunMeal.create(title: "이룸관(신 BTL)", menu: @Lee_BTL_meal_result, meal_date: @LeeBTLMealDate, meal_time: @LeeBTLMealTime, kind_of_meal: @LeeBTLKindOfMeal, etc: "기숙사")
  end
end