class TransfersController < ApplicationController
  require 'nokogiri'
  require 'open-uri'
  require 'mechanize'

  def bus_station_to_campus
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      doc = Nokogiri::HTML(open("http://www.kangwon.ac.kr/www/contents.do?key=215&"))
      @today_bus_time = Array.new

      if Time.zone.now.strftime("%A") == "Monday"
        for i in 1..30
          @bus_day_list = doc.css("#contents > table:nth-child(12) > tbody > tr:nth-child(#{i}) > td:nth-child(1)").text.strip

          if not (@bus_day_list == "" || @bus_day_list == " " || @bus_day_list == nil)
            @today_bus_time.push(@bus_day_list)
          end
        end
      end

      if (Time.zone.now.strftime("%A") == "Tuesday" || Time.zone.now.strftime("%A") == "Wednesday" || Time.zone.now.strftime("%A") == "Thursday")
        for i in 1..30
          @bus_day_list = doc.css("#contents > table:nth-child(12) > tbody > tr:nth-child(#{i}) > td:nth-child(3)").text.strip

          if not (@bus_day_list == "" || @bus_day_list == " " || @bus_day_list == nil)
            @today_bus_time.push(@bus_day_list)
          end
        end
      end

      if Time.zone.now.strftime("%A") == "Friday"
        for i in 1..30
          @bus_day_list = doc.css("#contents > table:nth-child(12) > tbody > tr:nth-child(#{i}) > td:nth-child(5)").text.strip

          if not (@bus_day_list == "" || @bus_day_list == " " || @bus_day_list == nil || @bus_day_list == "&nbsp;")
            @today_bus_time.push(@bus_day_list)
          end
        end
      end

      Log.create(service_name: "대학 셔틀버스 시간표 (남춘천역→캠퍼스)", service_type: "string", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :layout => false
  end
  
  def bus_station_to_campus_json
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      doc = Nokogiri::HTML(open("http://www.kangwon.ac.kr/www/contents.do?key=215&"))
      @today_bus_time = Array.new

      if Time.zone.now.strftime("%A") == "Monday"
        for i in 1..30
          @bus_day_list = doc.css("#contents > table:nth-child(12) > tbody > tr:nth-child(#{i}) > td:nth-child(1)").text.strip

          if not (@bus_day_list == "" || @bus_day_list == " " || @bus_day_list == nil)
            @today_bus_time.push(@bus_day_list)
          end
        end
      end

      if (Time.zone.now.strftime("%A") == "Tuesday" || Time.zone.now.strftime("%A") == "Wednesday" || Time.zone.now.strftime("%A") == "Thursday")
        for i in 1..30
          @bus_day_list = doc.css("#contents > table:nth-child(12) > tbody > tr:nth-child(#{i}) > td:nth-child(3)").text.strip

          if not (@bus_day_list == "" || @bus_day_list == " " || @bus_day_list == nil)
            @today_bus_time.push(@bus_day_list)
          end
        end
      end

      if Time.zone.now.strftime("%A") == "Friday"
        for i in 1..30
          @bus_day_list = doc.css("#contents > table:nth-child(12) > tbody > tr:nth-child(#{i}) > td:nth-child(5)").text.strip

          if not (@bus_day_list == "" || @bus_day_list == " " || @bus_day_list == nil || @bus_day_list == "&nbsp;")
            @today_bus_time.push(@bus_day_list)
          end
        end
      end
      
      @to_json = @today_bus_time.map do |u|
        { :time => u }
      end
      
      @data_result = @to_json.to_json

      Log.create(service_name: "대학 셔틀버스 시간표 (남춘천역→캠퍼스)", service_type: "string", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :layout => false
  end

  def bus_to_station
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      doc = Nokogiri::HTML(open("http://www.kangwon.ac.kr/www/contents.do?key=215&"))
      @today_bus_time = Array.new

      for i in 2..30
        @bus_day_list = doc.css("#contents > table:nth-child(15) > tr > td:nth-child(#{i})").text.strip

        if not (@bus_day_list == "" || @bus_day_list == " " || @bus_day_list == nil || @bus_day_list == "&nbsp;")
          @today_bus_time.push(@bus_day_list)
        end
      end
      
      @to_json = @today_bus_time.map do |u|
        { :time => u }
      end
      
      @data_result = @to_json.to_json

      Log.create(service_name: "대학 셔틀버스 시간표 (캠퍼스→남춘천역)", service_type: "string", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :layout => false
  end
  
  def bus_to_station_json
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      doc = Nokogiri::HTML(open("http://www.kangwon.ac.kr/www/contents.do?key=215&"))
      @today_bus_time = Array.new

      for i in 2..30
        @bus_day_list = doc.css("#contents > table:nth-child(15) > tr > td:nth-child(#{i})").text.strip

        if not (@bus_day_list == "" || @bus_day_list == " " || @bus_day_list == nil || @bus_day_list == "&nbsp;")
          @today_bus_time.push(@bus_day_list)
        end
      end

      Log.create(service_name: "대학 셔틀버스 시간표 (캠퍼스→남춘천역)", service_type: "string", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :layout => false
  end

  def itx
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      ## "용산역" 혹은 "역곡역"인 경우 맨 마지막 "역" 글자 제거
      @departure_name = params[:departure]
      @arrival_name = params[:arrival]

      if (@departure_name.last == "역")
        @departure_name = @departure_name.first(-1);
      end

      if (@arrival_name.last == "역")
        @arrival_name = @arrival_name.first(-1);
      end

      ## ITX 기차역(서울)
      itx_refer_url = "http://openapi.tago.go.kr/openapi/service/TrainInfoService/getCtyAcctoTrainSttnList?serviceKey=#{ENV["GO_DATA_API"]}"
      itx_seoul_headers = { :params => { CGI::escape('numOfRows') => '60', CGI::escape('cityCode') => '11' } }
      @itx_seoul_time_list = RestClient::Request.execute :method => 'GET', :url => itx_refer_url , :headers => itx_seoul_headers
      @itx_seoul_time_to_xml = @itx_seoul_time_list.body

      @itx_seoul_doc = Nokogiri::XML(@itx_seoul_time_to_xml)
      # category Mapping
      @itx_seoul_station_name = @itx_seoul_doc.xpath("//nodename").map { |cur| cur.text } # 기차역 명
      @itx_seoul_station_node = @itx_seoul_doc.xpath("//nodeid").map { |cur| cur.text } # 기차역 코드
      @itx_seoul_station_to_hash = @itx_seoul_station_name.zip(@itx_seoul_station_node)
      @station_array = @itx_seoul_station_to_hash

      for num in 0..@itx_seoul_station_name.length-1
        if (@station_array[num][0] == @departure_name)
          @departure_code = @station_array[num][1]
        end

        if (@station_array[num][0] == @arrival_name)
          @arrival_code = @station_array[num][1]
        end
      end

      if (@arrival_code.nil? || @departure_code.nil?)
        ## ITX 기차역(경기)
        itx_gyunggido_headers = { :params => { CGI::escape('numOfRows') => '60', CGI::escape('cityCode') => '31' } }
        @itx_gyunggido_time_list = RestClient::Request.execute :method => 'GET', :url => itx_refer_url , :headers => itx_gyunggido_headers
        @itx_gyunggido_time_to_xml = @itx_gyunggido_time_list.body

        @itx_gyunggido_doc = Nokogiri::XML(@itx_gyunggido_time_to_xml)
        # category Mapping
        @itx_gyunggido_station_name = @itx_gyunggido_doc.xpath("//nodename").map { |cur| cur.text } # 기차역 명
        @itx_gyunggido_station_node = @itx_gyunggido_doc.xpath("//nodeid").map { |cur| cur.text } # 기차역 코드
        @itx_gyunggido_station_to_hash = @itx_gyunggido_station_name.zip(@itx_gyunggido_station_node)
        @station_array = @itx_gyunggido_station_to_hash

        for num in 0..@itx_gyunggido_station_name.length-1
          if (@station_array[num][0] == @departure_name)
            @departure_code = @station_array[num][1]
          end

          if (@station_array[num][0] == @arrival_name)
            @arrival_code = @station_array[num][1]
          end
        end
      end

      if (@arrival_code.nil? || @departure_code.nil?)
        ## ITX 기차역(강원)
        itx_gangwondo_headers = { :params => { CGI::escape('numOfRows') => '60', CGI::escape('cityCode') => '32' } }
        @itx_gangwondo_time_list = RestClient::Request.execute :method => 'GET', :url => itx_refer_url , :headers => itx_gangwondo_headers
        @itx_gangwondo_time_to_xml = @itx_gangwondo_time_list.body

        @itx_gangwondo_doc = Nokogiri::XML(@itx_gangwondo_time_to_xml)
        # category Mapping
        @itx_gangwondo_station_name = @itx_gangwondo_doc.xpath("//nodename").map { |cur| cur.text } # 기차역 명
        @itx_gangwondo_station_node = @itx_gangwondo_doc.xpath("//nodeid").map { |cur| cur.text } # 기차역 코드
        @itx_gangwondo_station_to_hash = @itx_gangwondo_station_name.zip(@itx_gangwondo_station_node)
        @station_array = @itx_gangwondo_station_to_hash

        for num in 0..@itx_gangwondo_station_name.length-1
          if (@station_array[num][0] == @departure_name)
            @departure_code = @station_array[num][1]
          end

          if (@station_array[num][0] == @arrival_name)
            @arrival_code = @station_array[num][1]
          end
        end
      end

      if not (@arrival_code.nil? && @departure_code.nil?)
        ## 기차역 조회(?역 → 남춘천역)
        url = "http://openapi.tago.go.kr/openapi/service/TrainInfoService/getStrtpntAlocFndTrainInfo?serviceKey=#{ENV["GO_DATA_API"]}"
        headers = { :params => { CGI::escape('numOfRows') => '30', CGI::escape('depPlaceId') => @departure_code, CGI::escape('arrPlaceId') => @arrival_code, CGI::escape('depPlandTime') => "#{(Time.now).strftime('%Y%m%d')}", CGI::escape('trainGradeCode') => '09' } }
        @itx_time_list = RestClient::Request.execute :method => 'GET', :url => url , :headers => headers
        @itx_time_to_xml = @itx_time_list.body
        @doc = Nokogiri::XML(@itx_time_to_xml)
        @itx_dep_time = @doc.xpath("//depplandtime")
        @itx_dep_time_to_hash = @itx_dep_time.map { |cur| cur.text }
        @itx_dep_time_array = Array.new
        @itx_dep_time_to_hash.each do |x|
          @itx_dep_time_array.push("#{x.last(6).remove.first(2)}시 #{x.last(4).remove.first(2)}분")
        end
        @itx_to_chuncheon_today_timetable = @itx_dep_time_array.map(&:inspect).join(',').gsub('"', "").gsub('"', "")
      else
        @itx_to_chuncheon_today_timetable = nil
      end

      Log.create(service_name: "ITX 기차 시간표", service_type: "string", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :layout => false
  end

  def itx_json
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      ## "용산역" 혹은 "역곡역"인 경우 맨 마지막 "역" 글자 제거
      @departure_name = params[:departure]
      @arrival_name = params[:arrival]

      if (@departure_name.last == "역")
        @departure_name = @departure_name.first(-1);
      end

      if (@arrival_name.last == "역")
        @arrival_name = @arrival_name.first(-1);
      end

      ## ITX 기차역(서울)
      itx_refer_url = "http://openapi.tago.go.kr/openapi/service/TrainInfoService/getCtyAcctoTrainSttnList?serviceKey=#{ENV["GO_DATA_API"]}"
      itx_seoul_headers = { :params => { CGI::escape('numOfRows') => '60', CGI::escape('cityCode') => '11' } }
      @itx_seoul_time_list = RestClient::Request.execute :method => 'GET', :url => itx_refer_url , :headers => itx_seoul_headers
      @itx_seoul_time_to_xml = @itx_seoul_time_list.body

      @itx_seoul_doc = Nokogiri::XML(@itx_seoul_time_to_xml)
      # category Mapping
      @itx_seoul_station_name = @itx_seoul_doc.xpath("//nodename").map { |cur| cur.text } # 기차역 명
      @itx_seoul_station_node = @itx_seoul_doc.xpath("//nodeid").map { |cur| cur.text } # 기차역 코드
      @itx_seoul_station_to_hash = @itx_seoul_station_name.zip(@itx_seoul_station_node)
      @station_array = @itx_seoul_station_to_hash

      for num in 0..@itx_seoul_station_name.length-1
        if (@station_array[num][0] == @departure_name)
          @departure_code = @station_array[num][1]
        end

        if (@station_array[num][0] == @arrival_name)
          @arrival_code = @station_array[num][1]
        end
      end

      if (@arrival_code.nil? || @departure_code.nil?)
        ## ITX 기차역(경기)
        itx_gyunggido_headers = { :params => { CGI::escape('numOfRows') => '60', CGI::escape('cityCode') => '31' } }
        @itx_gyunggido_time_list = RestClient::Request.execute :method => 'GET', :url => itx_refer_url , :headers => itx_gyunggido_headers
        @itx_gyunggido_time_to_xml = @itx_gyunggido_time_list.body

        @itx_gyunggido_doc = Nokogiri::XML(@itx_gyunggido_time_to_xml)
        # category Mapping
        @itx_gyunggido_station_name = @itx_gyunggido_doc.xpath("//nodename").map { |cur| cur.text } # 기차역 명
        @itx_gyunggido_station_node = @itx_gyunggido_doc.xpath("//nodeid").map { |cur| cur.text } # 기차역 코드
        @itx_gyunggido_station_to_hash = @itx_gyunggido_station_name.zip(@itx_gyunggido_station_node)
        @station_array = @itx_gyunggido_station_to_hash

        for num in 0..@itx_gyunggido_station_name.length-1
          if (@station_array[num][0] == @departure_name)
            @departure_code = @station_array[num][1]
          end

          if (@station_array[num][0] == @arrival_name)
            @arrival_code = @station_array[num][1]
          end
        end
      end

      if (@arrival_code.nil? || @departure_code.nil?)
        ## ITX 기차역(강원)
        itx_gangwondo_headers = { :params => { CGI::escape('numOfRows') => '60', CGI::escape('cityCode') => '32' } }
        @itx_gangwondo_time_list = RestClient::Request.execute :method => 'GET', :url => itx_refer_url , :headers => itx_gangwondo_headers
        @itx_gangwondo_time_to_xml = @itx_gangwondo_time_list.body

        @itx_gangwondo_doc = Nokogiri::XML(@itx_gangwondo_time_to_xml)
        # category Mapping
        @itx_gangwondo_station_name = @itx_gangwondo_doc.xpath("//nodename").map { |cur| cur.text } # 기차역 명
        @itx_gangwondo_station_node = @itx_gangwondo_doc.xpath("//nodeid").map { |cur| cur.text } # 기차역 코드
        @itx_gangwondo_station_to_hash = @itx_gangwondo_station_name.zip(@itx_gangwondo_station_node)
        @station_array = @itx_gangwondo_station_to_hash

        for num in 0..@itx_gangwondo_station_name.length-1
          if (@station_array[num][0] == @departure_name)
            @departure_code = @station_array[num][1]
          end

          if (@station_array[num][0] == @arrival_name)
            @arrival_code = @station_array[num][1]
          end
        end
      end

      if not (@arrival_code.nil? && @departure_code.nil?)
        ## 기차역 조회(?역 → 남춘천역)
        url = "http://openapi.tago.go.kr/openapi/service/TrainInfoService/getStrtpntAlocFndTrainInfo?serviceKey=#{ENV["GO_DATA_API"]}"
        headers = { :params => { CGI::escape('numOfRows') => '30', CGI::escape('depPlaceId') => @departure_code, CGI::escape('arrPlaceId') => @arrival_code, CGI::escape('depPlandTime') => "#{(Time.now).strftime('%Y%m%d')}", CGI::escape('trainGradeCode') => '09' } }
        @itx_time_list = RestClient::Request.execute :method => 'GET', :url => url , :headers => headers
        @itx_time_to_xml = @itx_time_list.body
        @doc = Nokogiri::XML(@itx_time_to_xml)
        @itx_dep_time = @doc.xpath("//depplandtime")
        @itx_dep_time_to_hash = @itx_dep_time.map { |cur| cur.text }
        @itx_dep_time_array = Array.new
        @itx_dep_time_to_hash.each do |x|
          @itx_dep_time_array.push("#{x.last(6).remove.first(2)}시 #{x.last(4).remove.first(2)}분")
        end

        @to_json = @itx_dep_time_array.map do |u|
          { :time => u }
        end
        @tree = { :departure => @departure_name, :arrival => @arrival_name, :itx_time => @to_json }
        @data_result = @tree.to_json

      else
        @itx_to_chuncheon_today_timetable = nil
      end

      Log.create(service_name: "ITX 기차 시간표", service_type: "json", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :json => @data_result
  end

  def subway
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      @station_name = params[:search_text]
      if (@station_name.last == "역")
        @station_name = @station_name.first(-1);
      end

      # @station_name = "청량리"
      @station_name = @station_name.encode!("UTF-8")
      @station_name_encode = ERB::Util.url_encode(@station_name) # URL 형식으로 문자 인코딩을 안해줄 시 차 후에 에러 발생

      subway = "http://swopenAPI.seoul.go.kr/api/subway/#{ENV['SEOUL_GO_DATA_API']}/xml/realtimeStationArrival/0/80/#{@station_name_encode}"
      @subway_params = RestClient::Request.execute :method => 'GET', :url => subway
      @subway_result = @subway_params.body
      @subway_xml = Nokogiri::XML(@subway_result)

      ## 호선
      @subway_line = @subway_xml.xpath("//subwayId")
      @subway_line_array = Array.new
      for i in 0..@subway_line.length-1 do
        if (@subway_line[i].text == "1001")
          @subway_line_array.push("1호선")
        elsif (@subway_line[i].text == "1002")
          @subway_line_array.push("2호선")
        elsif (@subway_line[i].text == "1003")
          @subway_line_array.push("3호선")
        elsif (@subway_line[i].text == "1004")
          @subway_line_array.push("4호선")
        elsif (@subway_line[i].text == "1005")
          @subway_line_array.push("5호선")
        elsif (@subway_line[i].text == "1006")
          @subway_line_array.push("6호선")
        elsif (@subway_line[i].text == "1007")
          @subway_line_array.push("7호선")
        elsif (@subway_line[i].text == "1008")
          @subway_line_array.push("8호선")
        elsif (@subway_line[i].text == "1009")
          @subway_line_array.push("9호선")
        elsif (@subway_line[i].text == "1063")
          @subway_line_array.push("경의중앙선")
        elsif (@subway_line[i].text == "1065")
          @subway_line_array.push("공항철도")
        elsif (@subway_line[i].text == "1067")
          @subway_line_array.push("경춘선")
        elsif (@subway_line[i].text == "1069")
          @subway_line_array.push("인천1호선")
        elsif (@subway_line[i].text == "1071")
          @subway_line_array.push("수인선")
        elsif (@subway_line[i].text == "1075")
          @subway_line_array.push("분당선")
        elsif (@subway_line[i].text == "1077")
          @subway_line_array.push("신분당선")
        else
          @subway_line_array.push("Unknown Line")
        end
      end

      ## 상행/하행 구분
      @subway_dpdn_line = @subway_xml.xpath("//updnLine")
      @subway_dpdn_line_array = Array.new
      for i in 0..@subway_dpdn_line.length-1 do
        @subway_dpdn_line_array.push(@subway_dpdn_line[i].text)
      end

      ## 목적지(bound for)
      @subway_bstatnNm = @subway_xml.xpath("//bstatnNm")
      @subway_bstatnNm_array = Array.new
      for i in 0..@subway_bstatnNm.length-1 do
        @subway_bstatnNm_array.push(@subway_bstatnNm[i].text)
      end

      ## 열차 구분 (일반 / 급행)
      # @subway_btrainSttus = @subway_xml.xpath("//btrainSttus")
      # @subway_btrainSttus_array = Array.new
      # for i in 0..@subway_btrainSttus.length-1 do
      #   @subway_btrainSttus_array.push(@subway_btrainSttus[i].text)
      # end

      ## 이전 열차 도착예정 (ex : 전역 진입, 3분 후)
      @subway_arvlMsg2 = @subway_xml.xpath("//arvlMsg2")
      @subway_arvlMsg2_array = Array.new
      for i in 0..@subway_arvlMsg2.length-1 do
        @subway_arvlMsg2_array.push(@subway_arvlMsg2[i].text)
      end

      @subway_entire_info = Array.new(12) {Array.new(3)}
      for i in 0..10 do
        @subway_entire_info[i][0] = @subway_dpdn_line_array[i]
        @subway_entire_info[i][1] = @subway_line_array[i]
        @subway_entire_info[i][2] = @subway_bstatnNm_array[i]
        @subway_entire_info[i][3] = @subway_arvlMsg2_array[i]
      end

      Log.create(service_name: "전철 시간표", service_type: "string", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :layout => false
  end

  def subway_json
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      @station_name = params[:search_text]
      if (@station_name.last == "역")
        @station_name = @station_name.first(-1);
      end

      # @station_name = "청량리"
      @station_name = @station_name.encode!("UTF-8")
      @station_name_encode = ERB::Util.url_encode(@station_name) # URL 형식으로 문자 인코딩을 안해줄 시 차 후에 에러 발생

      subway = "http://swopenAPI.seoul.go.kr/api/subway/#{ENV['SEOUL_GO_DATA_API']}/xml/realtimeStationArrival/0/80/#{@station_name_encode}"
      @subway_params = RestClient::Request.execute :method => 'GET', :url => subway
      @subway_result = @subway_params.body
      @subway_xml = Nokogiri::XML(@subway_result)

      ## 호선
      @subway_line = @subway_xml.xpath("//subwayId")
      @subway_line_array = Array.new
      for i in 0..@subway_line.length-1 do
        if (@subway_line[i].text == "1001")
          @subway_line_array.push("1호선")
        elsif (@subway_line[i].text == "1002")
          @subway_line_array.push("2호선")
        elsif (@subway_line[i].text == "1003")
          @subway_line_array.push("3호선")
        elsif (@subway_line[i].text == "1004")
          @subway_line_array.push("4호선")
        elsif (@subway_line[i].text == "1005")
          @subway_line_array.push("5호선")
        elsif (@subway_line[i].text == "1006")
          @subway_line_array.push("6호선")
        elsif (@subway_line[i].text == "1007")
          @subway_line_array.push("7호선")
        elsif (@subway_line[i].text == "1008")
          @subway_line_array.push("8호선")
        elsif (@subway_line[i].text == "1009")
          @subway_line_array.push("9호선")
        elsif (@subway_line[i].text == "1063")
          @subway_line_array.push("경의중앙선")
        elsif (@subway_line[i].text == "1065")
          @subway_line_array.push("공항철도")
        elsif (@subway_line[i].text == "1067")
          @subway_line_array.push("경춘선")
        elsif (@subway_line[i].text == "1069")
          @subway_line_array.push("인천1호선")
        elsif (@subway_line[i].text == "1071")
          @subway_line_array.push("수인선")
        elsif (@subway_line[i].text == "1075")
          @subway_line_array.push("분당선")
        elsif (@subway_line[i].text == "1077")
          @subway_line_array.push("신분당선")
        else
          @subway_line_array.push("Unknown Line")
        end
      end

      ## 상행/하행 구분
      @subway_dpdn_line = @subway_xml.xpath("//updnLine")
      @subway_dpdn_line_array = Array.new
      for i in 0..@subway_dpdn_line.length-1 do
        @subway_dpdn_line_array.push(@subway_dpdn_line[i].text)
      end

      ## 목적지(bound for)
      @subway_bstatnNm = @subway_xml.xpath("//bstatnNm")
      @subway_bstatnNm_array = Array.new
      for i in 0..@subway_bstatnNm.length-1 do
        @subway_bstatnNm_array.push(@subway_bstatnNm[i].text)
      end

      ## 열차 구분 (일반 / 급행)
      # @subway_btrainSttus = @subway_xml.xpath("//btrainSttus")
      # @subway_btrainSttus_array = Array.new
      # for i in 0..@subway_btrainSttus.length-1 do
      #   @subway_btrainSttus_array.push(@subway_btrainSttus[i].text)
      # end

      ## 이전 열차 도착예정 (ex : 전역 진입, 3분 후)
      @subway_arvlMsg2 = @subway_xml.xpath("//arvlMsg2")
      @subway_arvlMsg2_array = Array.new
      for i in 0..@subway_arvlMsg2.length-1 do
        @subway_arvlMsg2_array.push(@subway_arvlMsg2[i].text)
      end

      @subway_entire_info = Array.new(12) {Array.new(3)}
      for i in 0..10 do
        @subway_entire_info[i][0] = @subway_dpdn_line_array[i]
        @subway_entire_info[i][1] = @subway_line_array[i]
        @subway_entire_info[i][2] = @subway_bstatnNm_array[i]
        @subway_entire_info[i][3] = @subway_arvlMsg2_array[i]
      end

      @subway_entire_info.each {|s| s.compact!}
      @subway_entire_info = @subway_entire_info.reject { |item| item.nil? || item.empty? }

      @to_json = @subway_entire_info.map.with_index do |u, i|
        { :direct => @subway_entire_info[i][0], :line => @subway_entire_info[i][1], :bound_for => @subway_entire_info[i][2], :current_station => @subway_entire_info[i][3] }
      end

      @tree = { :station => @station_name, :station_time => @to_json }
      @data_result = @tree.to_json

      Log.create(service_name: "전철 시간표", service_type: "json", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :json => @data_result
  end
end