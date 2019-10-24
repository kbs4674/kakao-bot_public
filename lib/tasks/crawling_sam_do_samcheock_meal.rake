## rake "crawling_sam_do_samcheock_meal:crawling_sam_do_samcheock_meal"
## 강원대학교 삼척캠퍼스 식단메뉴

namespace :crawling_sam_do_samcheock_meal do
  task crawling_sam_do_samcheock_meal: :environment do
    
    CrawlSamDoMeal.where(campus: "삼척").each do |t|
      t.destroy
    end
    
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
    @samCheock = Selenium::WebDriver.for :chrome, options: options # 실레니움 + 크롬 + 헤드리스 옵션으로 브라우저 실행
    
    ### 삼척캠퍼스 식단메뉴
    @samCheock.navigate().to "https://www.kangwon.ac.kr/www/selecttnCafMenuListWU.do?key=1261&sc1=SC20&sc2="
    
    ### 삼척캠퍼스 제 5공학관 식단메뉴 : 백반
    @samCheock5Engineer = @samCheock.find_elements(css: '#contents > table:nth-child(5) > tbody')
    @samCheock5Engineer.each do |t|
      @samcheockMealTitle = t.find_element(css: 'tr:nth-child(1) > th:nth-child(1)').text
      if Time.zone.now.strftime("%A") == "Monday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @samCheock5EngineerMealMenu = t.find_element(css: 'tr:nth-child(1) > td:nth-child(3)').text
          @today5EngineerMealDate = Time.zone.now.strftime('%m월 %d일')
          @today5EngineerMealKind = "점심"
          @today5EngineerMealTime = "12:00 ~ 13:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 18 )
          @samCheock5EngineerMealMenu = t.find_element(css: 'tr:nth-child(2) > td:nth-child(2)').text
          @today5EngineerMealDate = Time.zone.now.strftime('%m월 %d일')
          @today5EngineerMealKind = "저녁"
          @today5EngineerMealTime = "17:00 ~ 17:40"
        elsif (Time.zone.now.strftime("%H").to_i >= 18 && Time.zone.now.strftime("%H").to_i <= 23 )
          @samCheock5EngineerMealMenu = t.find_element(css: 'tr:nth-child(1) > td:nth-child(4)').text
          @today5EngineerMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @today5EngineerMealKind = "점심"
          @today5EngineerMealTime = "12:00 ~ 13:30"
        end
      elsif Time.zone.now.strftime("%A") == "Tuesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @samCheock5EngineerMealMenu = t.find_element(css: 'tr:nth-child(1) > td:nth-child(4)').text
          @today5EngineerMealDate = Time.zone.now.strftime('%m월 %d일')
          @today5EngineerMealKind = "점심"
          @today5EngineerMealTime = "12:00 ~ 13:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 18 )
          @samCheock5EngineerMealMenu = t.find_element(css: 'tr:nth-child(2) > td:nth-child(3)').text
          @today5EngineerMealDate = Time.zone.now.strftime('%m월 %d일')
          @today5EngineerMealKind = "저녁"
          @today5EngineerMealTime = "17:00 ~ 17:40"
        elsif (Time.zone.now.strftime("%H").to_i >= 18 && Time.zone.now.strftime("%H").to_i <= 23 )
          @samCheock5EngineerMealMenu = t.find_element(css: 'tr:nth-child(1) > td:nth-child(5)').text
          @today5EngineerMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @today5EngineerMealKind = "점심"
          @today5EngineerMealTime = "12:00 ~ 13:30"
        end
      elsif Time.zone.now.strftime("%A") == "Wednesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @samCheock5EngineerMealMenu = t.find_element(css: 'tr:nth-child(1) > td:nth-child(5)').text
          @today5EngineerMealDate = Time.zone.now.strftime('%m월 %d일')
          @today5EngineerMealKind = "점심"
          @today5EngineerMealTime = "12:00 ~ 13:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 18 )
          @samCheock5EngineerMealMenu = t.find_element(css: 'tr:nth-child(2) > td:nth-child(4)').text
          @today5EngineerMealDate = Time.zone.now.strftime('%m월 %d일')
          @today5EngineerMealKind = "저녁"
          @today5EngineerMealTime = "17:00 ~ 17:40"
        elsif (Time.zone.now.strftime("%H").to_i >= 18 && Time.zone.now.strftime("%H").to_i <= 23 )
          @samCheock5EngineerMealMenu = t.find_element(css: 'tr:nth-child(1) > td:nth-child(6)').text
          @today5EngineerMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @today5EngineerMealKind = "점심"
          @today5EngineerMealTime = "12:00 ~ 13:30"
        end
      elsif Time.zone.now.strftime("%A") == "Thursday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @samCheock5EngineerMealMenu = t.find_element(css: 'tr:nth-child(1) > td:nth-child(6)').text
          @today5EngineerMealDate = Time.zone.now.strftime('%m월 %d일')
          @today5EngineerMealKind = "점심"
          @today5EngineerMealTime = "12:00 ~ 13:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 18 )
          @samCheock5EngineerMealMenu = t.find_element(css: 'tr:nth-child(2) > td:nth-child(5)').text
          @today5EngineerMealDate = Time.zone.now.strftime('%m월 %d일')
          @today5EngineerMealKind = "저녁"
          @today5EngineerMealTime = "17:00 ~ 17:40"
        elsif (Time.zone.now.strftime("%H").to_i >= 18 && Time.zone.now.strftime("%H").to_i <= 23 )
          @samCheock5EngineerMealMenu = t.find_element(css: 'tr:nth-child(1) > td:nth-child(7)').text
          @today5EngineerMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @today5EngineerMealKind = "점심"
          @today5EngineerMealTime = "12:00 ~ 13:30"
        end
      elsif Time.zone.now.strftime("%A") == "Friday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @samCheock5EngineerMealMenu = t.find_element(css: 'tr:nth-child(1) > td:nth-child(7)').text
          @today5EngineerMealDate = Time.zone.now.strftime('%m월 %d일')
          @today5EngineerMealKind = "점심"
          @today5EngineerMealTime = "12:00 ~ 13:30"
        else
          @samCheock5EngineerMealMenu = t.find_element(css: 'tr:nth-child(2) > td:nth-child(6)').text
          @today5EngineerMealDate = Time.zone.now.strftime('%m월 %d일')
          @today5EngineerMealKind = "저녁"
          @today5EngineerMealTime = "17:00 ~ 17:40"
        end
      elsif Time.zone.now.strftime("%A") == "Saturday" || Time.zone.now.strftime("%A") == "Sunday"
        @samCheock5EngineerMealMenu = nil
        @today5EngineerMealDate = Time.zone.now.strftime('%m월 %d일')
        @today5EngineerMealKind = "-"
        @today5EngineerMealTime = "-"
      end
    end
    
    
    ### 삼척캠퍼스 제 5공학관 식단메뉴 : 덮밥
    @samCheock5Engineer.each do |t|
      @samcheockRiceToppingTitle = t.find_element(css: 'tr:nth-child(3) > th:nth-child(1)').text
      if Time.zone.now.strftime("%A") == "Monday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @samCheock5EngineerRiceToppingMenu = t.find_element(css: 'tr:nth-child(3) > td:nth-child(3)').text
          @today5EngineerRiceToppingDate = Time.zone.now.strftime('%m월 %d일')
          @today5EngineerRiceToppingKind = "점심"
          @today5EngineerRiceToppingTime = "12:00 ~ 13:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 18 )
          @samCheock5EngineerRiceToppingMenu = t.find_element(css: 'tr:nth-child(4) > td:nth-child(2)').text
          @today5EngineerRiceToppingDate = Time.zone.now.strftime('%m월 %d일')
          @today5EngineerRiceToppingKind = "저녁"
          @today5EngineerRiceToppingTime = "17:00 ~ 17:40"
        elsif (Time.zone.now.strftime("%H").to_i >= 18 && Time.zone.now.strftime("%H").to_i <= 23 )
          @samCheock5EngineerRiceToppingMenu = t.find_element(css: 'tr:nth-child(3) > td:nth-child(4)').text
          @today5EngineerRiceToppingDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @today5EngineerRiceToppingKind = "점심"
          @today5EngineerRiceToppingTime = "12:00 ~ 13:30"
        end
      elsif Time.zone.now.strftime("%A") == "Tuesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @samCheock5EngineerRiceToppingMenu = t.find_element(css: 'tr:nth-child(3) > td:nth-child(4)').text
          @today5EngineerRiceToppingDate = Time.zone.now.strftime('%m월 %d일')
          @today5EngineerRiceToppingKind = "점심"
          @today5EngineerRiceToppingTime = "12:00 ~ 13:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 18 )
          @samCheock5EngineerRiceToppingMenu = t.find_element(css: 'tr:nth-child(4) > td:nth-child(3)').text
          @today5EngineerRiceToppingDate = Time.zone.now.strftime('%m월 %d일')
          @today5EngineerRiceToppingKind = "저녁"
          @today5EngineerRiceToppingTime = "17:00 ~ 17:40"
        elsif (Time.zone.now.strftime("%H").to_i >= 18 && Time.zone.now.strftime("%H").to_i <= 23 )
          @samCheock5EngineerRiceToppingMenu = t.find_element(css: 'tr:nth-child(3) > td:nth-child(5)').text
          @today5EngineerRiceToppingDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @today5EngineerRiceToppingKind = "점심"
          @today5EngineerRiceToppingTime = "12:00 ~ 13:30"
        end
      elsif Time.zone.now.strftime("%A") == "Wednesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @samCheock5EngineerRiceToppingMenu = t.find_element(css: 'tr:nth-child(3) > td:nth-child(5)').text
          @today5EngineerRiceToppingDate = Time.zone.now.strftime('%m월 %d일')
          @today5EngineerRiceToppingKind = "점심"
          @today5EngineerRiceToppingTime = "12:00 ~ 13:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 18 )
          @samCheock5EngineerRiceToppingMenu = t.find_element(css: 'tr:nth-child(4) > td:nth-child(4)').text
          @today5EngineerRiceToppingDate = Time.zone.now.strftime('%m월 %d일')
          @today5EngineerRiceToppingKind = "저녁"
          @today5EngineerRiceToppingTime = "17:00 ~ 17:40"
        elsif (Time.zone.now.strftime("%H").to_i >= 18 && Time.zone.now.strftime("%H").to_i <= 23 )
          @samCheock5EngineerRiceToppingMenu = t.find_element(css: 'tr:nth-child(3) > td:nth-child(6)').text
          @today5EngineerRiceToppingDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @today5EngineerRiceToppingKind = "점심"
          @today5EngineerRiceToppingTime = "12:00 ~ 13:30"
        end
      elsif Time.zone.now.strftime("%A") == "Thursday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @samCheock5EngineerRiceToppingMenu = t.find_element(css: 'tr:nth-child(3) > td:nth-child(6)').text
          @today5EngineerRiceToppingDate = Time.zone.now.strftime('%m월 %d일')
          @today5EngineerRiceToppingKind = "점심"
          @today5EngineerRiceToppingTime = "12:00 ~ 13:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 18 )
          @samCheock5EngineerRiceToppingMenu = t.find_element(css: 'tr:nth-child(4) > td:nth-child(5)').text
          @today5EngineerRiceToppingDate = Time.zone.now.strftime('%m월 %d일')
          @today5EngineerRiceToppingKind = "저녁"
          @today5EngineerRiceToppingTime = "17:00 ~ 17:40"
        elsif (Time.zone.now.strftime("%H").to_i >= 18 && Time.zone.now.strftime("%H").to_i <= 23 )
          @samCheock5EngineerRiceToppingMenu = t.find_element(css: 'tr:nth-child(3) > td:nth-child(7)').text
          @today5EngineerRiceToppingDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @today5EngineerRiceToppingKind = "점심"
          @today5EngineerRiceToppingTime = "12:00 ~ 13:30"
        end
      elsif Time.zone.now.strftime("%A") == "Friday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @samCheock5EngineerRiceToppingMenu = t.find_element(css: 'tr:nth-child(3) > td:nth-child(7)').text
          @today5EngineerRiceToppingDate = Time.zone.now.strftime('%m월 %d일')
          @today5EngineerRiceToppingKind = "점심"
          @today5EngineerRiceToppingTime = "12:00 ~ 13:30"
        else
          @samCheock5EngineerRiceToppingMenu = t.find_element(css: 'tr:nth-child(4) > td:nth-child(6)').text
          @today5EngineerRiceToppingDate = Time.zone.now.strftime('%m월 %d일')
          @today5EngineerRiceToppingKind = "저녁"
          @today5EngineerRiceToppingTime = "17:00 ~ 17:40"
        end
      elsif Time.zone.now.strftime("%A") == "Saturday" || Time.zone.now.strftime("%A") == "Sunday"
        @samCheock5EngineerRiceToppingMenu = nil
        @today5EngineerRiceToppingDate = Time.zone.now.strftime('%m월 %d일')
        @today5EngineerRiceToppingKind = "-"
        @today5EngineerRiceToppingTime = "-"
      end
    end
    
    
    ### 삼척캠퍼스 제 5공학관 식단메뉴 : 특식
    @samCheock5Engineer.each do |t|
      if Time.zone.now.strftime("%A") == "Monday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @samcheockSpecialTitle = t.find_element(css: 'tr:nth-child(5) > th:nth-child(1)').text
          @samCheock5EngineerSpecialMenu = t.find_element(css: 'tr:nth-child(5) > td:nth-child(3)').text
          @today5EngineerSpecialDate = Time.zone.now.strftime('%m월 %d일')
          @today5EngineerSpecialKind = "점심"
          @today5EngineerSpecialTime = "12:00 ~ 13:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 18 )
          @samcheockSpecialTitle = t.find_element(css: 'tr:nth-child(5) > th:nth-child(1)').text
          @samCheock5EngineerSpecialMenu = t.find_element(css: 'tr:nth-child(6) > td:nth-child(2)').text
          @today5EngineerSpecialDate = Time.zone.now.strftime('%m월 %d일')
          @today5EngineerSpecialKind = "저녁"
          @today5EngineerSpecialTime = "17:00 ~ 17:40"
        elsif (Time.zone.now.strftime("%H").to_i >= 18 && Time.zone.now.strftime("%H").to_i <= 23 )
          @samcheockSpecialTitle = t.find_element(css: 'tr:nth-child(5) > th:nth-child(1)').text
          @samCheock5EngineerSpecialMenu = t.find_element(css: 'tr:nth-child(5) > td:nth-child(4)').text
          @today5EngineerSpecialDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @today5EngineerSpecialKind = "점심"
          @today5EngineerSpecialTime = "12:00 ~ 13:30"
        end
      elsif Time.zone.now.strftime("%A") == "Tuesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @samcheockSpecialTitle = t.find_element(css: 'tr:nth-child(5) > th:nth-child(1)').text
          @samCheock5EngineerSpecialMenu = t.find_element(css: 'tr:nth-child(5) > td:nth-child(4)').text
          @today5EngineerSpecialDate = Time.zone.now.strftime('%m월 %d일')
          @today5EngineerSpecialKind = "점심"
          @today5EngineerSpecialTime = "12:00 ~ 13:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 18 )
          @samcheockSpecialTitle = t.find_element(css: 'tr:nth-child(5) > th:nth-child(1)').text
          @samCheock5EngineerSpecialMenu = t.find_element(css: 'tr:nth-child(6) > td:nth-child(3)').text
          @today5EngineerSpecialDate = Time.zone.now.strftime('%m월 %d일')
          @today5EngineerSpecialKind = "저녁"
          @today5EngineerSpecialTime = "17:00 ~ 17:40"
        elsif (Time.zone.now.strftime("%H").to_i >= 18 && Time.zone.now.strftime("%H").to_i <= 23 )
          @samcheockSpecialTitle = t.find_element(css: 'tr:nth-child(5) > th:nth-child(1)').text
          @samCheock5EngineerSpecialMenu = t.find_element(css: 'tr:nth-child(5) > td:nth-child(5)').text
          @today5EngineerSpecialDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @today5EngineerSpecialKind = "점심"
          @today5EngineerSpecialTime = "12:00 ~ 13:30"
        end
      elsif Time.zone.now.strftime("%A") == "Wednesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @samcheockSpecialTitle = t.find_element(css: 'tr:nth-child(5) > th:nth-child(1)').text
          @samCheock5EngineerSpecialMenu = t.find_element(css: 'tr:nth-child(5) > td:nth-child(5)').text
          @today5EngineerSpecialDate = Time.zone.now.strftime('%m월 %d일')
          @today5EngineerSpecialKind = "점심"
          @today5EngineerSpecialTime = "12:00 ~ 13:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 18 )
          @samcheockSpecialTitle = t.find_element(css: 'tr:nth-child(5) > th:nth-child(1)').text
          @samCheock5EngineerSpecialMenu = t.find_element(css: 'tr:nth-child(6) > td:nth-child(4)').text
          @today5EngineerSpecialDate = Time.zone.now.strftime('%m월 %d일')
          @today5EngineerSpecialKind = "저녁"
          @today5EngineerSpecialTime = "17:00 ~ 17:40"
        elsif (Time.zone.now.strftime("%H").to_i >= 18 && Time.zone.now.strftime("%H").to_i <= 23 )
          @samcheockSpecialTitle = t.find_element(css: 'tr:nth-child(5) > th:nth-child(1)').text
          @samCheock5EngineerSpecialMenu = t.find_element(css: 'tr:nth-child(5) > td:nth-child(6)').text
          @today5EngineerSpecialDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @today5EngineerSpecialKind = "점심"
          @today5EngineerSpecialTime = "12:00 ~ 13:30"
        end
      elsif Time.zone.now.strftime("%A") == "Thursday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @samcheockSpecialTitle = t.find_element(css: 'tr:nth-child(5) > th:nth-child(1)').text
          @samCheock5EngineerSpecialMenu = t.find_element(css: 'tr:nth-child(5) > td:nth-child(6)').text
          @today5EngineerSpecialDate = Time.zone.now.strftime('%m월 %d일')
          @today5EngineerSpecialKind = "점심"
          @today5EngineerSpecialTime = "12:00 ~ 13:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 18 )
          @samcheockSpecialTitle = t.find_element(css: 'tr:nth-child(5) > th:nth-child(1)').text
          @samCheock5EngineerSpecialMenu = t.find_element(css: 'tr:nth-child(6) > td:nth-child(5)').text
          @today5EngineerSpecialDate = Time.zone.now.strftime('%m월 %d일')
          @today5EngineerSpecialKind = "저녁"
          @today5EngineerSpecialTime = "17:00 ~ 17:40"
        elsif (Time.zone.now.strftime("%H").to_i >= 18 && Time.zone.now.strftime("%H").to_i <= 23 )
          @samcheockSpecialTitle = t.find_element(css: 'tr:nth-child(5) > th:nth-child(1)').text
          @samCheock5EngineerSpecialMenu = t.find_element(css: 'tr:nth-child(5) > td:nth-child(7)').text
          @today5EngineerSpecialDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @today5EngineerSpecialKind = "점심"
          @today5EngineerSpecialTime = "12:00 ~ 13:30"
        end
      elsif Time.zone.now.strftime("%A") == "Friday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @samcheockSpecialTitle = t.find_element(css: 'tr:nth-child(5) > th:nth-child(1)').text
          @samCheock5EngineerSpecialMenu = t.find_element(css: 'tr:nth-child(5) > td:nth-child(7)').text
          @today5EngineerSpecialDate = Time.zone.now.strftime('%m월 %d일')
          @today5EngineerSpecialKind = "점심"
          @today5EngineerSpecialTime = "12:00 ~ 13:30"
        else
          @samcheockSpecialTitle = t.find_element(css: 'tr:nth-child(5) > th:nth-child(1)').text
          @samCheock5EngineerSpecialMenu = t.find_element(css: 'tr:nth-child(6) > td:nth-child(6)').text
          @today5EngineerSpecialDate = Time.zone.now.strftime('%m월 %d일')
          @today5EngineerSpecialKind = "저녁"
          @today5EngineerSpecialTime = "17:00 ~ 17:40"
        end
      elsif Time.zone.now.strftime("%A") == "Saturday" || Time.zone.now.strftime("%A") == "Sunday"
        @samCheock5EngineerSpecialMenu = nil
        @today5EngineerSpecialDate = Time.zone.now.strftime('%m월 %d일')
        @today5EngineerSpecialKind = "-"
        @today5EngineerSpecialTime = "-"
      end
    end
    
    @samCheock.quit
    
    
    if @samCheock5EngineerMealMenu.nil?
      @today5EngineerMealMenu = "학식 미운영"
    else
      @today5EngineerMealMenu = @samCheock5EngineerMealMenu.gsub("\n", ", ")
    end
    
    if (@today5EngineerMealMenu.nil? || @today5EngineerMealMenu.empty?)
      @today5EngineerMealMenu = "학식 미운영"
    end
    
    
    if @samCheock5EngineerRiceToppingMenu.nil?
      @today5EngineerRiceToppingMenu = "학식 미운영"
    else
      @today5EngineerRiceToppingMenu = @samCheock5EngineerRiceToppingMenu.gsub("\n", ", ")
    end
    
    if (@today5EngineerRiceToppingMenu.nil? || @today5EngineerRiceToppingMenu.empty?)
      @today5EngineerRiceToppingMenu = "학식 미운영"
    end
    
    
    if @samCheock5EngineerSpecialMenu.nil?
      @today5EngineerSpecialMenu = "학식 미운영"
    else
      @today5EngineerSpecialMenu = @samCheock5EngineerSpecialMenu.gsub("\n", ", ")
    end
    
    if (@today5EngineerSpecialMenu.nil? || @today5EngineerSpecialMenu.empty?)
      @today5EngineerSpecialMenu = "학식 미운영"
    end
      
    CrawlSamDoMeal.create(title: "5공학관 " + @samcheockMealTitle, campus: "삼척", menu: @today5EngineerMealMenu, meal_date: @today5EngineerMealDate, meal_time: @today5EngineerMealTime, kind_of_meal: @today5EngineerMealKind, etc: "기숙사 외 식당")
    CrawlSamDoMeal.create(title: "5공학관 " + @samcheockRiceToppingTitle, campus: "삼척", menu: @today5EngineerRiceToppingMenu, meal_date: @today5EngineerRiceToppingDate, meal_time: @today5EngineerRiceToppingTime, kind_of_meal: @today5EngineerRiceToppingKind, etc: "기숙사 외 식당")
    CrawlSamDoMeal.create(title: "5공학관 " + @samcheockSpecialTitle, campus: "삼척", menu: @today5EngineerSpecialMenu, meal_date: @today5EngineerSpecialDate, meal_time: @today5EngineerSpecialTime, kind_of_meal: @today5EngineerSpecialKind, etc: "기숙사 외 식당")
  end
end