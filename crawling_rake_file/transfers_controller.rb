class TransfersController < ApplicationController
  require 'nokogiri'
  require 'open-uri'
  require 'mechanize'
  
  def itx_to_chuncheon
    ## "용산역" 혹은 "역곡역"인 경우 맨 마지막 "역" 글자 제거
    @station_name = params[:search_text]
    if (@station_name.last == "역")
      @station_name = @station_name.first(-1);
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
      if (@station_array[num][0] == @station_name)
        @station = @station_array[num][1]
      end
    end
    
    if @station.nil?
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
        if (@station_array[num][0] == @station_name)
          @station = @station_array[num][1]
        end
      end
    end
    
    if @station.nil?
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
        if (@station_array[num][0] == @station_name)
          @station = @station_array[num][1]
        end
      end
    end
    
    if not (@station.nil?)
      ## 기차역 조회(?역 → 남춘천역)
      url = "http://openapi.tago.go.kr/openapi/service/TrainInfoService/getStrtpntAlocFndTrainInfo?serviceKey=#{ENV["GO_DATA_API"]}"
      headers = { :params => { CGI::escape('numOfRows') => '30', CGI::escape('depPlaceId') => "#{@station}", CGI::escape('arrPlaceId') => "NAT140840", CGI::escape('depPlandTime') => "#{(Time.now+9.hours).strftime('%Y%m%d')}", CGI::escape('trainGradeCode') => '09' } }
      @itx_time_list = RestClient::Request.execute :method => 'GET', :url => url , :headers => headers
      @itx_time_to_xml = @itx_time_list.body
      @doc = Nokogiri::XML(@itx_time_to_xml)
      @itx_dep_time = @doc.xpath("//depplandtime")
      @itx_dep_time_to_hash = @itx_dep_time.map { |cur| cur.text }
      @itx_dep_time_array = Array.new
      @itx_dep_time_to_hash.each do |x|
        @itx_dep_time_array.push("#{x.last(6).remove.first(2)}시 #{x.last(4).remove.first(2)}분")
      end
      @itx_to_chuncheon_today_timetable = @itx_dep_time_array.map(&:inspect).join(' / ').gsub('"', "").gsub('"', "")
    else
      @itx_to_chuncheon_today_timetable = nil
    end
  end
  
  def itx_to_seoul
    ## "용산역" 혹은 "역곡역"인 경우 맨 마지막 "역" 글자 제거
    @station_name = params[:search_text]
    if (@station_name.last == "역")
      @station_name = @station_name.first(-1);
    end
    
    ## ITX 기차역(서울, 용산역/청량리역 등)
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
      if (@station_array[num][0] == @station_name)
        @station = @station_array[num][1]
      end
    end
    
    if @station.nil?
      ## ITX 기차역(경기, 가평역/평내호평역 등)
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
        if (@station_array[num][0] == @station_name)
          @station = @station_array[num][1]
        end
      end
    end
    
    if @station.nil?
      ## ITX 기차역(강원, 강촌역/남춘천역 등)
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
        if (@station_array[num][0] == @station_name)
          @station = @station_array[num][1]
        end
      end
    end
    
    if not (@station.nil?)
      ## 기차역 조회 (남춘천역 → ?)
      url = "http://openapi.tago.go.kr/openapi/service/TrainInfoService/getStrtpntAlocFndTrainInfo?serviceKey=#{ENV["GO_DATA_API"]}"
      headers = { :params => { CGI::escape('numOfRows') => '30', CGI::escape('depPlaceId') => "NAT140840", CGI::escape('arrPlaceId') => "#{@station}", CGI::escape('depPlandTime') => "#{(Time.now+9.hours).strftime('%Y%m%d')}", CGI::escape('trainGradeCode') => '09' } }
      @itx_time_list = RestClient::Request.execute :method => 'GET', :url => url , :headers => headers
      @itx_time_to_xml = @itx_time_list.body
      @doc = Nokogiri::XML(@itx_time_to_xml)
      @itx_dep_time = @doc.xpath("//depplandtime")
      @itx_dep_time_to_hash = @itx_dep_time.map { |cur| cur.text }
      @itx_dep_time_array = Array.new
      @itx_dep_time_to_hash.each do |x|
      @itx_dep_time_array.push("#{x.last(6).remove.first(2)}시 #{x.last(4).remove.first(2)}분")
      end
      @itx_to_seoul_today_timetable = @itx_dep_time_array.map(&:inspect).join(' / ').gsub('"', "").gsub('"', "")
    else
      @itx_to_seoul_today_timetable = nil
    end
  end

  def subway
    @crawl_result = TransferSubway.where("kind like ?", "%#{params[:search_text]}%")
  end
end
