class NewNotificationsController < ApplicationController
    def index
        @new_notifications = current_user.new_notifications.unread_by(current_user)
    end
    
    def show
        @new_notification = NewNotification.find(params[:id])
        @new_notification.mark_as_read! for: current_user
        redirect_to @new_notification.link
    end
      
    def read_all
        current_user.new_notifications.mark_as_read! :all, for: current_user
        redirect_back fallback_location: root_path
    end
end