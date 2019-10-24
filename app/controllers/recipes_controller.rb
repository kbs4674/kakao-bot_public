class RecipesController < ApplicationController
  def index
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      @recipes = Recipe.all
      Log.create(service_name: "랜덤 레시피", service_type: "string", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :layout => false
  end
end
