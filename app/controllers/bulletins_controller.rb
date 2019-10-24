class BulletinsController < ApplicationController
  # 로그인 된 사용자만 접근 가능
  before_action :authenticate_user!
  # Rolify + Cancancan
  load_and_authorize_resource
  before_action :set_bulletin, only: [:show, :edit, :update, :destroy]

  # GET /bulletins
  # GET /bulletins.json
  def index
    @bulletins = Bulletin.page(params[:page]).per(10)
  end

  # GET /bulletins/1
  # GET /bulletins/1.json
  def show
  end

  # GET /bulletins/new
  def new
    @bulletin = Bulletin.new
  end

  # GET /bulletins/1/edit
  def edit
  end

  # POST /bulletins
  # POST /bulletins.json
  def create
    @bulletin = Bulletin.new(bulletin_params)

    respond_to do |format|
      if @bulletin.save
        format.html { redirect_to @bulletin, notice: '카테고리 생성 완료.' }
        format.json { render :show, status: :created, location: @bulletin }
      else
        format.html { render :new, notice: '글 제목 또는 내용을 입력해주세요.' }
        format.json { render json: @bulletin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bulletins/1
  # PATCH/PUT /bulletins/1.json
  def update
    respond_to do |format|
      if @bulletin.update(bulletin_params)
        format.html { redirect_to @bulletin, notice: '카테고리 수정 완료.' }
        format.json { render :show, status: :ok, location: @bulletin }
      else
        format.html { render :edit }
        format.json { render json: @bulletin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bulletins/1
  # DELETE /bulletins/1.json
  def destroy
    @bulletin.destroy
    respond_to do |format|
      format.html { redirect_to bulletins_url, alert: '카테고리 삭제 완료.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bulletin
      @bulletin = Bulletin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bulletin_params
      params[:bulletin][:user_id] = current_user.id
      params[:bulletin][:user_nickname] = current_user.nickname
      params.require(:bulletin).permit(:title, :content, :user_id, :user_nickname, :opt_admin_only, :opt_email, :opt_email_quantity, :opt_hashtag, :opt_post_vote, :opt_comment_vote, :opt_api)
    end
end
