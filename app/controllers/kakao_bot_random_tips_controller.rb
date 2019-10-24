class KakaoBotRandomTipsController < ApplicationController
  def index
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      @kakao_bot_random_tips = KakaoBotRandomTip.all
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :layout => false
  end
end