# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    @code = params[:user][:invite_code]
    @invite = Invite.where(code: @code).first

    if (params[:user][:agree] == "1" && (@invite.nil? == false && @invite.is_used == false))
      super
      if @invite.nil?
        User.find(current_user.id).update(invite_code: nil)
      else
        if (@invite.group == "student" || @invite.group == "vip")
          @invite_info = Invite.find(@invite.id).update(user_id: current_user.id, is_used: true)
          @user = User.find(current_user.id)
          @user.update(invite_id: @invite.id, invite_group: @invite.group)
          @user.add_role :student
        else
          @invite_info = Invite.find(@invite.id).update(user_id: current_user.id, is_used: true)
          @user = User.find(current_user.id)
          @user.update(invite_id: @invite.id, invite_group: @invite.group)
        end
      end
    elsif (@invite.nil?)
      flash[:alert] = "유효하지 않은 초대코드 입니다."
      redirect_to request.referrer
    elsif (@invite.is_used == true)
      flash[:alert] = "이미 사용된 초대코드 입니다."
      redirect_to request.referrer
    else
      flash[:alert] = "서비스 이용에 동의하지 않으셨습니다."
      redirect_to request.referrer
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  def destroy
      ## 그동안 주고받았던 모든 쪽지를 지워야 계정이 삭제됨.
      Message.all.each do |x|
        if current_user.id == x.user_id
          x.destroy
        end
      end
      
      Conversation.all.each do |y|
        if current_user.id == y.sender_id
          y.destroy
        end
      end

      Post.all.where(user_id: current_user.id).each do |z|
        @post = Post.find(z.id)
        @post.update(user_id: 1)
      end

      Comment.all.where(user_id: current_user.id).each do |z|
        @comment = Comment.find(z.id)
        @comment.update(user_id: 1)
      end

      Invite.find_by(code: current_user.invite_code).destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
