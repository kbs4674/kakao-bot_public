class AnyThingsController < ApplicationController
  
  require 'nokogiri'
  require 'open-uri'
  
  
  ## LOL : 전적 조회
  def opgg_lol
    @user_nickname = params[:search_text].gsub(" ", "+")
    
    opgg = "https://www.op.gg/summoner/"
    opgg_headers = { :params => { CGI::escape('userName') => "#{@user_nickname}" } }
    @opgg_params = RestClient::Request.execute :method => 'GET', :url => opgg , :headers => opgg_headers
    @opgg_crawl_result = @opgg_params.body
    @opgg_link = Nokogiri::XML(@opgg_crawl_result)
    
    @opgg_rank_result_params = @opgg_link.css('.SideContent > .TierBox > .SummonerRatingMedium > .Medal > .TierRankInfo > .TierRank').map { |cur| cur.text.strip }
    @opgg_rank = @opgg_rank_result_params.map(&:inspect).join('').gsub("[", "").gsub('"', "").gsub('"', "").gsub("]", "")
    
    @opgg_LP_result_params = @opgg_link.css('.SideContent > .TierBox > .SummonerRatingMedium > .Medal > .TierRankInfo > .TierInfo > span.LeaguePoints').map { |cur| cur.text.strip }
    @opgg_LP = @opgg_LP_result_params.map(&:inspect).join('').gsub("[", "").gsub('"', "").gsub('"', "").gsub("]", "")
  end
  
  ## LOL : 게임을 함께하는 유저
  def opgg_lol_game
    @user_nickname = params[:search_text].gsub(" ", "+")
    
    opgg = "https://www.op.gg/summoner/spectator/"
    opgg_headers = { :params => { CGI::escape('userName') => "#{@user_nickname}" } }
    @opgg_params = RestClient::Request.execute :method => 'GET', :url => opgg , :headers => opgg_headers
    @opgg_crawl_result = @opgg_params.body
    @opgg_link = Nokogiri::XML(@opgg_crawl_result)
    
    @opgg_name_params = @opgg_link.css('.SummonerName > a.SummonerName').map { |cur| cur.text.strip }
    @opgg_tier_params = @opgg_link.css('.CurrentSeasonTierRank > .TierRank').map { |cur| cur.text.strip }
    @opgg_win_ratio_params = @opgg_link.css('.RankedWinRatio > .Ratio').map { |cur| cur.text.strip }
    @opgg_win_ratio_play_quantity_params = @opgg_link.css('.RankedWinRatio > .TotalCount').map { |cur| cur.text.strip.gsub("\n", "").gsub("\t", "").gsub("Played", " 게임") }
    @all_team_set = @opgg_name_params.zip(@opgg_tier_params, @opgg_win_ratio_params, @opgg_win_ratio_play_quantity_params)
    
    #@opgg_blue_team = @all_team_set.map(&:inspect).join("\n").gsub("[", "").gsub('"', "").gsub('"', "").gsub("]", "")
    @opgg_blue_team1 = @all_team_set.first(1).map(&:inspect).join("").gsub("[", "").gsub('"', "").gsub('"', "").gsub("]", "")
    @opgg_blue_team2 = @all_team_set.drop(1).first(1).map(&:inspect).join("").gsub("[", "").gsub('"', "").gsub('"', "").gsub("]", "")
    @opgg_blue_team3 = @all_team_set.drop(2).first(1).map(&:inspect).join("").gsub("[", "").gsub('"', "").gsub('"', "").gsub("]", "")
    @opgg_blue_team4 = @all_team_set.drop(3).first(1).map(&:inspect).join("").gsub("[", "").gsub('"', "").gsub('"', "").gsub("]", "")
    @opgg_blue_team5 = @all_team_set.drop(4).first(1).map(&:inspect).join("").gsub("[", "").gsub('"', "").gsub('"', "").gsub("]", "")
    
    #@opgg_red_team = @all_team_set.drop(5).map(&:inspect).join("\n").gsub("[", "").gsub('"', "").gsub('"', "").gsub("]", "")
    @opgg_red_team1 = @all_team_set.drop(5).first(1).map(&:inspect).join("").gsub("[", "").gsub('"', "").gsub('"', "").gsub("]", "")
    @opgg_red_team2 = @all_team_set.drop(6).first(1).map(&:inspect).join("").gsub("[", "").gsub('"', "").gsub('"', "").gsub("]", "")
    @opgg_red_team3 = @all_team_set.drop(7).first(1).map(&:inspect).join("").gsub("[", "").gsub('"', "").gsub('"', "").gsub("]", "")
    @opgg_red_team4 = @all_team_set.drop(8).first(1).map(&:inspect).join("").gsub("[", "").gsub('"', "").gsub('"', "").gsub("]", "")
    @opgg_red_team5 = @all_team_set.drop(9).first(1).map(&:inspect).join("").gsub("[", "").gsub('"', "").gsub('"', "").gsub("]", "")
  end
end
