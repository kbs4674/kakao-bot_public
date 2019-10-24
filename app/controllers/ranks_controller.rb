class RanksController < ApplicationController
  
  def opgg_lol
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      @user_nickname = params[:search_text].gsub(" ", "+")

      opgg = "https://www.op.gg/summoner/"
      opgg_headers = { :params => { CGI::escape('userName') => "#{@user_nickname}" } }
      @opgg_params = RestClient::Request.execute :method => 'GET', :url => opgg , :headers => opgg_headers
      @opgg_crawl_result = @opgg_params.body
      @opgg_link = Nokogiri::HTML(@opgg_crawl_result)

      @opgg_rank_result_params = @opgg_link.css('.TierRank').map { |cur| cur.text.strip }
      @opgg_rank = @opgg_rank_result_params.map(&:inspect).join('').gsub("[", "").gsub('"', "").gsub('"', "").gsub("]", "")

      @opgg_LP_result_params = @opgg_link.css('span.LeaguePoints').map { |cur| cur.text.strip }
      @opgg_LP = @opgg_LP_result_params.map(&:inspect).join('').gsub("[", "").gsub('"', "").gsub('"', "").gsub("]", "")

      Log.create(service_name: "LOL 전적 조회", service_type: "string", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :layout => false
  end

  def opgg_lol_json
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      @original_user_nickname = params[:search_text]
      @user_nickname = params[:search_text].gsub(" ", "+")

      opgg = "https://www.op.gg/summoner/"
      opgg_headers = { :params => { CGI::escape('userName') => "#{@user_nickname}" } }
      @opgg_params = RestClient::Request.execute :method => 'GET', :url => opgg , :headers => opgg_headers
      @opgg_crawl_result = @opgg_params.body
      @opgg_link = Nokogiri::HTML(@opgg_crawl_result)

      @opgg_rank_result_params = @opgg_link.css('.TierRank').map { |cur| cur.text.strip }
      @opgg_LP_result_params = @opgg_link.css('span.LeaguePoints').map { |cur| cur.text.strip }

      @opgg_user_info = Array.new
      @opgg_user_info[0] = @opgg_rank_result_params[0]
      @opgg_user_info[1] = @opgg_LP_result_params[0]

      @to_json = { :original_user_nickname => @original_user_nickname, :lol_nickname_no_space => @user_nickname, :summoner_info => [{ :rank => @opgg_user_info[0], :LP => @opgg_user_info[1] }] }
      @data_result = @to_json.to_json

      Log.create(service_name: "LOL 전적 조회", service_type: "json", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :json => @data_result
  end

  def opgg_lol_current_game
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      @user_nickname = params[:search_text].gsub(" ", "+")

      opgg = "https://www.op.gg/summoner/spectator/"
      opgg_headers = { :params => { CGI::escape('userName') => "#{@user_nickname}" } }
      @opgg_params = RestClient::Request.execute :method => 'GET', :url => opgg , :headers => opgg_headers
      @opgg_crawl_result = @opgg_params.body
      @opgg_link = Nokogiri::HTML(@opgg_crawl_result)

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
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :layout => false
  end

  def opgg_lol_current_game_json
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      @original_user_nickname = params[:search_text]
      @user_nickname = params[:search_text].gsub(" ", "+")

      opgg = "https://www.op.gg/summoner/spectator/"
      opgg_headers = { :params => { CGI::escape('userName') => "#{@user_nickname}" } }
      @opgg_params = RestClient::Request.execute :method => 'GET', :url => opgg , :headers => opgg_headers
      @opgg_crawl_result = @opgg_params.body
      @opgg_link = Nokogiri::HTML(@opgg_crawl_result)

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

      @to_json = { :original_user_nickname => @original_user_nickname, :lol_nickname_no_space => @user_nickname, :current_play_with => { :team_blue => [{ :blue_1 => @opgg_blue_team1, :blue_2 => @opgg_blue_team2, :blue_3 => @opgg_blue_team3, :blue_4 => @opgg_blue_team4, :blue_5 => @opgg_blue_team5 }], :team_red => [{ :red_1 => @opgg_red_team1, :red_2 => @opgg_red_team2, :red_3 => @opgg_red_team3, :red_4 => @opgg_red_team4, :red_5 => @opgg_red_team5  }] } }
      @data_result = @to_json.to_json

      Log.create(service_name: "LOL 게임 조회 - 타 유저 전적", service_type: "json", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :json => @data_result
  end

  def naver_music
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      #크롤링(nokogiri) : 네이버 뮤직
      doc = Nokogiri::HTML(open("https://music.naver.com/listen/top100.nhn?domain=TOTAL_V2"))
      @naver_music_array = Array.new
      @naver_music = doc.css("div._tracklist_mytrack.tracklist_table.tracklist_type1 > table > tbody > tr > td.name")
      @naver_music.each do |x|
        @title = x.css("a._title > span").text
        @naver_music_array.push(@title)
      end

      @naver_music_list = @naver_music_array.to_s.gsub("[", "").gsub('",', "\n").gsub('"', "").gsub("]", "")
      Log.create(service_name: "네이버 뮤직 순위", service_type: "string", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :layout => false
  end

  def naver_music_json
    @code = params[:code]
    @compare = Invite.where(code: @code).first

    if not @compare.nil?
      #크롤링(nokogiri) : 네이버 뮤직
      doc = Nokogiri::HTML(open("https://music.naver.com/listen/top100.nhn?domain=TOTAL_V2"))
      @naver_music_array = Array.new
      @naver_music = doc.css("div._tracklist_mytrack.tracklist_table.tracklist_type1 > table > tbody > tr > td.name")
      @naver_music.each do |x|
        @title = x.css("a._title > span").text
        @naver_music_array.push(@title)
      end

      @to_json = @naver_music_array.map.with_index do |u, i|
        { :rank => i, :music_name => u }
      end

      @naver_music_list = @to_json.to_json
      Log.create(service_name: "네이버 뮤직 순위", service_type: "json", user_id: @compare.user_id, ip: request.remote_ip, key: @code)
    else
      flash[:alert] = "[500] API키가 유효하지 않습니다."
    end

    render :json => @data_result
  end
  
  def bot_func_ranks
    @botSendTitle = params[:title]
    @botSendYear = params[:year]
    @dataResult = BotFuncRank.find_by_data(@botSendTitle, @botSendYear)
    
    render :layout => false
  end
  
  def bot_func_ranks_json
    @botSendTitle = params[:title]
    @currentYear = params[:year]
    
    if (@botSendTitle.nil?) && (@botSendYear.nil?)
      @data_result = BotFuncRank.order("hit_#{Time.zone.now.strftime('%m')} DESC").first(10)
      @data_result.each do |t|
        t.current_month_hit = t.hit_10
      end
    else
      @data_result = BotFuncRank.order("year DESC").where(title: @botSendTitle).find_by(year: @currentYear)
    end

    render :json => @data_result, methods: :current_month_hit, :except => [:id, :created_at, :updated_at]
  end
  
  def bot_func_ranks_result
  end
end
