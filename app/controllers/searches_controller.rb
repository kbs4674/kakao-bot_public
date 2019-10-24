class SearchesController < ApplicationController
  def index
    @option = params[:option]
    if (@option == "1")
      @searches = eval(params[:bulletin]).where('created_at >= :years_ago', :years_ago => Time.now - 1.years).where("title like ?", "%#{params[:search_text]}%").order("created_at DESC").page(params[:page]).per(10)
    elsif (@option == "2")
      @searches = eval(params[:bulletin]).where('created_at >= :years_ago', :years_ago => Time.now - 1.years).where("content like ?", "%#{params[:search_text]}%").order("created_at DESC").page(params[:page]).per(10)
    elsif (@option == "3")
      @searches = eval(params[:bulletin]).where('created_at >= :years_ago', :years_ago => Time.now - 1.years).where("title like ?", "%#{params[:search_text]}%").order("created_at DESC").page(params[:page]).per(10).or(eval(params[:bulletin]).where('created_at >= :years_ago', :years_ago => Time.now - 1.years).where("content like ?", "%#{params[:search_text]}%")).order("created_at DESC").page(params[:page]).per(10)
    elsif (@option == "4")
      @searches = eval(params[:bulletin]).where('created_at >= :years_ago', :years_ago => Time.now - 1.years).where("user_nickname like ?", "%#{params[:search_text]}%").order("created_at DESC").page(params[:page]).per(10)
    end
    @location = params[:bulletin]
  end
end