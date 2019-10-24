class CommentsController < ApplicationController
  before_action :authenticate_user!
  # 권한설정
  #load_and_authorize_resource
  
  def upvote
    @comment = Comment.find(params[:id])
    
    #만약 '찬성' 투표를 이미 한 경우 : '찬성' 투표 취소
    if ((current_user.voted_up_on? @comment) == true)
      @comment.unliked_by current_user
      respond_to do |format|
        format.js { flash[:notice] = "해당 글의 추천을 취소하셨습니다." }
      end
    else
      @comment.upvote_by current_user
      respond_to do |format|
        format.js { flash[:notice] = "해당 글을 추천하셨습니다." }
      end
    end
  end
  
  # 투표 관련 Controller 내용 : 반대
  def downvote
    @comment = Comment.find(params[:id])
    
    #만약 '반대' 투표를 이미 한 경우 : '반대' 투표 취소
    if ((current_user.voted_down_on? @comment) == true)
      @comment.unliked_by current_user    
      respond_to do |format|
        format.js { flash[:notice] = "해당 글의 반대를 취소하셨습니다." }
      end
    else
      @comment.downvote_from current_user
      respond_to do |format|
        format.js { flash[:notice] = "해당 글을 반대하셨습니다." }
      end
    end
  end
 
  def create
    commentable = commentable_type.constantize.find(commentable_id)
    @comment = Comment.build_from(commentable, current_user.id, body)
    @comment.nickname = params[:comment][:nickname]
    
    # 댓글 비동기 처리 (모델 정보, 게시글의 ID 값을 찾아냄)
    @model_name = eval(commentable_type)
    @model_id = eval(commentable_id)
    @new_comment  = Comment.build_from(instance_eval(commentable_type).find(commentable_id), current_user.id, "")
    
    respond_to do |format|
      if @comment.save
        make_child_comment
        format.js { flash[:notice] = "댓글이 작성되었습니다." }
        #format.html  { redirect_to("#{request.referrer}#comment#{@comment.id}", :notice => '댓글이 작성되었습니다.') }
        
        if (@comment.commentable_type != AllNotice)
        
          ## 댓글
          if (@comment.parent_id == nil && @comment.user_id != commentable.user_id)
            # 외부인이 댓글을 쓸 경우 => 글 작성자에게 알림
            if (@comment.user_id != commentable.user_id)
              @new_notification = NewNotification.create! user: commentable.user,
                                                      content: "#{current_user.nickname.truncate(15, omission: '...')} 님이 댓글을 다셨습니다.",
                                                      link: request.referrer
            end
          ## 대댓글 영역
          elsif (@comment.parent_id != nil && @comment.user_id != commentable.user_id)
            # 외부인이 대댓글을 작성 시 => 댓글 작성자에게 알림이 발송
            if (@comment.user_id != @comment.parent.user_id)
              @new_notification = NewNotification.create! user: @comment.parent.user,
                                                      content: "#{current_user.nickname.truncate(15, omission: '...')} 님이 댓글을 다셨습니다.",
                                                      link: request.referrer
            
            ## 대댓글 답변자 모두에게 => 알림 발송
            elsif (@comment.parent_id == @comment.parent.id)
              @comment.parent.children.each do |x|
                if (@comment.user_id != x.user_id && x.user_id != commentable.user_id) # 자기 자신에겐 알림 메세지가 안가게
                  @new_notification5 = NewNotification.create! user: x.user,
                                                              content: "#{current_user.nickname.truncate(15, omission: '...')} 님이 댓글을 다셨습니다.",
                                                              link: request.referrer
                end
              end
            end
            
            # + 외부인이 대댓글을 작성 시 && 댓글 != 게시글 작성자 => 게시글 작성자에게 알림이 발송
            if (@comment.user_id != @comment.parent.user_id && @comment.parent.user_id != commentable.user_id)
              @new_notification = NewNotification.create! user: commentable.user,
                                                      content: "#{current_user.nickname.truncate(15, omission: '...')} 님이 댓글을 다셨습니다.",
                                                      link: request.referrer
   
            if (@comment.parent_id == @comment.parent.id)
              @comment.parent.children.each do |x|
                if (@comment.user_id != x.user_id && x.user_id != commentable.user_id) # 자기 자신에겐 알림 메세지가 안가게
                  @new_notification5 = NewNotification.create! user: x.user,
                                                              content: "#{current_user.nickname.truncate(15, omission: '...')} 님이 댓글을 다셨습니다.",
                                                              link: request.referrer
                end
              end
            end
   
            # 댓글 != 게시글 작성자 && 댓글 != 대댓글 작성자 => 게시글 작성자에게 알림이 발송
            elsif (@comment.user_id != commentable.user_id && @comment.parent.user_id != commentable.user_id)
              @new_notification = NewNotification.create! user: commentable.user,
                                                      content: "#{current_user.nickname.truncate(15, omission: '...')} 님이 댓글을 다셨습니다.",
                                                      link: request.referrer
            end
            
          elsif (@comment.parent_id != nil && @comment.user_id == commentable.user_id && @comment.user_id != @comment.parent.user_id)
            # 댓글 == 게시글 작성자 && 댓글 != 대댓글 작성자 => 대댓글 작성자에게 알림이 발송
            @new_notification = NewNotification.create! user: @comment.parent.user,
                                                      content: "#{current_user.nickname.truncate(15, omission: '...')} 님이 댓글을 다셨습니다.",
                                                      link: request.referrer
            
                                                      
          elsif (@comment.parent_id != nil && @comment.parent_id == @comment.parent.id)
            @comment.parent.children.each do |x|
              if (@comment.user_id != x.user_id && @comment.user_id != x.parent.user_id )# 자기 자신에겐 알림 메세지가 안가게
                @new_notification5 = NewNotification.create! user: x.user,
                                                            content: "#{current_user.nickname.truncate(15, omission: '...')} 님이 댓글을 다셨습니다.",
                                                            link: request.referrer
              end
            end
          end
          
          if (@comment.parent_id != nil && @comment.user_id == commentable.user_id && @comment.user_id != @comment.parent.user_id)
            @comment.parent.children.each do |x|
              if (@comment.user_id != x.user_id || x.parent_id != x.parent.id )# 자기 자신에겐 알림 메세지가 안가게
                @new_notification5 = NewNotification.create! user: x.user,
                                                            content: "#{current_user.nickname.truncate(15, omission: '...')} 님이 댓글을 다셨습니다.",
                                                            link: request.referrer
              elsif (@comment.user_id != x.user_id && x.parent_id != x.parent.id )# 자기 자신에겐 알림 메세지가 안가게
                @new_notification5 = NewNotification.create! user: x.user,
                                                            content: "#{current_user.nickname.truncate(15, omission: '...')} 님이 댓글을 다셨습니다.",
                                                            link: request.referrer
              end
            end
          end
          
          if (@comment.parent_id != nil && @comment.user_id == commentable.user_id && @comment.user_id == @comment.parent.user_id)
            @comment.parent.children.each do |x|
              if (@comment.user_id != x.user_id || x.parent_id != x.parent.id )# 자기 자신에겐 알림 메세지가 안가게
                @new_notification5 = NewNotification.create! user: x.user,
                                                            content: "#{current_user.nickname.truncate(15, omission: '...')} 님이 댓글을 다셨습니다.",
                                                            link: request.referrer
              elsif (@comment.user_id != x.user_id && x.parent_id != x.parent.id )# 자기 자신에겐 알림 메세지가 안가게
                @new_notification5 = NewNotification.create! user: x.user,
                                                            content: "#{current_user.nickname.truncate(15, omission: '...')} 님이 댓글을 다셨습니다.",
                                                            link: request.referrer
              end
            end
          end
          
          if (@comment.parent_id != nil && @comment.parent.user_id == commentable.user_id)
            @comment.parent.children.each do |x|
              if (@comment.user_id != x.user_id && @comment.user_id != x.parent.user_id )# 자기 자신에겐 알림 메세지가 안가게
                @new_notification5 = NewNotification.create! user: x.user,
                                                            content: "#{current_user.nickname.truncate(15, omission: '...')} 님이 댓글을 다셨습니다.",
                                                            link: request.referrer
              end
            end
          end
        
        end
        
        @comment.save
      else
        format.js { flash[:notice] = "댓글 내용을 작성해주세요." }
      end
    end
  end
  
  def edit
    @new_comment = Comment.find_by(id: params[:id])
    authorize! :edit, @new_comment

    respond_to do |format|
      format.js
    end
  end
  
  def update
    commentable = commentable_type.constantize.find(commentable_id)
    @new_comment_as_edit = Comment.build_from(commentable, current_user.id, body)
    
    @new_comment = Comment.find_by(id: params[:id])
    authorize! :update, @new_comment
    
    respond_to do |format|
      if @new_comment.update(comment_params)
        format.js
        format.json { render :show, status: :ok, location: @new_comment }
      else
        format.js
        format.json { render json: @new_comment.errors, status: :unprocessable_entity }
      end
    end
  end
 
  def destroy
    @comment = Comment.find(params[:id])
    authorize! :destroy, @comment
    
    # 댓글 비동기 처리 (모델 정보, 게시글의 ID 값을 찾아냄)
    @model_name = eval(@comment.commentable_type)
    @model_id = @comment.commentable_id
    
    @comment.destroy
    respond_to do |format|
      # format.html { redirect_to(request.referrer, :notice => '댓글이 삭제되었습니다.') }
      format.js { flash[:notice] = "댓글이 삭제되었습니다." }
    end
  end
  
  private
 
  def comment_params
    params[:comment][:nickname] = current_user.nickname
    params.require(:comment).permit(:body, :commentable_id, :commentable_type, :comment_id, :user_id, :nickname, :dependent)
  end
 
  def commentable_type
    comment_params[:commentable_type]
  end
 
  def commentable_id
    comment_params[:commentable_id]
  end
 
  def comment_id
    comment_params[:comment_id]
  end
 
  def body
    comment_params[:body]
  end
 
  def make_child_comment
    return "" if comment_id.blank?
 
    parent_comment = Comment.find comment_id
    @comment.move_to_child_of(parent_comment)
  end
end