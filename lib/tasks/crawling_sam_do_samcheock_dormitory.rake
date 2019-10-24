## rake "crawling_sam_do_samcheock_dormitory:crawling_sam_do_samcheock_dormitory"
## 강원대학교 삼척캠퍼스 기숙사 식단

namespace :crawling_sam_do_samcheock_dormitory do
  task crawling_sam_do_samcheock_dormitory: :environment do
    
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
    @samcheockDormitory = Selenium::WebDriver.for :chrome, options: options # 실레니움 + 크롬 + 헤드리스 옵션으로 브라우저 실행
    
    ### 삼척캠퍼스 기숙사
    @samcheockDormitory.navigate().to "http://dormitory.kangwon.ac.kr/dorm/2016/sub02_06.jsp"
    
    ### 삼척캠퍼스 기숙사 메뉴
    @samcheock = @samcheockDormitory.find_elements(css: '#container > div > div.right_section > div.article > table')
    @samcheock.each do |t|
      if Time.zone.now.strftime("%A") == "Monday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 10 )
          @samcheockDormitoryMealMenu = t.find_element(css: 'tr:nth-child(2) > td:nth-child(2)').text
          @todaySamcheockDormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @todaySamcheockDormitoryMealKind = "아침"
          @todaySamcheockDormitoryMealTime = "07:40 ~ 09:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 10 && Time.zone.now.strftime("%H").to_i < 14 )
          @samcheockDormitoryMealMenu = t.find_element(css: 'tr:nth-child(2) > td:nth-child(3)').text
          @todaySamcheockDormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @todaySamcheockDormitoryMealKind = "점심"
          @todaySamcheockDormitoryMealTime = "12:00 ~ 13:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          @samcheockDormitoryMealMenu = t.find_element(css: 'tr:nth-child(2) > td:nth-child(4)').text
          @todaySamcheockDormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @todaySamcheockDormitoryMealKind = "저녁"
          @todaySamcheockDormitoryMealTime = "17:30 ~ 19:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          @samcheockDormitoryMealMenu = t.find_element(css: 'tr:nth-child(3) > td:nth-child(2)').text
          @todaySamcheockDormitoryMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @todaySamcheockDormitoryMealKind = "아침"
          @todaySamcheockDormitoryMealTime = "07:40 ~ 09:00"
        end
      elsif Time.zone.now.strftime("%A") == "Tuesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 10 )
          @samcheockDormitoryMealMenu = t.find_element(css: 'tr:nth-child(3) > td:nth-child(2)').text
          @todaySamcheockDormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @todaySamcheockDormitoryMealKind = "아침"
          @todaySamcheockDormitoryMealTime = "07:40 ~ 09:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 10 && Time.zone.now.strftime("%H").to_i < 14 )
          @samcheockDormitoryMealMenu = t.find_element(css: 'tr:nth-child(3) > td:nth-child(3)').text
          @todaySamcheockDormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @todaySamcheockDormitoryMealKind = "점심"
          @todaySamcheockDormitoryMealTime = "12:00 ~ 13:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          @samcheockDormitoryMealMenu =  t.find_element(css: 'tr:nth-child(3) > td:nth-child(4)').text
          @todaySamcheockDormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @todaySamcheockDormitoryMealKind = "저녁"
          @todaySamcheockDormitoryMealTime = "17:30 ~ 19:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          @samcheockDormitoryMealMenu = t.find_element(css: 'tr:nth-child(4) > td:nth-child(2)').text
          @todaySamcheockDormitoryMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @todaySamcheockDormitoryMealKind = "아침"
          @todaySamcheockDormitoryMealTime = "07:40 ~ 09:00"
        end
      elsif Time.zone.now.strftime("%A") == "Wednesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 10 )
          @samcheockDormitoryMealMenu = t.find_element(css: 'tr:nth-child(4) > td:nth-child(2)').text
          @todaySamcheockDormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @todaySamcheockDormitoryMealKind = "아침"
          @todaySamcheockDormitoryMealTime = "07:40 ~ 09:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 10 && Time.zone.now.strftime("%H").to_i < 14 )
          @samcheockDormitoryMealMenu = t.find_element(css: 'tr:nth-child(4) > td:nth-child(3)').text
          @todaySamcheockDormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @todaySamcheockDormitoryMealKind = "점심"
          @todaySamcheockDormitoryMealTime = "12:00 ~ 13:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          @samcheockDormitoryMealMenu = t.find_element(css: 'tr:nth-child(4) > td:nth-child(4)').text
          @todaySamcheockDormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @todaySamcheockDormitoryMealKind = "저녁"
          @todaySamcheockDormitoryMealTime = "17:30 ~ 19:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          @samcheockDormitoryMealMenu = t.find_element(css: 'tr:nth-child(5) > td:nth-child(2)').text
          @todaySamcheockDormitoryMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @todaySamcheockDormitoryMealKind = "아침"
          @todaySamcheockDormitoryMealTime = "07:40 ~ 09:00"
        end
      elsif Time.zone.now.strftime("%A") == "Thursday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 10 )
          @samcheockDormitoryMealMenu = t.find_element(css: 'tr:nth-child(5) > td:nth-child(2)').text
          @todaySamcheockDormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @todaySamcheockDormitoryMealKind = "아침"
          @todaySamcheockDormitoryMealTime = "07:40 ~ 09:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 10 && Time.zone.now.strftime("%H").to_i < 14 )
          @samcheockDormitoryMealMenu = t.find_element(css: 'tr:nth-child(5) > td:nth-child(3)').text
          @todaySamcheockDormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @todaySamcheockDormitoryMealKind = "점심"
          @todaySamcheockDormitoryMealTime = "12:00 ~ 13:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          @samcheockDormitoryMealMenu = t.find_element(css: 'tr:nth-child(5) > td:nth-child(4)').text
          @todaySamcheockDormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @todaySamcheockDormitoryMealKind = "저녁"
          @todaySamcheockDormitoryMealTime = "17:30 ~ 19:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          @samcheockDormitoryMealMenu = t.find_element(css: 'tr:nth-child(6) > td:nth-child(2)').text
          @todaySamcheockDormitoryMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @todaySamcheockDormitoryMealKind = "아침"
          @todaySamcheockDormitoryMealTime = "07:40 ~ 09:00"
        end
      elsif Time.zone.now.strftime("%A") == "Friday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 10 )
          @samcheockDormitoryMealMenu = t.find_element(css: 'tr:nth-child(6) > td:nth-child(2)').text
          @todaySamcheockDormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @todaySamcheockDormitoryMealKind = "아침"
          @todaySamcheockDormitoryMealTime = "07:40 ~ 09:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 10 && Time.zone.now.strftime("%H").to_i < 14 )
          @samcheockDormitoryMealMenu = t.find_element(css: 'tr:nth-child(6) > td:nth-child(3)').text
          @todaySamcheockDormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @todaySamcheockDormitoryMealKind = "점심"
          @todaySamcheockDormitoryMealTime = ""
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          @samcheockDormitoryMealMenu = t.find_element(css: 'tr:nth-child(6) > td:nth-child(4)').text
          @todaySamcheockDormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
          @todaySamcheockDormitoryMealKind = "저녁"
          @todaySamcheockDormitoryMealTime = "17:30 ~ 19:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          @samcheockDormitoryMealMenu = "학식 미운영"
          @todaySamcheockDormitoryMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @todaySamcheockDormitoryMealKind = "-"
          @todaySamcheockDormitoryMealTime = "-"
        end
      elsif (Time.zone.now.strftime("%A") == "Saturday") || (Time.zone.now.strftime("%A") == "Sunday")
        @samcheockDormitoryMealMenu = "학식 미운영"
        @todaySamcheockDormitoryMealDate = Time.zone.now.strftime('%m월 %d일')
        @todaySamcheockDormitoryMealKind = "-"
        @todaySamcheockDormitoryMealTime = "-"
      end
    end
    
    @samcheockDormitory.quit
    
    if not @samcheockDormitoryMealMenu.nil?
      @samcheockDormitoryMealMenu = @samcheockDormitoryMealMenu.gsub("\n", ", ")
    end
    
    if @samcheockDormitoryMealMenu.nil?
      @todaydogyeDormitoryMealMenu = "학식 미운영"
    else
      @todaydogyeDormitoryMealMenu = @samcheockDormitoryMealMenu.gsub("\n", ", ")
    end
    
    if (@todaydogyeDormitoryMealMenu.nil? || @todaydogyeDormitoryMealMenu.empty?)
      @todaydogyeDormitoryMealMenu = "학식 미운영"
    end
    
    CrawlSamDoMeal.create(title: "삼척 기숙사(종합) 식단", campus: "삼척", menu: @todaydogyeDormitoryMealMenu, meal_date: @todaySamcheockDormitoryMealDate, meal_time: @todaySamcheockDormitoryMealTime, kind_of_meal: @todaySamcheockDormitoryMealKind, etc: "")
  end
end