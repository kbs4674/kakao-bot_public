## rake "crawling_sam_do_dogye_dormitory:crawling_sam_do_dogye_dormitory"
## 강원대학교 도계캠퍼스 기숙사 식단

namespace :crawling_sam_do_dogye_dormitory do
  task crawling_sam_do_dogye_dormitory: :environment do
    
    require 'selenium-webdriver'
    if Rails.env.development?
      # Selenium::WebDriver::Chrome.driver_path = `which chromedriver-helper`.chomp
    else
      Selenium::WebDriver::Chrome::Service.driver_path = `which chromedriver-helper`.chomp
    end
    
    ## 헤드리스
    options = Selenium::WebDriver::Chrome::Options.new # 크롬 헤드리스 모드 위해 옵션 설정
    options.add_argument('--disable-gpu') # 크롬 헤드리스 모드 사용 위해 disable-gpu setting
    options.add_argument('--headless') # 크롬 헤드리스 모드 사용 위해 headless setting
    @dogyeDormitory = Selenium::WebDriver.for :chrome, options: options # 실레니움 + 크롬 + 헤드리스 옵션으로 브라우저 실행
    
    ### 도계캠퍼스 기숙사
    @dogyeDormitory.navigate().to "http://dorm.kangwon.ac.kr/new/board/bbs/content.php?co_id=2_7_1"
    @dogyeDormitory.switch_to.frame("contentFrame")
    
    ### 도계캠퍼스 기숙사 메뉴
    @dogyeMeal = @dogyeDormitory.find_elements(css: 'body > table > tbody > tr > td > table.scc_table_01 > tbody')
    @dogyeMeal.each do |t|
      if Time.zone.now.strftime("%A") == "Monday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 10 )
          @dogyeDormitoryMealMenu = t.find_element(css: 'tr:nth-child(1) > td:nth-child(2)').text
          @todayDogyeDormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @todayDogyeDormitoryMealKind = "아침"
          @todayDogyeDormitoryMealTime = "07:40 ~ 09:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 10 && Time.zone.now.strftime("%H").to_i < 14 )
          @dogyeDormitoryMealMenu = t.find_element(css: 'tr:nth-child(1) > td:nth-child(3)').text
          @todayDogyeDormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @todayDogyeDormitoryMealKind = "점심"
          @todayDogyeDormitoryMealTime = "[가온관/도원관] 12:00 ~ 13:30\n[황조관] 12:00 ~ 14:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          @dogyeDormitoryMealMenu = t.find_element(css: 'tr:nth-child(1) > td:nth-child(4)').text
          @todayDogyeDormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @todayDogyeDormitoryMealKind = "저녁"
          @todayDogyeDormitoryMealTime = "17:30 ~ 19:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          @dogyeDormitoryMealMenu = t.find_element(css: 'tr:nth-child(2) > td:nth-child(2)').text
          @todayDogyeDormitoryMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @todayDogyeDormitoryMealKind = "아침"
          @todayDogyeDormitoryMealTime = "07:40 ~ 09:00"
        end
      elsif Time.zone.now.strftime("%A") == "Tuesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 10 )
          @dogyeDormitoryMealMenu = t.find_element(css: 'tr:nth-child(2) > td:nth-child(2)').text
          @todayDogyeDormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @todayDogyeDormitoryMealKind = "아침"
          @todayDogyeDormitoryMealTime = "07:40 ~ 09:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 10 && Time.zone.now.strftime("%H").to_i < 14 )
          @dogyeDormitoryMealMenu = t.find_element(css: 'tr:nth-child(2) > td:nth-child(3)').text
          @todayDogyeDormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @todayDogyeDormitoryMealKind = "점심"
          @todayDogyeDormitoryMealTime = "[가온관/도원관] 12:00 ~ 13:30\n[황조관] 12:00 ~ 14:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          @dogyeDormitoryMealMenu =  t.find_element(css: 'tr:nth-child(2) > td:nth-child(4)').text
          @todayDogyeDormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @todayDogyeDormitoryMealKind = "저녁"
          @todayDogyeDormitoryMealTime = "17:30 ~ 19:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          @dogyeDormitoryMealMenu = t.find_element(css: 'tr:nth-child(2) > td:nth-child(4)').text
          @todayDogyeDormitoryMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @todayDogyeDormitoryMealKind = "아침"
          @todayDogyeDormitoryMealTime = "07:40 ~ 09:00"
        end
      elsif Time.zone.now.strftime("%A") == "Wednesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 10 )
          @dogyeDormitoryMealMenu = t.find_element(css: 'tr:nth-child(3) > td:nth-child(2)').text
          @todayDogyeDormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @todayDogyeDormitoryMealKind = "아침"
          @todayDogyeDormitoryMealTime = "07:40 ~ 09:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 10 && Time.zone.now.strftime("%H").to_i < 14 )
          @dogyeDormitoryMealMenu = t.find_element(css: 'tr:nth-child(3) > td:nth-child(3)').text
          @todayDogyeDormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @todayDogyeDormitoryMealKind = "점심"
          @todayDogyeDormitoryMealTime = "[가온관/도원관] 12:00 ~ 13:30\n[황조관] 12:00 ~ 14:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          @dogyeDormitoryMealMenu = t.find_element(css: 'tr:nth-child(3) > td:nth-child(4)').text
          @todayDogyeDormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @todayDogyeDormitoryMealKind = "저녁"
          @todayDogyeDormitoryMealTime = "17:30 ~ 19:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          @dogyeDormitoryMealMenu = t.find_element(css: 'tr:nth-child(4) > td:nth-child(2)').text
          @todayDogyeDormitoryMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @todayDogyeDormitoryMealKind = "아침"
          @todayDogyeDormitoryMealTime = "07:40 ~ 09:00"
        end
      elsif Time.zone.now.strftime("%A") == "Thursday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 10 )
          @dogyeDormitoryMealMenu = t.find_element(css: 'tr:nth-child(4) > td:nth-child(2)').text
          @todayDogyeDormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @todayDogyeDormitoryMealKind = "아침"
          @todayDogyeDormitoryMealTime = "07:40 ~ 09:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 10 && Time.zone.now.strftime("%H").to_i < 14 )
          @dogyeDormitoryMealMenu = t.find_element(css: 'tr:nth-child(4) > td:nth-child(3)').text
          @todayDogyeDormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @todayDogyeDormitoryMealKind = "점심"
          @todayDogyeDormitoryMealTime = "[가온관/도원관] 12:00 ~ 13:30\n[황조관] 12:00 ~ 14:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          @dogyeDormitoryMealMenu = t.find_element(css: 'tr:nth-child(4) > td:nth-child(4)').text
          @todayDogyeDormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @todayDogyeDormitoryMealKind = "저녁"
          @todayDogyeDormitoryMealTime = "17:30 ~ 19:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          @dogyeDormitoryMealMenu = t.find_element(css: 'tr:nth-child(5) > td:nth-child(2)').text
          @todayDogyeDormitoryMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @todayDogyeDormitoryMealKind = "아침"
          @todayDogyeDormitoryMealTime = "07:40 ~ 09:00"
        end
      elsif Time.zone.now.strftime("%A") == "Friday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 10 )
          @dogyeDormitoryMealMenu = t.find_element(css: 'tr:nth-child(5) > td:nth-child(2)').text
          @todayDogyeDormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @todayDogyeDormitoryMealKind = "아침"
          @todayDogyeDormitoryMealTime = "07:40 ~ 09:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 10 && Time.zone.now.strftime("%H").to_i < 14 )
          @dogyeDormitoryMealMenu = t.find_element(css: 'tr:nth-child(5) > td:nth-child(3)').text
          @todayDogyeDormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @todayDogyeDormitoryMealKind = "점심"
          @todayDogyeDormitoryMealTime = "[가온관/도원관] 12:00 ~ 13:30\n[황조관] 12:00 ~ 14:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          @dogyeDormitoryMealMenu = t.find_element(css: 'tr:nth-child(5) > td:nth-child(4)').text
          @todayDogyeDormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @todayDogyeDormitoryMealKind = "저녁"
          @todayDogyeDormitoryMealTime = "17:30 ~ 19:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          @dogyeDormitoryMealMenu = t.find_element(css: 'tr:nth-child(6) > td:nth-child(3)').text
          @todayDogyeDormitoryMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @todayDogyeDormitoryMealKind = "점심"
          @todayDogyeDormitoryMealTime = "12:00 ~ 13:30"
        end
      elsif (Time.zone.now.strftime("%A") == "Saturday")
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @dogyeDormitoryMealMenu = t.find_element(css: 'tr:nth-child(6) > td:nth-child(3)').text
          @todayDogyeDormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @todayDogyeDormitoryMealKind = "점심"
          @todayDogyeDormitoryMealTime = "12:00 ~ 13:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          @dogyeDormitoryMealMenu = t.find_element(css: 'tr:nth-child(6) > td:nth-child(4)').text
          @todayDogyeDormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @todayDogyeDormitoryMealKind = "저녁"
          @todayDogyeDormitoryMealTime = "17:30 ~ 18:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          @dogyeDormitoryMealMenu = t.find_element(css: 'tr:nth-child(7) > td:nth-child(3)').text
          @todayDogyeDormitoryMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @todayDogyeDormitoryMealKind = "점심"
          @todayDogyeDormitoryMealTime = "12:00 ~ 13:30"
        end
      elsif (Time.zone.now.strftime("%A") == "Sunday")
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @dogyeDormitoryMealMenu = t.find_element(css: 'tr:nth-child(7) > td:nth-child(3)').text
          @todayDogyeDormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @todayDogyeDormitoryMealKind = "점심"
          @todayDogyeDormitoryMealTime = "12:00 ~ 13:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i <= 23 )
          @dogyeDormitoryMealMenu = t.find_element(css: 'tr:nth-child(7) > td:nth-child(4)').text
          @todayDogyeDormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @todayDogyeDormitoryMealKind = "저녁"
          @todayDogyeDormitoryMealTime = "17:30 ~ 18:30"
        end
      end
    end
    
    @dogyeDormitory.quit
    
    if not @dogyeDormitoryMealMenu.nil?
      @dogyeDormitoryMealMenu = @dogyeDormitoryMealMenu.gsub("\n", ", ")
    end
    
    if @dogyeDormitoryMealMenu.nil?
      @todayDogyeDormitoryMealMenu = "학식 미운영"
    else
      @todayDogyeDormitoryMealMenu = @dogyeDormitoryMealMenu.gsub("\n", ", ")
    end
    
    if (@todayDogyeDormitoryMealMenu.nil? || @todayDogyeDormitoryMealMenu.empty?)
      @todayDogyeDormitoryMealMenu = "학식 미운영"
    end
    
    CrawlSamDoMeal.create(title: "도계 기숙사(종합) 식단", campus: "도계", menu: @todayDogyeDormitoryMealMenu, meal_date: @todayDogyeDormitoryMealDate, meal_time: @todayDogyeDormitoryMealTime, kind_of_meal: @todayDogyeDormitoryMealKind, etc: "")
  end
end