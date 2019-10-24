## rake "crawling_chun_meal_bak_normal:crawling_chun_meal_bak_normal"
## 백록관 메뉴

namespace :crawling_chun_meal_bak_normal do
  task crawling_chun_meal_bak_normal: :environment do
    
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
    @bakFood = Selenium::WebDriver.for :chrome, options: options # 실레니움 + 크롬 + 헤드리스 옵션으로 브라우저 실행
    
    
    ### 백록관
    @bakFood.navigate().to "http://www.kangwon.ac.kr/www/selecttnCafMenuListWU.do?key=1077&sc1=CC20&sc2="
    
    ### 백록관 탕정식 국
    @bak = @bakFood.find_elements(css: '#contents > table:nth-child(5) > tbody')
    @bak.each do |t|
      if Time.zone.now.strftime("%A") == "Monday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @bakSpecialMenu = t.find_element(css: 'tr:nth-child(3) > td:nth-child(3)').text
          @bakSpecialMealDate = Time.zone.now.strftime('%m월 %d일')
          @bakSpecialMealKind = "점심"
        else
          @bakSpecialMenu = t.find_element(css: 'tr:nth-child(4) > td:nth-child(2)').text
          @bakSpecialMealDate = Time.zone.now.strftime('%m월 %d일')
          @bakSpecialMealKind = "저녁"
        end
      elsif Time.zone.now.strftime("%A") == "Tuesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @bakSpecialMenu = t.find_element(css: 'tr:nth-child(3) > td:nth-child(4)').text
          @bakSpecialMealDate = Time.zone.now.strftime('%m월 %d일')
          @bakSpecialMealKind = "점심"
        else
          @bakSpecialMenu = t.find_element(css: 'tr:nth-child(4) > td:nth-child(3)').text
          @bakSpecialMealDate = Time.zone.now.strftime('%m월 %d일')
          @bakSpecialMealKind = "저녁"
        end
      elsif Time.zone.now.strftime("%A") == "Wednesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @bakSpecialMenu = t.find_element(css: 'tr:nth-child(3) > td:nth-child(5)').text
          @bakSpecialMealDate = Time.zone.now.strftime('%m월 %d일')
          @bakSpecialMealKind = "점심"
        else
          @bakSpecialMenu = t.find_element(css: 'tr:nth-child(4) > td:nth-child(4)').text
          @bakSpecialMealDate = Time.zone.now.strftime('%m월 %d일')
          @bakSpecialMealKind = "저녁"
        end
      elsif Time.zone.now.strftime("%A") == "Thursday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @bakSpecialMenu = t.find_element(css: 'tr:nth-child(3) > td:nth-child(6)').text
          @bakSpecialMealDate = Time.zone.now.strftime('%m월 %d일')
          @bakSpecialMealKind = "점심"
        else
          @bakSpecialMenu = t.find_element(css: 'tr:nth-child(4) > td:nth-child(5)').text
          @bakSpecialMealDate = Time.zone.now.strftime('%m월 %d일')
          @bakSpecialMealKind = "저녁"
        end
      elsif Time.zone.now.strftime("%A") == "Friday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @bakSpecialMenu = t.find_element(css: 'tr:nth-child(3) > td:nth-child(7)').text
          @bakSpecialMealDate = Time.zone.now.strftime('%m월 %d일')
          @bakSpecialMealKind = "점심"
        else
          @bakSpecialMenu = t.find_element(css: 'tr:nth-child(4) > td:nth-child(6)').text
          @bakSpecialMealDate = Time.zone.now.strftime('%m월 %d일')
          @bakSpecialMealKind = "저녁"
        end
      elsif Time.zone.now.strftime("%A") == "Saturday" || Time.zone.now.strftime("%A") == "Sunday"
        @bakSpecialMenu = nil
        @bakSpecialMealDate = Time.zone.now.strftime('%m월 %d일')
        @bakSpecialMealKind = "-"
      end
    end
    
    ### 백록관 양식
    @bak.each do |t|
      if Time.zone.now.strftime("%A") == "Monday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @bakWesternFoodMenu = t.find_element(css: 'tr:nth-child(7) > td:nth-child(3)').text
          @bakWesternMealDate = Time.zone.now.strftime('%m월 %d일')
          @bakWesternMealKind = "점심"
        else
          @bakWesternFoodMenu = t.find_element(css: 'tr:nth-child(8) > td:nth-child(2)').text
          @bakWesternMealDate = Time.zone.now.strftime('%m월 %d일')
          @bakWesternMealKind = "저녁"
        end
      elsif Time.zone.now.strftime("%A") == "Tuesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @bakWesternFoodMenu = t.find_element(css: 'tr:nth-child(7) > td:nth-child(4)').text
          @bakWesternMealDate = Time.zone.now.strftime('%m월 %d일')
          @bakWesternMealKind = "점심"
        else
          @bakWesternFoodMenu = t.find_element(css: 'tr:nth-child(8) > td:nth-child(3)').text
          @bakWesternMealDate = Time.zone.now.strftime('%m월 %d일')
          @bakWesternMealKind = "저녁"
        end
      elsif Time.zone.now.strftime("%A") == "Wednesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @bakWesternFoodMenu = t.find_element(css: 'tr:nth-child(7) > td:nth-child(5)').text
          @bakWesternMealDate = Time.zone.now.strftime('%m월 %d일')
          @bakWesternMealKind = "점심"
        else
          @bakWesternFoodMenu = t.find_element(css: 'tr:nth-child(8) > td:nth-child(4)').text
          @bakWesternMealDate = Time.zone.now.strftime('%m월 %d일')
          @bakWesternMealKind = "저녁"
        end
      elsif Time.zone.now.strftime("%A") == "Thursday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @bakWesternFoodMenu = t.find_element(css: 'tr:nth-child(7) > td:nth-child(6)').text
          @bakWesternMealDate = Time.zone.now.strftime('%m월 %d일')
          @bakWesternMealKind = "점심"
        else
          @bakWesternFoodMenu = t.find_element(css: 'tr:nth-child(8) > td:nth-child(5)').text
          @bakWesternMealDate = Time.zone.now.strftime('%m월 %d일')
          @bakWesternMealKind = "저녁"
        end
      elsif Time.zone.now.strftime("%A") == "Friday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @bakWesternFoodMenu = t.find_element(css: 'tr:nth-child(7) > td:nth-child(7)').text
          @bakWesternMealDate = Time.zone.now.strftime('%m월 %d일')
          @bakWesternMealKind = "점심"
        else
          @bakWesternFoodMenu = t.find_element(css: 'tr:nth-child(8) > td:nth-child(6)').text
          @bakWesternMealDate = Time.zone.now.strftime('%m월 %d일')
          @bakWesternMealKind = "저녁"
        end
      elsif Time.zone.now.strftime("%A") == "Saturday" || Time.zone.now.strftime("%A") == "Sunday"
        @bakWesternFoodMenu = nil
        @bakWesternMealDate = Time.zone.now.strftime('%m월 %d일')
        @bakWesternMealKind = "-"
      end
    end
    
    ### 백록관 분식
    @bak.each do |t|
      if Time.zone.now.strftime("%A") == "Monday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @bakSnackFoodMenu = t.find_element(css: 'tr:nth-child(9) > td:nth-child(3)').text
          @bakSnackMealDate = Time.zone.now.strftime('%m월 %d일')
          @bakSnackMealKind = "점심"
        else
          @bakSnackFoodMenu = t.find_element(css: 'tr:nth-child(10) > td:nth-child(2)').text
          @bakSnackMealDate = Time.zone.now.strftime('%m월 %d일')
          @bakSnackMealKind = "저녁"
        end
      elsif Time.zone.now.strftime("%A") == "Tuesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @bakSnackFoodMenu = t.find_element(css: 'tr:nth-child(9) > td:nth-child(4)').text
          @bakSnackMealDate = Time.zone.now.strftime('%m월 %d일')
          @bakSnackMealKind = "점심"
        else
          @bakSnackFoodMenu = t.find_element(css: 'tr:nth-child(10) > td:nth-child(3)').text
          @bakSnackMealDate = Time.zone.now.strftime('%m월 %d일')
          @bakSnackMealKind = "저녁"
        end
      elsif Time.zone.now.strftime("%A") == "Wednesday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @bakSnackFoodMenu = t.find_element(css: 'tr:nth-child(9) > td:nth-child(5)').text
          @bakSnackMealDate = Time.zone.now.strftime('%m월 %d일')
          @bakSnackMealKind = "점심"
        else
          @bakSnackFoodMenu = t.find_element(css: 'tr:nth-child(10) > td:nth-child(4)').text
          @bakSnackMealDate = Time.zone.now.strftime('%m월 %d일')
          @bakSnackMealKind = "저녁"
        end
      elsif Time.zone.now.strftime("%A") == "Thursday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @bakSnackFoodMenu = t.find_element(css: 'tr:nth-child(9) > td:nth-child(6)').text
          @bakSnackMealDate = Time.zone.now.strftime('%m월 %d일')
          @bakSnackMealKind = "점심"
        else
          @bakSnackFoodMenu = t.find_element(css: 'tr:nth-child(10) > td:nth-child(5)').text
          @bakSnackMealDate = Time.zone.now.strftime('%m월 %d일')
          @bakSnackMealKind = "저녁"
        end
      elsif Time.zone.now.strftime("%A") == "Friday"
        if (Time.zone.now.strftime("%H").to_i >= 0 && Time.zone.now.strftime("%H").to_i < 14 )
          @bakSnackFoodMenu = t.find_element(css: 'tr:nth-child(9) > td:nth-child(7)').text
          @bakSnackMealDate = Time.zone.now.strftime('%m월 %d일')
          @bakSnackMealKind = "점심"
        else
          @bakSnackFoodMenu = t.find_element(css: 'tr:nth-child(10) > td:nth-child(6)').text
          @bakSnackMealDate = Time.zone.now.strftime('%m월 %d일')
          @bakSnackMealKind = "저녁"
        end
      elsif Time.zone.now.strftime("%A") == "Saturday" || Time.zone.now.strftime("%A") == "Sunday"
        @bakSnackFoodMenu = nil
        @bakSnackMealDate = Time.zone.now.strftime('%m월 %d일')
        @bakSnackMealKind = "-"
      end
    end
    
    @bakFood.quit
    
    if @bakSpecialMenu.nil?
      @todayBakSepcialMenu = "학식 미운영"
    else
      @todayBakSepcialMenu = @bakSpecialMenu.gsub("\n", " / ")
    end
    
    if (@todayBakSepcialMenu.nil? || @todayBakSepcialMenu.empty?)
      @todayBakSepcialMenu = "학식 미운영"
    end
    
    
    if @bakWesternFoodMenu.nil?
      @todayBakWersternMenu = "학식 미운영"
    else
      @todayBakWersternMenu = @bakWesternFoodMenu.gsub("\n", " / ")
    end
    
    if (@todayBakWersternMenu.nil? || @todayBakWersternMenu.empty?)
      @todayBakWersternMenu = "학식 미운영"
    end
    
    
    if @bakSnackFoodMenu.nil?
      @todayBakSnackMenu = "학식 미운영"
    else
      @todayBakSnackMenu = @bakSnackFoodMenu.gsub("\n", " / ")
    end
    
    if (@todayBakSnackMenu.nil? || @todayBakSnackMenu.empty?)
      @todayBakSnackMenu = "학식 미운영"
    end
    
      
    CrawlChunMeal.create(title: "백록관 탕정식 국", menu: @todayBakSepcialMenu, meal_date: @bakSpecialMealDate, meal_time: "", kind_of_meal: @bakSpecialMealKind, etc: "백록관")
    CrawlChunMeal.create(title: "백록관 양식", menu: @todayBakWersternMenu, meal_date: @bakWesternMealDate, meal_time: "", kind_of_meal: @bakWesternMealKind, etc: "백록관")
    CrawlChunMeal.create(title: "백록관 분식", menu: @todayBakSnackMenu, meal_date: @bakSnackMealDate, meal_time: "", kind_of_meal: @bakSnackMealKind, etc: "백록관")

  end
end