class CrawlChunNoticeController < ApplicationController
  def kangwonlike_room_trade
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      @crawl_result = CrawlChunNotice.where("kind like ?", "강대라이크 방정보").order("date DESC")
      Log.create(service_name: "강대라이크 방정보", service_type: "string", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :layout => false
  end
  
  def kangwonlike_room_trade_json
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      @data_result = CrawlChunNotice.where("kind like ?", "강대라이크 방정보").to_json(:except => [:id, :created_at, :updated_at])
      Log.create(service_name: "강대라이크 방정보", service_type: "json", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :json => @data_result
  end
  
  def notice
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      @crawl_result = CrawlChunNotice.where("kind like ?", "공지사항").order("date DESC")
      Log.create(service_name: "강원대 종합공지", service_type: "string", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :layout => false
  end
  
  def notice_json
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      @data_result = CrawlChunNotice.where("kind like ?", "공지사항").to_json(:except => [:id, :created_at, :updated_at])
      Log.create(service_name: "강원대 종합공지", service_type: "json", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :json => @data_result
  end
  
  def campus_notice
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      @crawl_result = CrawlChunNotice.where("kind like ?", "%학사공지%").order("date DESC")
      Log.create(service_name: "강원대 학사공지", service_type: "string", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :layout => false
  end
  
  def campus_notice_json
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      @data_result = CrawlChunNotice.where("kind like ?", "%학사공지%").to_json(:except => [:id, :created_at, :updated_at])
      Log.create(service_name: "강원대 학사공지", service_type: "json", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :json => @data_result
  end
  
  def campus_scholarship
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      @crawl_result = CrawlChunNotice.where("kind like ?", "%대학장학%").order("date DESC")
      Log.create(service_name: "강원대 장학공지", service_type: "string", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :layout => false
  end
  
  def campus_scholarship_json
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      @data_result = CrawlChunNotice.where("kind like ?", "%대학장학%").to_json(:except => [:id, :created_at, :updated_at])
      Log.create(service_name: "강원대 장학공지", service_type: "json", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :json => @data_result
  end
  
  def campus_monthly_schedule
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      @crawl_result = CrawlChunNotice.where("kind like ?", "%월별 학사일정(춘천)%").order("date DESC")
      Log.create(service_name: "대학 월별 학사일정(춘천)", service_type: "string", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :layout => false
  end
  
  def campus_monthly_schedule_json
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      @data_result = CrawlChunNotice.where("kind like ?", "%월별 학사일정(춘천)%").order("date DESC")
      Log.create(service_name: "대학 월별 학사일정(춘천)", service_type: "json", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end
    
    @tree = { :month => "#{Time.zone.now.strftime('%m월')}", :data => @data_result }

    render :json => @tree.to_json(:except => [:id, :kind, :created_at, :updated_at])
  end
  
  def campus_student_header
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      @crawl_result = CrawlChunNotice.where("kind like ?", "%총학생회 공지%").order("date DESC")
      Log.create(service_name: "총학생회 공지사항", service_type: "string", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :layout => false
  end
  
  def campus_student_header_json
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      @data_result = CrawlChunNotice.where("kind like ?", "%총학생회 공지%").to_json(:except => [:id, :created_at, :updated_at])
      Log.create(service_name: "총학생회 공지사항", service_type: "json", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :json => @data_result
  end
  
  def dorm_chun_notice
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      @crawl_result = CrawlChunNotice.where("kind like ?", "%기숙사(춘천) 공지사항%").order("date DESC").first(7)
      Log.create(service_name: "기숙사(춘천) 공지사항", service_type: "string", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :layout => false
  end
  
  def dorm_chun_notice_json
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      @data_result = CrawlChunNotice.where("kind like ?", "%기숙사(춘천) 공지사항%").to_json(:except => [:id, :created_at, :updated_at])
      Log.create(service_name: "기숙사(춘천) 공지사항", service_type: "json", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :json => @data_result
  end
end
