class UsersController < ApplicationController
    # 로그인 된 사용자만 접근 가능
    before_action :authenticate_user!
    # Rolify + Cancancan
    # load_and_authorize_resource
    
    def page
        @user = User.find(params[:id])
        # 권한을 가진 자만 접근가능! / 해당 def만 rolife+cancancan 적용.
        # authorize! :read, @user
        
        @posts = Post.where(user_id: current_user.id, created_at: 1.year.ago..Time.current).order("created_at DESC").all
        @comments = Comment.where(user_id: current_user.id, created_at: 1.year.ago..Time.current).order("created_at DESC").all

        @api_log = Log.all.where(user_id: current_user.id).order("created_at DESC")
    end
    
    def user_list
        @users = User.select("id, nickname")
        
        # Json 연동
        respond_to do |format|
          format.html
          format.json { render json: @users }
        end
    end
    
    def message
        @message_list = Message.where(created_at: 1.month.ago..Time.current).all
        session[:conversations] ||= []
        
        @users = User.all.where.not(id: current_user)
        @conversations = Conversation.includes(:recipient, :messages).find(session[:conversations])
    end
end