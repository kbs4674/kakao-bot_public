class MessagesController < ApplicationController
    before_action :set_message, only: [:destroy, :hide_message, :hide_message_their]
    
    def hide_message
        @message.upvote_by current_user
        redirect_to(request.referrer, :notice => '쪽지가 숨김처리 되었습니다.')
    end
    
    def hide_message_their
        @message.downvote_by current_user
        redirect_to(request.referrer, :notice => '쪽지가 숨김처리 되었습니다.')
    end
    
    def create
        @conversation = Conversation.includes(:recipient).find(params[:conversation_id])
        @message = @conversation.messages.create(message_params)
        if Message.create
            if ((@message.user.nickname == @conversation.recipient.nickname) && (@conversation.recipient.nickname != @conversation.sender.nickname))
                @new_notification = NewNotification.create! user: Conversation.find(params[:conversation_id]).sender,
                content: "#{current_user.nickname.truncate(15, omission: '...')} 님으로 부터 쪽지가 왔습니다.",
                link: request.referrer
                   
            elsif ((@message.user.nickname == @conversation.sender.nickname) && (@conversation.recipient.nickname != @conversation.sender.nickname))
                @new_notification = NewNotification.create! user: Conversation.find(params[:conversation_id]).recipient,
                content: "#{current_user.nickname.truncate(15, omission: '...')} 님으로 부터 쪽지가 왔습니다.",
                link: request.referrer
            end
        end
        
        respond_to do |format|
            format.js
        end
    end
    
    def destroy
        @message.destroy
        respond_to do |format|
            format.html { redirect_to users_message_path, alert: '쪽지가 삭제되었습니다.' }
            format.json { head :no_content }
        end
    end
    
    private
    
    def set_message
      @message = Message.find(params[:id])
    end
    
    def message_params
        params[:message][:user_id] = current_user.id
        params[:message][:nickname] = current_user.nickname
        params.require(:message).permit(:user_id, :body, :nickname)
    end
end