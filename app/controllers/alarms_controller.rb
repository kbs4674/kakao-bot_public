class AlarmsController < ApplicationController
  def index
    @room = params[:room_name]
    @room_search = Alarm.find_by(title: @room)

    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      if not @room_search.nil?
        if @room_search.is_agree == true
          @room_search.update(title: @room, is_agree: false)
          @status = "업데이트"
        else
          @room_search.update(title: @room, is_agree: true)
          @status = "업데이트"
        end
      else
        @room_search = Alarm.create(title: @room, is_agree: true)
        @status = "새로운 방 추가"
      end
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :layout => false
  end

  def show
    @room = params[:room_name]
    @room_search = Alarm.find_by(title: @room)

    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if @compare.nil?
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :layout => false
  end

  def create
    @room = params[:room_name]
    @room_search = Alarm.find_by(title: @room)

    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      @room_search = Alarm.create(title: @room, is_agree: true);
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :layout => false
  end

  def list
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      @alarm = Alarm.where(is_agree: true)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :layout => false
  end
  
  def list_json
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      @alarm = Alarm.where(is_agree: true).to_json(:except => [:id, :created_at, :updated_at])
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :json => @alarm
  end
end
