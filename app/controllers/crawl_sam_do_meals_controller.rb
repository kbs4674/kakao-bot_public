class CrawlSamDoMealsController < ApplicationController
  def samcheock_meal_normal_json
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      @data_result = CrawlSamDoMeal.where("campus like ?", "삼척").where("etc like ?", "기숙사 외 식당").to_json(:except => [:id, :created_at, :updated_at])
      Log.create(service_name: "삼척 5공학관 메뉴", service_type: "json", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :json => @data_result
  end

  def samcheock_meal_dormitory_json
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      @data_result = CrawlSamDoMeal.where("campus like ?", "삼척").find_by("title like ?", "%기숙사%").to_json(:except => [:id, :created_at, :updated_at])
      Log.create(service_name: "삼척 캠퍼스 기숙사 메뉴", service_type: "json", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :json => @data_result
  end

  def dogye_meal_normal_json
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      @data_result = CrawlSamDoMeal.where("campus like ?", "도계").where("etc like ?", "기숙사 외 식당").to_json(:except => [:id, :created_at, :updated_at])
      Log.create(service_name: "도계 캠퍼스 학생회관 메뉴", service_type: "json", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :json => @data_result
  end

  def dogye_meal_dormitory_json
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      @data_result = CrawlSamDoMeal.where("campus like ?", "도계").find_by("title like ?", "%기숙사%").to_json(:except => [:id, :created_at, :updated_at])
      Log.create(service_name: "도계 캠퍼스 기숙사 메뉴", service_type: "json", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :json => @data_result
  end
end
