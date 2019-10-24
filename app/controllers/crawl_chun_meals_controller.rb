class CrawlChunMealsController < ApplicationController
  def dor_normal
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      @crawl_result = CrawlChunMeal.find_by("title like ?", "%재정생활관%")
      Log.create(service_name: "재정생활관 메뉴", service_type: "string", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :layout => false
  end
  
  def dor_normal_json
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      @data_result = CrawlChunMeal.find_by("title like ?", "%재정생활관%").to_json(:except => [:id, :created_at, :updated_at])
      Log.create(service_name: "재정생활관 메뉴", service_type: "json", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :json => @data_result
  end

  def old_btl
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      @crawl_result = CrawlChunMeal.find_by("title like ?", "%새롬관%")
      Log.create(service_name: "새롬관(뉴 BTL) 메뉴", service_type: "string", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :layout => false
  end
  
  def old_btl_json
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      @data_result = CrawlChunMeal.find_by("title like ?", "%새롬관%").to_json(:except => [:id, :created_at, :updated_at])
      Log.create(service_name: "새롬관(뉴 BTL) 메뉴", service_type: "json", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :json => @data_result
  end

  def new_btl
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      @crawl_result = CrawlChunMeal.find_by("title like ?", "%이룸관%")
      Log.create(service_name: "이룸관(구 BTL) 메뉴", service_type: "string", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :layout => false
  end
  
  def new_btl_json
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      @data_result = CrawlChunMeal.find_by("title like ?", "%이룸관%").to_json(:except => [:id, :created_at, :updated_at])
      Log.create(service_name: "이룸관(구 BTL) 메뉴", service_type: "json", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :json => @data_result
  end
  
  def bak_json
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      @data_result = CrawlChunMeal.where("etc like ?", "백록관").to_json(:except => [:id, :created_at, :updated_at])
      Log.create(service_name: "백록관 메뉴", service_type: "json", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :json => @data_result
  end

  def cheon_json
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      @data_result = CrawlChunMeal.where("etc like ?", "천지관").to_json(:except => [:id, :created_at, :updated_at])
      Log.create(service_name: "천지관 메뉴", service_type: "json", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :json => @data_result
  end
end
