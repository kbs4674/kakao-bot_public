class InvitesController < ApplicationController
  # 로그인 된 사용자만 접근 가능
  before_action :authenticate_user!
  # Rolify + Cancancan
  load_and_authorize_resource

  def index
    @invites = Invite.all
  end

  def create
    if params[:identify] == "normal"
      for i in 0..20
        Invite.create(group: "normal", code: "#{SecureRandom.hex}", user_id: 1)
      end
    elsif params[:identify] == "student"
      for i in 0..20
        Invite.create(group: "student", code: "#{SecureRandom.hex}", user_id: 1)
      end
    elsif params[:identify] == "vip"
      for i in 0..20
        Invite.create(group: "vip", code: "#{SecureRandom.hex}", user_id: 1)
      end
    end
    redirect_to invites_index_path
  end

  def destroy
    @invite = Find(params[:id])
    @invite.destroy

    redirect_to invites_index_path
  end

  def destroy_all
    @invite = Invite.where(user_id: 1)
    @invite.each do |x|
      x.destroy
    end
    redirect_to invites_index_path
  end
end
