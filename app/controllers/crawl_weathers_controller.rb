class CrawlWeathersController < ApplicationController
  require 'nokogiri'
  require 'open-uri'
  require 'mechanize'
  require 'selenium-webdriver'

  def fine_dust
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      @crawl_result = CrawlChunFineDust.where("station like ?", "%#{params[:search_text]}%")
      Log.create(service_name: "실시간 미세먼지 수치", service_type: "string", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end
    render :layout => false
  end

  def fine_dust_json
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      # :province, :time, :station, :pm10, :pm25, :state, :state_micro
      @data_result = CrawlChunFineDust.all.to_json(:except => [:id, :created_at, :updated_at])
      Log.create(service_name: "실시간 미세먼지 수치 (All)", service_type: "json", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end
    render :layout => false
  end

  def fine_dust_json_condition
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      # :province, :time, :station, :pm10, :pm25, :state, :state_micro
      @data_result = CrawlChunFineDust.where("station like ?", "%#{params[:search_text]}%").to_json(:except => [:id, :created_at, :updated_at])
      Log.create(service_name: "실시간 미세먼지 수치 (Condition)", service_type: "json", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end
    render :layout => false
  end

  def hangang_river_temp
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      doc = Nokogiri::HTML(open("https://www.wpws.kr/hangang/"))
      @crawl_result = doc.css("#temp").text
      Log.create(service_name: "한강 수온", service_type: "string", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :layout => false
  end

  def hangang_river_temp_json
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      doc = Nokogiri::HTML(open("https://www.wpws.kr/hangang/"))
      @crawl_result = doc.css("#temp")

      @to_json = @crawl_result.map do |u|
        { :temperature => u.text }
      end

      @crawl_result = @to_json.to_json
      Log.create(service_name: "한강 수온", service_type: "json", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :layout => false
  end

  def weather
    @code = params[:code]
    @compare = Invite.where(code: @code).first
    
    @location = params[:location]
    @location = "#{params[:location]}" + " 날씨"
    @location = @location.encode!("UTF-8")
    @location_encode = ERB::Util.url_encode(@location)

    if not @compare.nil?
      Selenium::WebDriver::Chrome.driver_path = `which chromedriver-helper`.chomp # 설치한 크롬 드라이버 사용
      
      ## 헤드리스 개념 : https://beomi.github.io/2017/09/28/HowToMakeWebCrawler-Headless-Chrome/
      options = Selenium::WebDriver::Chrome::Options.new # 크롬 헤드리스 모드 위해 옵션 설정
      options.add_argument('--disable-gpu') # 크롬 헤드리스 모드 사용 위해 disable-gpu setting
      options.add_argument('--headless') # 크롬 헤드리스 모드 사용 위해 headless setting
      @browser = Selenium::WebDriver.for :chrome, options: options # 실레니움 + 크롬 + 헤드리스 옵션으로 브라우저 실행
      
      @browser.navigate().to "https://search.naver.com/search.naver?query=#{@location_encode}"
      
      @location_info = @browser.find_element(css: 'span.btn_select > em').text
      @weather_temp = @browser.find_element(xpath: '//*[@id="main_pack"]/div[2]/div[2]/div[2]/div[1]/div[3]/div[1]/div/p/span[1]').text
      @weather_temp_min = @browser.find_element(css: 'span.min > span.num').text
      @weather_temp_max = @browser.find_element(css: 'span.max > span.num').text
      @weather_summary = @browser.find_element(css: 'p.cast_txt').text
      
      @browser.quit
      # # 강원도 춘천시 날씨
      # @crawl_result = CrawlChunWeather.all
      # #@rainy_average = CrawlChunWeather.average("rainy")
      # Log.create(service_name: "날씨", service_type: "string", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :layout => false
  end
end
