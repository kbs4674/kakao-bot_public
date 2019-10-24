class HomesController < ApplicationController
  before_action :set_home, only: [:show, :edit, :update, :destroy]

  # 로그인 된 사용자만 접근 가능
  before_action :authenticate_user!, only: [:index, :new, :show, :edit]
  # 권한설정
  load_and_authorize_resource

  # GET /homes
  # GET /homes.json
  def index
    @homes = Home.all

    @crawling_everytimes = CrawlingEverytime.all.order("created_at DESC").page(params[:page]).per(20)

    @province_list = Array.new
    CrawlChunFineDust.all.each do |x|
      @all_province_list = @province_list.push(x.station)
    end

    if @all_province_list.present?
      @finedust_province_list = @all_province_list.uniq.to_s.gsub("[", "").gsub("]", "").gsub('"', "").gsub('"', "")
    end
  end

  # GET /homes/1
  # GET /homes/1.json
  def show
  end

  # GET /homes/new
  def new
    @home = Home.new
  end

  # GET /homes/1/edit
  def edit
  end

  # POST /homes
  # POST /homes.json
  def create
    @home = Home.new(home_params)

    respond_to do |format|
      if @home.save
        format.html { redirect_to @home, notice: 'Home was successfully created.' }
        format.json { render :show, status: :created, location: @home }
      else
        format.html { render :new }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /homes/1
  # PATCH/PUT /homes/1.json
  def update
    respond_to do |format|
      if @home.update(home_params)
        format.html { redirect_to @home, notice: 'Home was successfully updated.' }
        format.json { render :show, status: :ok, location: @home }
      else
        format.html { render :edit }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homes/1
  # DELETE /homes/1.json
  def destroy
    @home.destroy
    respond_to do |format|
      format.html { redirect_to homes_url, notice: 'Home was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_home
      @home = Home.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def home_params
      params.require(:home).permit(:user_id, :nickname, :title, :content)
    end
end
