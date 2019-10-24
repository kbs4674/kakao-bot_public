class CrawlingEverytimesController < ApplicationController
  # 로그인 된 사용자만 접근 가능
  before_action :authenticate_user!, only: [:index, :new, :show, :edit]
  # 권한설정
  load_and_authorize_resource
  before_action :set_crawling_everytime, only: [:show, :edit, :update, :destroy, :destroy_comment]

  # GET /crawling_everytimes
  # GET /crawling_everytimes.json
  def index
    @crawling_everytimes = CrawlingEverytime.all.order("created_at DESC").page(params[:page]).per(20)
    
    @province_list = Array.new
    CrawlChunFineDust.all.each do |x|
      @all_province_list = @province_list.push(x.station)
    end
    
    if @all_province_list.present?
      @finedust_province_list = @all_province_list.uniq.to_s.gsub("[", "").gsub("]", "").gsub('"', "").gsub('"', "")
    end
  end

  # GET /crawling_everytimes/1
  # GET /crawling_everytimes/1.json
  def show
  end

  # GET /crawling_everytimes/new
  def new
    @crawling_everytime = CrawlingEverytime.new
  end

  # GET /crawling_everytimes/1/edit
  def edit
  end

  # POST /crawling_everytimes
  # POST /crawling_everytimes.json
  def create
    @crawling_everytime = CrawlingEverytime.new(crawling_everytime_params)

    respond_to do |format|
      if @crawling_everytime.save
        format.html { redirect_to @crawling_everytime, notice: 'Crawling everytime was successfully created.' }
        format.json { render :show, status: :created, location: @crawling_everytime }
      else
        format.html { render :new }
        format.json { render json: @crawling_everytime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crawling_everytimes/1
  # PATCH/PUT /crawling_everytimes/1.json
  def update
    respond_to do |format|
      if @crawling_everytime.update(crawling_everytime_params)
        format.html { redirect_to @crawling_everytime, notice: 'Crawling everytime was successfully updated.' }
        format.json { render :show, status: :ok, location: @crawling_everytime }
      else
        format.html { render :edit }
        format.json { render json: @crawling_everytime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crawling_everytimes/1
  # DELETE /crawling_everytimes/1.json
  def destroy
    @crawling_everytime.destroy
    respond_to do |format|
      format.html { redirect_to crawling_everytimes_url, notice: 'Crawling everytime was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crawling_everytime
      @crawling_everytime = CrawlingEverytime.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def crawling_everytime_params
      params.require(:crawling_everytime).permit(:title, :content, :article_id, :comment_id, :comment_content, :category_id, :category_name)
    end
end
