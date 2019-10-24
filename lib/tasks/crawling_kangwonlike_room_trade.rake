## rake "crawling_kangwonlike_room_trade:crawling_kangwonlike_room_trade"

namespace :crawling_kangwonlike_room_trade do
  require 'nokogiri'
  require 'open-uri'
  
  task crawling_kangwonlike_room_trade: :environment do
    
    require 'selenium-webdriver'
    Selenium::WebDriver::Chrome.driver_path = `which chromedriver-helper`.chomp # 설치한 크롬 드라이버 사용
    
    ## 헤드리스 개념 : https://beomi.github.io/2017/09/28/HowToMakeWebCrawler-Headless-Chrome/
    options = Selenium::WebDriver::Chrome::Options.new # 크롬 헤드리스 모드 위해 옵션 설정
    options.add_argument('--disable-gpu') # 크롬 헤드리스 모드 사용 위해 disable-gpu setting
    options.add_argument('--headless') # 크롬 헤드리스 모드 사용 위해 headless setting
    @browser = Selenium::WebDriver.for :chrome, options: options # 실레니움 + 크롬 + 헤드리스 옵션으로 브라우저 실행
    
    @browser.navigate().to "http://cafe.daum.net/kangwonlike/EI5A"
    @browser.switch_to.frame("down")
    
    ## find_element랑 find_elements의 차이
    @content = @browser.find_elements(xpath: '//*[@id="primaryContent"]/table/tbody/tr[2]/td[2]/form[1]/table/tbody/tr')
    
    @content.each_with_index do |t, i|
      if (i > 4)
        @title = t.find_element(css: "td.subject > a").text
        @date = t.find_element(css: "td.date").text
        
        # puts "#{@title} / #{@date}"
        CrawlChunNotice.create(kind: "강대라이크 방정보", title: @title, date: @date, campus: "춘천")
      end
    end
    
    @browser.quit
    
  end
end