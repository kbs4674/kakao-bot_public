## rake "crawling_sam_do_dogye_meal:crawling_sam_do_dogye_meal"
## 강원대학교 도계캠퍼스 식단메뉴

namespace :crawling_sam_do_dogye_meal do
  task crawling_sam_do_dogye_meal: :environment do
    
    CrawlSamDoMeal.where(campus: "도계").each do |t|
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
    @dogye = Selenium::WebDriver.for :chrome, options: options # 실레니움 + 크롬 + 헤드리스 옵션으로 브라우저 실행
    
    ### 도계캠퍼스 학생회관
    @dogye.navigate().to "https://www.kangwon.ac.kr/www/selecttnCafMenuListWU.do?key=1261&sc1=SCDG10&sc2="
    
    ### 도계캠퍼스 학생회관 식당 식단메뉴 : 백반
    @dogyeMeal = @dogye.find_elements(css: '#contents > table:nth-child(5) > tbody')
    @dogyeMeal.each do |t|
      if Time.zone.now.strftime("%A") == "Monday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @dogyeMealMenu = t.find_element(css: 'tr:nth-child(1) > td:nth-child(3)').text
          @todayDogyeMealDate = Time.zone.now.strftime('%m월 %d일')
          @todayDogyeMealKind = "점심"
          @todayDogyeMealTime = "11:00 ~ 14:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          @dogyeMealMenu = t.find_element(css: 'tr:nth-child(2) > td:nth-child(2)').text
          @todayDogyeMealDate = Time.zone.now.strftime('%m월 %d일')
          @todayDogyeMealKind = "저녁"
          @todayDogyeMealTime = "17:00 ~ 18:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          @dogyeMealMenu = t.find_element(css: 'tr:nth-child(1) > td:nth-child(4)').text
          @todayDogyeMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @todayDogyeMealKind = "점심"
          @todayDogyeMealTime = "11:00 ~ 14:00"
        end
      elsif Time.zone.now.strftime("%A") == "Tuesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @dogyeMealMenu = t.find_element(css: 'tr:nth-child(1) > td:nth-child(4)').text
          @todayDogyeMealDate = Time.zone.now.strftime('%m월 %d일')
          @todayDogyeMealKind = "점심"
          @todayDogyeMealTime = "11:00 ~ 14:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          @dogyeMealMenu = t.find_element(css: 'tr:nth-child(2) > td:nth-child(3)').text
          @todayDogyeMealDate = Time.zone.now.strftime('%m월 %d일')
          @todayDogyeMealKind = "저녁"
          @todayDogyeMealTime = "17:00 ~ 18:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          @dogyeMealMenu = t.find_element(css: 'tr:nth-child(1) > td:nth-child(5)').text
          @todayDogyeMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @todayDogyeMealKind = "점심"
          @todayDogyeMealTime = "11:00 ~ 14:00"
        end
      elsif Time.zone.now.strftime("%A") == "Wednesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @dogyeMealMenu = t.find_element(css: 'tr:nth-child(1) > td:nth-child(5)').text
          @todayDogyeMealDate = Time.zone.now.strftime('%m월 %d일')
          @todayDogyeMealKind = "점심"
          @todayDogyeMealTime = "11:00 ~ 14:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          @dogyeMealMenu = t.find_element(css: 'tr:nth-child(2) > td:nth-child(4)').text
          @todayDogyeMealDate = Time.zone.now.strftime('%m월 %d일')
          @todayDogyeMealKind = "저녁"
          @todayDogyeMealTime = "17:00 ~ 18:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          @dogyeMealMenu = t.find_element(css: 'tr:nth-child(1) > td:nth-child(6)').text
          @todayDogyeMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @todayDogyeMealKind = "점심"
          @todayDogyeMealTime = "11:00 ~ 14:00"
        end
      elsif Time.zone.now.strftime("%A") == "Thursday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @dogyeMealMenu = t.find_element(css: 'tr:nth-child(1) > td:nth-child(6)').text
          @todayDogyeMealDate = Time.zone.now.strftime('%m월 %d일')
          @todayDogyeMealKind = "점심"
          @todayDogyeMealTime = "11:00 ~ 14:00"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          @dogyeMealMenu = t.find_element(css: 'tr:nth-child(2) > td:nth-child(5)').text
          @todayDogyeMealDate = Time.zone.now.strftime('%m월 %d일')
          @todayDogyeMealKind = "저녁"
          @todayDogyeMealTime = "17:00 ~ 18:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          @dogyeMealMenu = t.find_element(css: 'tr:nth-child(1) > td:nth-child(7)').text
          @todayDogyeMealDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @todayDogyeMealKind = "점심"
          @todayDogyeMealTime = "11:00 ~ 14:00"
        end
      elsif Time.zone.now.strftime("%A") == "Friday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @dogyeMealMenu = t.find_element(css: 'tr:nth-child(1) > td:nth-child(7)').text
          @todayDogyeMealDate = Time.zone.now.strftime('%m월 %d일')
          @todayDogyeMealKind = "점심"
          @todayDogyeMealTime = "11:00 ~ 14:00"
        else
          @dogyeMealMenu = t.find_element(css: 'tr:nth-child(2) > td:nth-child(6)').text
          @todayDogyeMealDate = Time.zone.now.strftime('%m월 %d일')
          @todayDogyeMealKind = "저녁"
          @todayDogyeMealTime = "17:00 ~ 18:30"
        end
      elsif Time.zone.now.strftime("%A") == "Saturday" || Time.zone.now.strftime("%A") == "Sunday"
        @dogyeMealMenu = nil
        @todayDogyeMealDate = Time.zone.now.strftime('%m월 %d일')
        @todayDogyeMealKind = "-"
        @todayDogyeMealTime = "-"
      end
    end
    
    
    ### 도계캠퍼스 학생회관 식당 식단메뉴 : 덮밥
    @dogyeMeal.each do |t|
      if Time.zone.now.strftime("%A") == "Monday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @dogyeRiceToppingMenu = t.find_element(css: 'tr:nth-child(3) > td:nth-child(3)').text
          @todayDogyeRiceToppingDate = Time.zone.now.strftime('%m월 %d일')
          @todayDogyeRiceToppingKind = "점심"
          @todayDogyeRiceToppingTime = "12:00 ~ 13:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          @dogyeRiceToppingMenu = t.find_element(css: 'tr:nth-child(4) > td:nth-child(2)').text
          @todayDogyeRiceToppingDate = Time.zone.now.strftime('%m월 %d일')
          @todayDogyeRiceToppingKind = "저녁"
          @todayDogyeRiceToppingTime = "17:00 ~ 17:40"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          @dogyeRiceToppingMenu = t.find_element(css: 'tr:nth-child(3) > td:nth-child(4)').text
          @todayDogyeRiceToppingDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @todayDogyeRiceToppingKind = "점심"
          @todayDogyeRiceToppingTime = "12:00 ~ 13:30"
        end
      elsif Time.zone.now.strftime("%A") == "Tuesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @dogyeRiceToppingMenu = t.find_element(css: 'tr:nth-child(3) > td:nth-child(4)').text
          @todayDogyeRiceToppingDate = Time.zone.now.strftime('%m월 %d일')
          @todayDogyeRiceToppingKind = "점심"
          @todayDogyeRiceToppingTime = "12:00 ~ 13:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          @dogyeRiceToppingMenu = t.find_element(css: 'tr:nth-child(4) > td:nth-child(3)').text
          @todayDogyeRiceToppingDate = Time.zone.now.strftime('%m월 %d일')
          @todayDogyeRiceToppingKind = "저녁"
          @todayDogyeRiceToppingTime = "17:00 ~ 17:40"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          @dogyeRiceToppingMenu = t.find_element(css: 'tr:nth-child(3) > td:nth-child(5)').text
          @todayDogyeRiceToppingDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @todayDogyeRiceToppingKind = "점심"
          @todayDogyeRiceToppingTime = "12:00 ~ 13:30"
        end
      elsif Time.zone.now.strftime("%A") == "Wednesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @dogyeRiceToppingMenu = t.find_element(css: 'tr:nth-child(3) > td:nth-child(5)').text
          @todayDogyeRiceToppingDate = Time.zone.now.strftime('%m월 %d일')
          @todayDogyeRiceToppingKind = "점심"
          @todayDogyeRiceToppingTime = "12:00 ~ 13:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          @dogyeRiceToppingMenu = t.find_element(css: 'tr:nth-child(4) > td:nth-child(4)').text
          @todayDogyeRiceToppingDate = Time.zone.now.strftime('%m월 %d일')
          @todayDogyeRiceToppingKind = "저녁"
          @todayDogyeRiceToppingTime = "17:00 ~ 17:40"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          @dogyeRiceToppingMenu = t.find_element(css: 'tr:nth-child(3) > td:nth-child(6)').text
          @todayDogyeRiceToppingDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @todayDogyeRiceToppingKind = "점심"
          @todayDogyeRiceToppingTime = "12:00 ~ 13:30"
        end
      elsif Time.zone.now.strftime("%A") == "Thursday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @dogyeRiceToppingMenu = t.find_element(css: 'tr:nth-child(3) > td:nth-child(6)').text
          @todayDogyeRiceToppingDate = Time.zone.now.strftime('%m월 %d일')
          @todayDogyeRiceToppingKind = "점심"
          @todayDogyeRiceToppingTime = "12:00 ~ 13:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i < 19 )
          @dogyeRiceToppingMenu = t.find_element(css: 'tr:nth-child(4) > td:nth-child(5)').text
          @todayDogyeRiceToppingDate = Time.zone.now.strftime('%m월 %d일')
          @todayDogyeRiceToppingKind = "저녁"
          @todayDogyeRiceToppingTime = "17:00 ~ 17:40"
        elsif (Time.zone.now.strftime("%H").to_i >= 19 && Time.zone.now.strftime("%H").to_i <= 23 )
          @dogyeRiceToppingMenu = t.find_element(css: 'tr:nth-child(3) > td:nth-child(7)').text
          @todayDogyeRiceToppingDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @todayDogyeRiceToppingKind = "점심"
          @todayDogyeRiceToppingTime = "12:00 ~ 13:30"
        end
      elsif Time.zone.now.strftime("%A") == "Friday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @dogyeRiceToppingMenu = t.find_element(css: 'tr:nth-child(3) > td:nth-child(7)').text
          @todayDogyeRiceToppingDate = Time.zone.now.strftime('%m월 %d일')
          @todayDogyeRiceToppingKind = "점심"
          @todayDogyeRiceToppingTime = "12:00 ~ 13:30"
        else
          @dogyeRiceToppingMenu = t.find_element(css: 'tr:nth-child(4) > td:nth-child(6)').text
          @todayDogyeRiceToppingDate = Time.zone.now.strftime('%m월 %d일')
          @todayDogyeRiceToppingKind = "저녁"
          @todayDogyeRiceToppingTime = "17:00 ~ 17:40"
        end
      elsif Time.zone.now.strftime("%A") == "Saturday" || Time.zone.now.strftime("%A") == "Sunday"
        @dogyeRiceToppingMenu = nil
        @todayDogyeRiceToppingDate = Time.zone.now.strftime('%m월 %d일')
        @todayDogyeRiceToppingKind = "-"
        @todayDogyeRiceToppingTime = "-"
      end
    end
    
    @dogye.quit
    
    
    options = Selenium::WebDriver::Chrome::Options.new # 크롬 헤드리스 모드 위해 옵션 설정
    options.add_argument('--disable-gpu') # 크롬 헤드리스 모드 사용 위해 disable-gpu setting
    options.add_argument('--headless') # 크롬 헤드리스 모드 사용 위해 headless setting
    @dogyeStaff = Selenium::WebDriver.for :chrome, options: options # 실레니움 + 크롬 + 헤드리스 옵션으로 브라우저 실행
    
    
    ### 도계캠퍼스 교직원 식당
    @dogyeStaff.navigate().to "https://www.kangwon.ac.kr/www/selecttnCafMenuListWU.do?key=1261&sc1=SCDG10&sc2=SCDG&"
    
    ### 도계캠퍼스 교직원식당
    @dogye = @dogyeStaff.find_elements(css: '#contents > table:nth-child(5) > tbody')
    @dogye.each do |t|
      if Time.zone.now.strftime("%A") == "Monday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @dogyeStaffMenu = t.find_element(css: 'tr:nth-child(1) > td:nth-child(3)').text
          @todaydogyeStaffDate = Time.zone.now.strftime('%m월 %d일')
          @todaydogyeStaffKind = "점심"
          @todaydogyeStaffTime = "12:00 ~ 13:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i <= 23 )
          @dogyeStaffMenu = t.find_element(css: 'tr:nth-child(1) > td:nth-child(4)').text
          @todaydogyeStaffDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @todaydogyeStaffKind = "점심"
          @todaydogyeStaffTime = "12:00 ~ 13:30"
        end
      elsif Time.zone.now.strftime("%A") == "Tuesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @dogyeStaffMenu = t.find_element(css: 'tr:nth-child(1) > td:nth-child(4)').text
          @todaydogyeStaffDate = Time.zone.now.strftime('%m월 %d일')
          @todaydogyeStaffKind = "점심"
          @todaydogyeStaffTime = "12:00 ~ 13:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i <= 23 )
          @dogyeStaffMenu = t.find_element(css: 'tr:nth-child(1) > td:nth-child(5)').text
          @todaydogyeStaffDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @todaydogyeStaffKind = "점심"
          @todaydogyeStaffTime = "12:00 ~ 13:30"
        end
      elsif Time.zone.now.strftime("%A") == "Wednesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @dogyeStaffMenu = t.find_element(css: 'tr:nth-child(1) > td:nth-child(5)').text
          @todaydogyeStaffDate = Time.zone.now.strftime('%m월 %d일')
          @todaydogyeStaffKind = "점심"
          @todaydogyeStaffTime = "12:00 ~ 13:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i <= 23 )
          @dogyeStaffMenu = t.find_element(css: 'tr:nth-child(1) > td:nth-child(6)').text
          @todaydogyeStaffDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @todaydogyeStaffKind = "점심"
          @todaydogyeStaffTime = "12:00 ~ 13:30"
        end
      elsif Time.zone.now.strftime("%A") == "Thursday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @dogyeStaffMenu = t.find_element(css: 'tr:nth-child(1) > td:nth-child(6)').text
          @todaydogyeStaffDate = Time.zone.now.strftime('%m월 %d일')
          @todaydogyeStaffKind = "점심"
          @todaydogyeStaffTime = "12:00 ~ 13:30"
        elsif (Time.zone.now.strftime("%H").to_i >= 14 && Time.zone.now.strftime("%H").to_i <= 23 )
          @dogyeStaffMenu = t.find_element(css: 'tr:nth-child(1) > td:nth-child(7)').text
          @todaydogyeStaffDate = "[내일] " + Date.today.send(:+, 1.day).strftime('%m월 %d일')
          @todaydogyeStaffKind = "점심"
          @todaydogyeStaffTime = "12:00 ~ 13:30"
        end
      elsif Time.zone.now.strftime("%A") == "Friday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @dogyeStaffMenu = t.find_element(css: 'tr:nth-child(1) > td:nth-child(7)').text
          @todaydogyeStaffDate = Time.zone.now.strftime('%m월 %d일')
          @todaydogyeStaffKind = "점심"
          @todaydogyeStaffTime = "12:00 ~ 13:30"
        else
          @dogyeStaffMenu = t.find_element(css: 'tr:nth-child(2) > td:nth-child(6)').text
          @todaydogyeStaffDate = Time.zone.now.strftime('%m월 %d일')
          @todaydogyeStaffKind = "저녁"
          @todaydogyeStaffTime = "17:00 ~ 17:40"
        end
      elsif Time.zone.now.strftime("%A") == "Saturday" || Time.zone.now.strftime("%A") == "Sunday"
        @dogyeStaffMenu = nil
        @todaydogyeStaffDate = Time.zone.now.strftime('%m월 %d일')
        @todaydogyeStaffKind = "-"
        @todaydogyeStaffTime = "-"
      end
    end
    
    @dogyeStaff.quit
    
    
    if @dogyeMealMenu.nil?
      @todayDogyeMealMenu = "학식 미운영"
    else
      @todayDogyeMealMenu = @dogyeMealMenu.gsub("\n", ", ")
    end
    
    if (@todayDogyeMealMenu.nil? || @todayDogyeMealMenu.empty?)
      @todayDogyeMealMenu = "학식 미운영"
    end
    
    
    if @dogyeRiceToppingMenu.nil?
      @todayDogyeRiceToppingMenu = "학식 미운영"
    else
      @todayDogyeRiceToppingMenu = @dogyeRiceToppingMenu.gsub("\n", ", ")
    end
    
    if (@todayDogyeRiceToppingMenu.nil? || @todayDogyeRiceToppingMenu.empty?)
      @todayDogyeRiceToppingMenu = "학식 미운영"
    end
    
    
    if @dogyeStaffMenu.nil?
      @todayDogyeStaffMenu = "학식 미운영"
    else
      @todayDogyeStaffMenu = @dogyeStaffMenu.gsub("\n", ", ")
    end
    
    if (@todayDogyeStaffMenu.nil? || @todayDogyeStaffMenu.empty?)
      @todayDogyeStaffMenu = "학식 미운영"
    end
    
    CrawlSamDoMeal.create(title: "학생회관 백반", campus: "도계", menu: @todayDogyeMealMenu, meal_date: @todayDogyeMealDate, meal_time: @todayDogyeMealTime, kind_of_meal: @todayDogyeMealKind, etc: "기숙사 외 식당")
    CrawlSamDoMeal.create(title: "학생회관 덮밥", campus: "도계", menu: @todayDogyeRiceToppingMenu, meal_date: @todayDogyeRiceToppingDate, meal_time: @todayDogyeRiceToppingTime, kind_of_meal: @todayDogyeRiceToppingKind, etc: "기숙사 외 식당")
    CrawlSamDoMeal.create(title: "교직원 식당", campus: "도계", menu: @todayDogyeStaffMenu, meal_date: @todaydogyeStaffDate, meal_time: @todaydogyeStaffTime, kind_of_meal: @todaydogyeStaffKind, etc: "기숙사 외 식당")
  end
end