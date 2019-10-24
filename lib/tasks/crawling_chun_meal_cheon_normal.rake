## rake "crawling_chun_meal_cheon_normal:crawling_chun_meal_cheon_normal"
## 천지관 메뉴

namespace :crawling_chun_meal_cheon_normal do
  task crawling_chun_meal_cheon_normal: :environment do
    
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
    @cheonFood = Selenium::WebDriver.for :chrome, options: options # 실레니움 + 크롬 + 헤드리스 옵션으로 브라우저 실행
    
    ### 천지관
    @cheonFood.navigate().to "http://www.kangwon.ac.kr/www/selecttnCafMenuListWU.do?key=1077&sc1=CC10&sc2="
    
    
    ### 천지관 양식
    @cheon = @cheonFood.find_elements(css: '#contents > table:nth-child(5) > tbody')
    @cheon.each do |t|
      if Time.zone.now.strftime("%A") == "Monday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @cheonWesternFoodMenu = t.find_element(css: 'tr:nth-child(8) > td:nth-child(3)').text
          @cheonWesternMealDate = Time.zone.now.strftime('%m월 %d일')
          @cheonWesternMealKind = "점심"
        else
          @cheonWesternFoodMenu = t.find_element(css: 'tr:nth-child(9) > td:nth-child(2)').text
          @cheonWesternMealDate = Time.zone.now.strftime('%m월 %d일')
          @cheonWesternMealKind = "저녁"
        end
      elsif Time.zone.now.strftime("%A") == "Tuesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @cheonWesternFoodMenu = t.find_element(css: 'tr:nth-child(8) > td:nth-child(4)').text
          @cheonWesternMealDate = Time.zone.now.strftime('%m월 %d일')
          @cheonWesternMealKind = "점심"
        else
          @cheonWesternFoodMenu = t.find_element(css: 'tr:nth-child(9) > td:nth-child(3)').text
          @cheonWesternMealDate = Time.zone.now.strftime('%m월 %d일')
          @cheonWesternMealKind = "저녁"
        end
      elsif Time.zone.now.strftime("%A") == "Wednesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @cheonWesternFoodMenu = t.find_element(css: 'tr:nth-child(8) > td:nth-child(5)').text
          @cheonWesternMealDate = Time.zone.now.strftime('%m월 %d일')
          @cheonWesternMealKind = "점심"
        else
          @cheonWesternFoodMenu = t.find_element(css: 'tr:nth-child(9) > td:nth-child(4)').text
          @cheonWesternMealDate = Time.zone.now.strftime('%m월 %d일')
          @cheonWesternMealKind = "저녁"
        end
      elsif Time.zone.now.strftime("%A") == "Thursday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @cheonWesternFoodMenu = t.find_element(css: 'tr:nth-child(8) > td:nth-child(6)').text
          @cheonWesternMealDate = Time.zone.now.strftime('%m월 %d일')
          @cheonWesternMealKind = "점심"
        else
          @cheonWesternFoodMenu = t.find_element(css: 'tr:nth-child(9) > td:nth-child(5)').text
          @cheonWesternMealDate = Time.zone.now.strftime('%m월 %d일')
          @cheonWesternMealKind = "저녁"
        end
      elsif Time.zone.now.strftime("%A") == "Friday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @cheonWesternFoodMenu = t.find_element(css: 'tr:nth-child(8) > td:nth-child(7)').text
          @cheonWesternMealDate = Time.zone.now.strftime('%m월 %d일')
          @cheonWesternMealKind = "점심"
        else
          @cheonWesternFoodMenu = t.find_element(css: 'tr:nth-child(9) > td:nth-child(6)').text
          @cheonWesternMealDate = Time.zone.now.strftime('%m월 %d일')
          @cheonWesternMealKind = "저녁"
        end
      elsif Time.zone.now.strftime("%A") == "Saturday" || Time.zone.now.strftime("%A") == "Sunday"
        @cheonWesternFoodMenu = nil
        @cheonWesternMealDate = Time.zone.now.strftime('%m월 %d일')
        @cheonWesternMealKind = "-"
      end
    end
    
    ### 천지관 분식
    @cheon.each do |t|
      if Time.zone.now.strftime("%A") == "Monday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @cheonSnackFoodMenu = t.find_element(css: 'tr:nth-child(10) > td:nth-child(3)').text
          @cheonSnackMealDate = Time.zone.now.strftime('%m월 %d일')
          @cheonSnackMealKind = "점심"
        else
          @cheonSnackFoodMenu = t.find_element(css: 'tr:nth-child(11) > td:nth-child(2)').text
          @cheonSnackMealDate = Time.zone.now.strftime('%m월 %d일')
          @cheonSnackMealKind = "저녁"
        end
      elsif Time.zone.now.strftime("%A") == "Tuesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @cheonSnackFoodMenu = t.find_element(css: 'tr:nth-child(10) > td:nth-child(3)').text
          @cheonSnackMealDate = Time.zone.now.strftime('%m월 %d일')
          @cheonSnackMealKind = "점심"
        else
          @cheonSnackFoodMenu = t.find_element(css: 'tr:nth-child(11) > td:nth-child(2)').text
          @cheonSnackMealDate = Time.zone.now.strftime('%m월 %d일')
          @cheonSnackMealKind = "저녁"
        end
      elsif Time.zone.now.strftime("%A") == "Wednesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @cheonSnackFoodMenu = t.find_element(css: 'tr:nth-child(10) > td:nth-child(3)').text
          @cheonSnackMealDate = Time.zone.now.strftime('%m월 %d일')
          @cheonSnackMealKind = "점심"
        else
          @cheonSnackFoodMenu = t.find_element(css: 'tr:nth-child(11) > td:nth-child(2)').text
          @cheonSnackMealDate = Time.zone.now.strftime('%m월 %d일')
          @cheonSnackMealKind = "저녁"
        end
      elsif Time.zone.now.strftime("%A") == "Thursday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @cheonSnackFoodMenu = t.find_element(css: 'tr:nth-child(10) > td:nth-child(3)').text
          @cheonSnackMealDate = Time.zone.now.strftime('%m월 %d일')
          @cheonSnackMealKind = "점심"
        else
          @cheonSnackFoodMenu = t.find_element(css: 'tr:nth-child(11) > td:nth-child(2)').text
          @cheonSnackMealDate = Time.zone.now.strftime('%m월 %d일')
          @cheonSnackMealKind = "저녁"
        end
      elsif Time.zone.now.strftime("%A") == "Friday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @cheonSnackFoodMenu = t.find_element(css: 'tr:nth-child(10) > td:nth-child(3)').text
          @cheonSnackMealDate = Time.zone.now.strftime('%m월 %d일')
          @cheonSnackMealKind = "점심"
        else
          @cheonSnackFoodMenu = t.find_element(css: 'tr:nth-child(11) > td:nth-child(2)').text
          @cheonSnackMealDate = Time.zone.now.strftime('%m월 %d일')
          @cheonSnackMealKind = "저녁"
        end
      elsif Time.zone.now.strftime("%A") == "Saturday" || Time.zone.now.strftime("%A") == "Sunday"
        @cheonSnackFoodMenu = nil
        @cheonSnackMealDate = Time.zone.now.strftime('%m월 %d일')
        @cheonSnackMealKind = "-"
      end
    end
    
    @cheonFood.quit
    
    if @cheonWesternFoodMenu.nil?
      @todayCheonWersternMenu = "학식 미운영"
    else
      @todayCheonWersternMenu = @cheonWesternFoodMenu.gsub("\n", " / ")
    end
    
    if (@todayCheonWersternMenu.nil? || @todayCheonWersternMenu.empty?)
      @todayCheonWersternMenu = "학식 미운영"
    end
    
    
    if @cheonSnackFoodMenu.nil?
      @todayCheonSnackMenu = "학식 미운영"
    else
      @todayCheonSnackMenu = @cheonSnackFoodMenu.gsub("\n", " / ")
    end
    
    if (@todayCheonSnackMenu.nil? || @todayCheonSnackMenu.empty?)
      @todayCheonSnackMenu = "학식 미운영"
    end
    

    CrawlChunMeal.create(title: "천지관 양식", menu: @todayCheonWersternMenu, meal_date: @cheonWesternMealDate, meal_time: "", kind_of_meal: @cheonWesternMealKind, etc: "천지관")
    CrawlChunMeal.create(title: "천지관 분식", menu: @todayCheonSnackMenu, meal_date: @cheonSnackMealDate, meal_time: "", kind_of_meal: @cheonSnackMealKind, etc: "천지관")

  end
end