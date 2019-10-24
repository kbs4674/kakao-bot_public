Rails.application.routes.draw do
  root 'homes#index'
  resources :homes

  ## 카카오 알림
  get 'alarms/index/:room_name/:code' => "alarms#index"
  get 'alarms/list/:code' => "alarms#list"
  get 'alarms/list.json/:code' => "alarms#list_json"
  get 'alarms/show/:room_name/:code' => "alarms#show"
  get 'alarms/create/:room_name/:code' => "alarms#create"

  ## 초대코드 관리 URI
  delete 'invites/destroy/:id' => "invites#destroy", as: "invite_destroy"
  delete 'invites/destroy_all' => "invites#destroy_all", as: "invite_destroy_all"
  post 'invites/create/:identify' => "invites#create", as: "invite_create"
  get 'invites/index'

  ## 순위 : 네이버 / 롤 게임 전적
  get 'ranks/opgg_lol/:search_text/:code' => "ranks#opgg_lol", as: "opgg_lol"
  get 'ranks/opgg_lol.json/:search_text/:code' => "ranks#opgg_lol_json", as: "opgg_lol_json"
  get 'ranks/opgg_lol_current_game/:search_text/:code' => "ranks#opgg_lol_current_game", as: "opgg_lol_current_game"
  get 'ranks/opgg_lol_current_game.json/:search_text/:code' => "ranks#opgg_lol_current_game_json", as: "opgg_lol_current_game_json"
  get 'ranks/naver_music/:code' => "ranks#naver_music", as: "naver_music"
  get 'ranks/naver_music.json/:code' => "ranks#naver_music_json", as: "naver_music_json"

  ## 날씨
  get 'crawl_weathers/hangang_river_temp/:code' => "crawl_weathers#hangang_river_temp", as: "han_river_temp"
  get 'crawl_weathers/hangang_river_temp.json/:code' => "crawl_weathers#hangang_river_temp_json", as: "han_river_temp_json"
  get 'crawl_weathers/fine_dust/:search_text/:code' => "crawl_weathers#fine_dust", as: "fine_dust"
  get 'crawl_weathers/fine_dust.json/:code' => "crawl_weathers#fine_dust_json", as: "fine_dust_json"
  get 'crawl_weathers/fine_dust_condition.json/:search_text/:code' => "crawl_weathers#fine_dust_json_condition", as: "fine_dust_json_condition"
  get 'crawl_weathers/weather/:location/:code' => "crawl_weathers#weather", as: "weather"

  ## 교통
  get 'transfers/itx/:departure/:arrival/:code' => "transfers#itx", as: "itx"
  get 'transfers/itx.json/:departure/:arrival/:code' => "transfers#itx_json", as: "itx_json"
  get 'transfers/subway/:search_text/:code' => "transfers#subway", as: "subway"
  get 'transfers/subway.json/:search_text/:code' => "transfers#subway_json", as: "subway_json"

  ## 대학생 메뉴
  get 'recipes/index/:code' => "recipes#index", as: "recipes"
  get 'kakao_bot_random_tips/index/:code' => "kakao_bot_random_tips#index", as: "kakao_bot_random_tip"
  get 'crawl_chun_notice/kangwonlike_room_trade/:code' => "crawl_chun_notice#kangwonlike_room_trade", as: "kangwonlike_room_trade" # 강대라이크 원룸 게시판
  get 'crawl_chun_notice/kangwonlike_room_trade.json/:code' => "crawl_chun_notice#kangwonlike_room_trade_json", as: "kangwonlike_room_trade_json" # 강대라이크 원룸 게시판 / json
  get 'crawl_chun_notice/notice/:code' => "crawl_chun_notice#notice", as: "campus_entire_notice" # 대학 공지(종합)
  get 'crawl_chun_notice/notice.json/:code' => "crawl_chun_notice#notice_json", as: "campus_entire_notice_json" # 대학 공지(종합) / json
  get 'crawl_chun_notice/campus_notice/:code' => "crawl_chun_notice#campus_notice", as: "campus_notice" # 대학 공지 : 학사안내
  get 'crawl_chun_notice/campus_notice.json/:code' => "crawl_chun_notice#campus_notice_json", as: "campus_notice_json" # 대학 공지 : 학사안내 / json
  get 'crawl_chun_notice/campus_scholarship/:code' => "crawl_chun_notice#campus_scholarship", as: "campus_scholarship" # 대학 공지 : 장학안내
  get 'crawl_chun_notice/campus_scholarship.json/:code' => "crawl_chun_notice#campus_scholarship_json", as: "campus_scholarship_json" # 대학 공지 : 장학안내 / json
  get 'crawl_chun_notice/campus_monthly_schedule/:code' => "crawl_chun_notice#campus_monthly_schedule", as: "univ_monthly_schedules"
  get 'crawl_chun_notice/campus_monthly_schedule.json/:code' => "crawl_chun_notice#campus_monthly_schedule_json", as: "univ_monthly_schedules_json"
  get 'crawl_chun_notice/campus_student_header/:code' => "crawl_chun_notice#campus_student_header", as: "campus_student_header"
  get 'crawl_chun_notice/campus_student_header.json/:code' => "crawl_chun_notice#campus_student_header_json", as: "campus_student_header_json"
  get 'crawl_chun_notice/dorm_chun_notice/:code' => "crawl_chun_notice#dorm_chun_notice", as: "dorm_chun_notice"
  get 'crawl_chun_notice/dorm_chun_notice.json/:code' => "crawl_chun_notice#dorm_chun_notice_json", as: "dorm_chun_notice_json"
  get 'crawl_chun_meals/dor_normal/:code' => "crawl_chun_meals#dor_normal", as: "meal_dor_normal"
  get 'crawl_chun_meals/dor_normal.json/:code' => "crawl_chun_meals#dor_normal_json", as: "meal_dor_normal_json"
  get 'crawl_chun_meals/old_btl/:code' => "crawl_chun_meals#old_btl", as: "meal_old_btl"
  get 'crawl_chun_meals/old_btl.json/:code' => "crawl_chun_meals#old_btl_json", as: "meal_old_btl_json"
  get 'crawl_chun_meals/new_btl/:code' => "crawl_chun_meals#new_btl", as: "meal_new_btl"
  get 'crawl_chun_meals/new_btl.json/:code' => "crawl_chun_meals#new_btl_json", as: "meal_new_btl_json"
  get 'crawl_chun_meals/bak/:code' => "crawl_chun_meals#bak", as: "meal_bak"
  get 'crawl_chun_meals/bak.json/:code' => "crawl_chun_meals#bak_json", as: "meal_bak_json"
  get 'crawl_chun_meals/cheon/:code' => "crawl_chun_meals#cheon", as: "meal_cheon"
  get 'crawl_chun_meals/cheon.json/:code' => "crawl_chun_meals#cheon_json", as: "meal_cheon_json"
  
  get 'crawl_sam_do_meals/samcheock_meal_normal.json/:code' => "crawl_sam_do_meals#samcheock_meal_normal_json", as: "samcheock_meal_normal_json"
  get 'crawl_sam_do_meals/samcheock_meal_dormitory.json/:code' => "crawl_sam_do_meals#samcheock_meal_dormitory_json", as: "samcheock_meal_dormitory_json"
  get 'crawl_sam_do_meals/dogye_meal_normal.json/:code' => "crawl_sam_do_meals#dogye_meal_normal_json", as: "dogye_meal_normal_json"
  get 'crawl_sam_do_meals/dogye_meal_dormitory.json/:code' => "crawl_sam_do_meals#dogye_meal_dormitory_json", as: "dogye_meal_dormitory_json"
  
  get 'transfers/bus_station_to_campus/:code' => "transfers#bus_station_to_campus", as: "campus_bus_to_campus"
  get 'transfers/bus_station_to_campus.json/:code' => "transfers#bus_station_to_campus_json", as: "campus_bus_to_campus_json"
  get 'transfers/bus_to_station/:code' => "transfers#bus_to_station", as: "campus_bus_to_station"
  get 'transfers/bus_to_station.json/:code' => "transfers#bus_to_station_json", as: "campus_bus_to_station_json"
  
  ## 검색기록 랭킹
  get "ranks/bot_func_ranks/:title/:year" => "ranks#bot_func_ranks", as: "bot_func_ranks"
  get "ranks/bot_func_ranks.json" => "ranks#bot_func_ranks_json", as: "bot_func_ranks_json"
  
  resources :crawling_everytimes
  post '/activate_info/' => 'bot_events#activate_info'
  post '/activate_newbie/' => 'bot_events#activate_newbie'
  delete '/activate_destroy/' => 'bot_events#active_force_destroy'
  post '/crawling_everytimes/:crawling_everytimes_id' => 'bot_events#destroy_comment'

  resources :all_notices
  get 'users/page/:id' => 'users#page'
  
  # User 리스트를 json으로 받아옴.
  get 'users/user_list'
  
  #쪽지
  get '/users/message'
  delete '/users/message/:id' => 'messages#destroy'
  resources :conversations, only: [:create] do
    member do
      post :close
    end
    resources :messages, only: [:create]
  end

  resources :messages, only: [:hide_message] do
    member do
      put "hide_message", to: "messages#hide_message"
      put "hide_message_their", to: "messages#hide_message_their"
    end
  end
  
  #검색 결과
  get 'searches/index' => 'searches#index'
  
  #알림 : 전체 삭제
  get '/new_notifications/read_all' => 'new_notifications#read_all'
  #알림
  resources :new_notifications
  
  resources :comments, only: [:create, :destroy, :edit, :update] do
    member do
      put "like", to:    "comments#upvote"
      put "dislike", to: "comments#downvote"
    end
  end
  
  resources :posts
  
  resources :bulletins do
    # 해시태그
    get 'posts/hashtag/:name', to: 'posts#hashtags'
    resources :posts do
      post "/restore", to: "posts#restore"
      member do
        put "like", to:    "posts#upvote"
        put "dislike", to: "posts#downvote"
      end
    end
  end
  
  devise_for :users, controllers: { registrations: 'users/registrations' }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
