// ***** Github 공개 코드에서는 일부 기능은 비공개로 처리됩니다. ***** //
var admin_list = []; // 어드민 list
var notice_room_list = []; // 공지를 안내한 채팅방 리스트
var event_list = []; // 이벤트 참여자 목록
var shuttle_bus_bool = true; // 셔틀버스 운행여부
var bot_activity_count = 0; // 봇 메세지 카운트 (전체 채팅방 카운트)
var bot_notice = ""; // 봇 전체공지
var bot_notice_bool = false; // 봇 전체공지

function response(room, msg, sender, isGroupChat, replier)
{
   var say_hi = Math.floor(Math.random() * 5) + 1; // '안녕하세요' 혹은 '하이' 라고 할 시 응답할 확률
   // 빈 공란
   var blank = "\u200b".repeat(501)
   // 날짜
   var d = new Date();
   var year = d.getFullYear()

   function tip() {
      /* BOT 활용 TIP */
      tip = Utils.getWebText("http://kakao-bot-api.herokuapp.com/kakao_bot_random_tips/index/××××××××××××××××××××××××××××××","Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36",false,false);
      tip = tip.replace(/(<([^>]+)>)/g, "").trim();
   }

   function sleep (delay) {
      var start = new Date().getTime();
      while (new Date().getTime() < start + delay);
   }

   /* 이스터 에그 */
   if(msg == ".곰두리봇" || msg == '.ㄱㄷㄹㅂ')
   {
      tip();
      replier.reply('곰두리봇은 2019년 4월 3일에 태어난 강원대학교 학우들의 도우미 BOT이에오!\nʕ•ﻌ•ʔ ♡\n\n[Tip] '+ tip);
   }

   if(msg == ".학점" || msg == ".전투력")
   {
      tip();

      hangang_river_temperature = Utils.getWebText("http://kakao-bot-api.herokuapp.com/crawl_weathers/hangang_river_temp/××××××××××××××××××××××××××××××","Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36",false,false);
      hangang_river_temperature = hangang_river_temperature.replace(/(<([^>]+)>)/g, "").trim();

      var choice = Math.floor(Math.random() * 2) + 1;

      var score = 0;

      if (choice == "1") { score = Math.random() * 2 + 3; }
      if (choice == "2") { score = Math.random() * 2 + 2; }

      var response_choice = Math.floor(Math.random() * 8) + 1;
      var response_comment;

      if (response_choice == 1) { response_comment = "현재 한강 수온은 "+ hangang_river_temperature +" 입니다."; }
      else if (response_choice == 2) { response_comment = "셤기간 홧팅이에오! (ฅ•ω•ฅ)♡"; }
      else if (response_choice == 3) { response_comment = "오늘의 고생은 내일의 나에게..♡"; }
      else if (response_choice == 4) { response_comment = "이거 칠 시간에 공부나 하렴!"; }
      else if (response_choice == 5) { response_comment = "그 점수에 카톡 메세지가 눈에 들어옵니까, 휴먼!"; }
      else if (response_choice == 6) { response_comment = "시험기간 하루하루를 소중히 해오!"; }
      else if (response_choice == 7) { response_comment = "실제로 3학점 못넘으면.. 알죠??????????? (feat. 한국장학재단)"; }
      else if (response_choice == 8) { response_comment = "시험공부 하느라 지치죠?.. '.잔잔브금' 이라고 입력해보세요! "; }

      if (score < 4.5 || score == 4.5)
      {
         replier.reply(sender +" 님의 학점 전투력 측정 결과 "+ score.toFixed(1) +" 입니다.\n* "+ response_comment +"\n\n[Tip] "+ tip);
      }
      else if (score > 4.5) {
         score -= 1;
         replier.reply(sender +" 님의 학점 전투력 측정 결과 "+ score.toFixed(1) +" 입니다.\n* "+ response_comment +"\n\n[Tip] "+ tip);
      }
   }
   /* 이스터 에그 종료 */

   if((say_hi == 1 && msg.indexOf("안녕") != -1) || (say_hi == 1 && msg.indexOf("하이") != -1) || (say_hi == 1 && msg.indexOf("ㅎㅇ") != -1))
   {
      tip();

      replier.reply('안녕하세용! 여러분들의 도우미, 곰두리 봇이에오! 저를 깨우시려면 ".help" 라고 톡을 해보세요!^^\n\n[Tip] '+ tip);
   }

   if(msg == ".cmd" || msg == ".help" || msg == ".명령어" || msg == ".도움말" || msg == ".ㅁㄹㅇ" || msg == ".ㄷㅇㅁ" || msg == ".쟈비스" || msg == ".헤이쟈비스" || msg == ".자비스" || msg == ".헤이자비스" || msg == ".곰두리" || msg == ".ㄱㄷㄹ" || msg == "/곰두리" || msg == "/help" || msg == "/cmd" || msg == "/도움말")
   {
      tip();

      /* BOT 활용 TIP */
      replier.reply("명령어 안내 :\n1. 대학 생활 ⇒ .대학생활\n2. 일반 생활 ⇒ .생활\n3. 날씨 및 미세먼지 안내 ⇒ .날씨\n4. 교통(시외버스, 전철, ITX-청춘) 시간 조회 ⇒ .교통\n5. 곰두리봇 문의 ⇒ .곰두리문의\n6. 오픈채팅방 방문요청 ⇒ .방문요청\n7. 곰두리BOT API 안내 ⇒ .곰두리API\n8. 사자후(전체톡방 외침) 안내 ⇒ .사자후 \n\n* 명령어는 자음으로 입력해도 됩니다!\n(예 > .대학생활 = .ㄷㅎㅅㅎ)\n[Tip] "+ tip);

      if (msg.indexOf("/") != -1)
      {
         replier.reply("다음부터는 맨 앞에 / 이 아닌 . 으로 입력해주세요~!");
      }
   }

   if(msg == ".곰두리API")
   {
      replier.reply("곰두리 BOT API 안내 :\n곰두리 BOT에서 제공되는 유동적인 기능(롤 전적, 식단메뉴 등)을 개인이 개발해서 쉽게 사용할 수 있도록 API 센터를 운영하고 있습니다.\n\n1. 곰두리 BOT API 센터 : http://kakao-bot-api.herokuapp.com\n * 임시 테스트계정 : \n  student1947@naver.com / 123456\n* 회원가입 시 초대코드가 필요합니다! 초대코드 문의는 [.곰두리문의] 를 통해 개인연락 주세요!");
   }

   if(msg == ".생활" || msg == ".ㅅㅎ")
   {
      replier.reply("일반 생활 명령어 안내 :\n1. 자취인 랜덤 요리 레시피 ⇒ .레시피\n2. LOL 유저 전적 검색 ⇒ .롤전적 (유저닉네임)\n3. 강원대 주변 밥집 리스트 ⇒ .강원대밥집\n4. 강원대 주변 디저트가게 리스트 ⇒ .강원대디저트\n5. 강원대 주변 24시간 카페 ⇒ .강원대카페\n6. 잔잔한 랜덤 BGM ⇒ .잔잔브금\n7. 강대라이크 원룸 정보 ⇒ .원룸정보\n\n* 명령어는 자음으로 입력해도 됩니다!\n(예 > .레시피 = .ㄹㅅㅍ)");
   }

   if(msg == ".원룸정보" || msg == ".ㅇㄹㅈㅂ")
   {
      crawl = Utils.getWebText("http://kakao-bot-api.herokuapp.com/crawl_chun_notice/kangwonlike_room_trade/××××××××××××××××××××××××××××××","Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36",false,false);
      crawl_result = crawl.replace(/(<([^>]+)>)/g, "").trim();
      replier.reply("강대라이크 원룸 :\n원룸 정보는 10분 간격으로 갱신됩니다.\n"+ blank +"\n"+ crawl_result +"\n\n* 강대라이크 방정보 게시판 : http://bit.ly/2MlDr9t");
   }

   if(msg == ".강원대밥집" || msg == ".ㄱㅇㄷㅂㅈ")
   {
      replier.reply("강원대 밥집 소개 :\n★ : 5천원 미만 가격이 착한집\n\n[정문]\n- 고신 : 정문 삼거리에서 좌회전, 저렴한 고깃집\n- 대암 감자탕 : 정문 눈내린 빙수 옆, 순대국밥, 김치가 맛있는 집\n- ★ 먹방뷰 : 이마트24 편의점 옆, 분식/밥 판매점으로 1개를 시키면 2-3개가 나오는 집.\n- 얌얌 : 정문 도스마스와 국밥집 사이 골목, 컵밥 판매점\n- 진짜장 진짬뽕 : 정문 고신 근처, 중화요리 맛집\n\n[공대쪽문]\n- 구이락 : 천하고시원 맞은편, 무한 대패삼겹살이 가성대비 먹기 좋은게 대패삼겹살이 두툼함을 자랑\n- 동이만두 : 효제초 앞, 분식이 그리울 때 찾아가면 좋은 집으로, 분식 외에도 제육 등 백반메뉴도 판매\n- ★ 죽향 : 1인분을 시키면 곱빼기가 나오는 가성비가 매우 착한 중화요리 가게\n\n[후문]\n- 곱돌 : 이미 알 사람들은 아는 삼겹살 가게, 맛도 좋고 저렴한 고깃집!\n- 꿀돼지 : 가격이 착한 삼겹살 가게, 맛도 좋고 저렴한 고깃집!\n- 노란카레 : 일본식 카레 전문점으로, 잘 먹으면 밥/카레를 더 주시는 인심 +_+\n- ★ 라면데스요 : 국물맛이 좋은 일식 라면가게\n- 만석식당 : 직화불고기 정식 : 불고기+밑반찬+된장찌개+냉면 구성으로 유명한 집\n- 먹보네집 : 저가 가격으로 푸짐한 제육과 백반이 나오며, 무한리필이 가능한 공기밥! (현금/계좌이체 ONLY)\n- 미쎄스 부대찌개 : 부대찌개를 배불리 먹을 수 있고, 공기밥/라면사리/육수 리필 무제한\n- 소주신랑 보쌈부인 : 2인 이상이서 보쌈+막국수+김치찌개+공기밥을 배불리 먹을 수 있다! (현금/계좌이체 시 천원 할인)\n- 박가부대 : 부대찌개를 배불리 먹을 수 있고, 공기밥/라면사리/육수 리필 무제한\n- ★ 봉실스넥 : 저렴한 가격으로 백반을 즐길 수 있는 밥집\n- ★ 부리또인 : 다양한 맛의 부리또를 맛볼 수 있는 가게\n- ★ 신촌돈까스 : 모든 메뉴가 가격이 5천원 미만으로 동일하며, 가격 대비 배불리 먹을 수 있는 밥집 (현금/계좌이체 ONLY)\n- ★ 송탄햄버거 : 수제 햄버거 판매점, 햄버거가 빅맥보다 높아서 얼굴을 포기해야 한다.\n- 일미리 금계찜닭 : 달달한 찜닭집!\n- ★ 청춘보쌈 : 1인 식사가 가능한 보쌈집, 보쌈 사이즈(S/M/L)도 선택 가능!\n- 황제육 : 제육 정식만 파는 장인 정신 (feat. 집밥이 그립다면..)");
      replier.reply("밥집 추가 요청은 '.곰두리문의' 명령어를 통해 문의 주세요! (목록에 가게 추가비용은 일절 안받습니다.)");
   }

   if(msg == ".강원대디저트" || msg == ".ㄱㅇㄷㄷㅈㅌ")
   {
      replier.reply("강원대 디저트집 소개 :\n★ : 2천원 미만 가격이 착한집\n\n[정문]\n- 눈내린 빙수 : 가성비가 뛰어난 빙수집으로, 설빙과 비교할 수 없는 양과 메뉴 구성\n- TABLES : 정문 삼거리, 수제 빵으로 유명한 집으로 앙버터 강추!\n\n[후문]\n- ★ 명랑핫도그 : 일반 포장마차에서 파는 핫도그와는 다른 청결하면서도 주문이 들어오면 바로 튀겨주는 가성비 저렴한 핫도그집\n- ★ 아이스크림 와플 : 김家네 식당 바로 옆에 있는 조그맣한 가게로, 푸짐한 아이스크림을 얹혀주신다.\n- 타코 & 꼬치 : 사대부고 삼거리에 위치, 타코야끼를 파는 몇 안되는 가게\n- ★ BAKE PANG : 수제와플, 수제 케익, 마카롱을 파는 가게로, 프랜차이즈에 비해 저렴하다!\n- Ice Flower : 가성비가 뛰어난 빙수집으로, 설빙과 비교할 수 없는 양과 메뉴 구성\n- JUICY : 다양한 과일쥬스를 저렴하게 취급\n- THE VENTI : 다양한 과일쥬스를 저렴하게 취급");
      replier.reply("디저트 가게 추가 요청은 '.곰두리문의' 명령어를 통해 문의 주세요! (목록에 가게 추가비용은 일절 안받습니다.)");
   }

   if(msg == ".강원대카페" || msg == ".ㄱㅇㄷㅋㅍ")
   {
      replier.reply("강원대 주변 24시간 카페 :\n- 스터디 카페 위캔 : 강원 춘천시 효자동 616\n- 앤제리너스 : 강원 춘천시 효자동 628-4\n- 어라운드 스터디카페 : 후문 바로 앞");
      replier.reply("카페 추가 요청은 '.곰두리문의' 명령어를 통해 문의 주세요! (목록에 가게 추가비용은 일절 안받습니다.)");
   }
   
   if(msg == ".롤전적" || msg == ".ㄹㅈㅈ")
   {
      replier.reply("롤 전적 명령어 :\n열람을 희망하는 닉네임을 함께 작성해주시면 됩니다!\n\n[옳은 예] .롤전적 기엽지 혹은 .ㄹㅈㅈ 기엽지\n[나쁜 예] .ㄹㅈㅈ ㄱㅇㅈ\n\n* 이전 메뉴 ⇒ .생활");
   }

   if(msg.indexOf(".롤전적 ") != -1 || msg.indexOf(".ㄹㅈㅈ ") != -1)
   {
      tip();
      opggUserNickname = msg.substring(5,50);

      replier.reply('롤 전적을 조회중입니다..');
      
      lolUserInfoCrawl = org.jsoup.Jsoup.connect("http://kakao-bot-api.herokuapp.com/ranks/opgg_lol.json/"+ opggUserNickname +"/××××××××××××××××××××××××××××××").ignoreContentType(true).get().text();
      lolUserInfoResult = JSON.parse(lolUserInfoCrawl);
      
      lolCurrentMatchCrawl = org.jsoup.Jsoup.connect("http://kakao-bot-api.herokuapp.com/ranks/opgg_lol_current_game.json/"+ opggUserNickname +"/××××××××××××××××××××××××××××××").ignoreContentType(true).get().text();
      lolCurrentMatchResult = JSON.parse(lolCurrentMatchCrawl);

      if (lolCurrentMatchResult.current_play_with.team_blue[0].blue_1 == "" && lolCurrentMatchResult.current_play_with.team_red[0].red_1 == "") {
         replier.reply(lolUserInfoResult.original_user_nickname +" 님의 롤 전적 조회 결과 ["+ lolUserInfoResult.summoner_info[0].rank +" ("+ lolUserInfoResult.summoner_info[0].LP +")] 랭크 입니다.\n\n[실시간 플레이 상태유무]\n"+ lolUserInfoResult.original_user_nickname +" 님은 현재 플레이 중이 아닙니다.\n\n* 더 자세히 : https://www.op.gg/summoner/userName="+ lolUserInfoResult.lol_nickname_no_space +"\n\n[Tip] "+ tip);
      }
      else {
         var teamBlue = "";
         teamBlue = "1. " + lolCurrentMatchResult.current_play_with.team_blue[0].blue_1 + "\n2. " + lolCurrentMatchResult.current_play_with.team_blue[0].blue_2 + "\n3. " + lolCurrentMatchResult.current_play_with.team_blue[0].blue_3 + "\n4. " + lolCurrentMatchResult.current_play_with.team_blue[0].blue_4 + "\n5. " + lolCurrentMatchResult.current_play_with.team_blue[0].blue_5
         
         var teamRed = "";
         teamRed = "1. " + lolCurrentMatchResult.current_play_with.team_red[0].red_1 + "\n2. " + lolCurrentMatchResult.current_play_with.team_red[0].red_2 + "\n3. " + lolCurrentMatchResult.current_play_with.team_red[0].red_3 + "\n4. " + lolCurrentMatchResult.current_play_with.team_red[0].red_4 + "\n5. " + lolCurrentMatchResult.current_play_with.team_red[0].red_5
      
         replier.reply(lolUserInfoResult.original_user_nickname +" 님의 롤 전적 조회 결과 ["+ lolUserInfoResult.summoner_info[0].rank +" ("+ lolUserInfoResult.summoner_info[0].LP +")] 랭크 입니다.\n\n[실시간 플레이 中 : 함께하는 유저 전적]\n- "+ lolUserInfoResult.original_user_nickname +" 님과 실시간 플레이 유저 :\n[Team Blue]\n"+ teamBlue +"\n\n[Team Red]\n"+ teamRed +"\n\n* 더 자세히 : https://www.op.gg/summoner/userName="+ lolUserInfoResult.lol_nickname_no_space +"\n\n[Tip] "+ tip);
      }
   }

   if(msg == ".교통" || msg == ".ㄱㅌ")
   {
      replier.reply("교통 시간조회 안내 명령어 안내 :\n1. 시외버스 ⇒ https://m.bustago.or.kr:444/mobus/btmho/BTMHORN0001.do#\n2. 춘천 스마일 콜택시(개인) ⇒ 033-913-7777\n3. [교내 셔틀] 남춘천역 → 강원대  ⇒ .셔틀강원대\n4. [교내 셔틀] 강원대 → 남춘천역 ⇒ .셔틀남춘천역\n5. 실시간 전철 도착정보 ⇒ .전철\n6. ITX-청춘 [(출발역) → (도착역)] ⇒ .아텍스\n\n* 명령어는 자음으로 입력해도 됩니다!\n(예 > .아텍스 용산 남춘천 = .ㅇㅌㅅ 용산 남춘천)");
   }

   if(msg == ".전철" || msg == ".ㅈㅊ")
   {
      replier.reply('실시간 전철 도착정보 명령어 :\n실시간 전철 도착 조회에 있어 다음과 같이 입력해주세요!\n\n [옳은 예] .전철 범계 혹은 .ㅈㅊ 범계\n * "범계"역이 실시간 전철시간 조회 대상임\n [나쁜 예] .ㅈㅊ ㅂㄱ"\n\n* 이전 메뉴 ⇒ .교통');
   }

   if(msg.indexOf(".전철 ") != -1 || msg.indexOf(".ㅈㅊ ") != -1)
   {
      tip();
      station_name = msg.substring(4,30);

      replier.reply('전철 시간을 조회중입니다..');

      station_arrival_info = Utils.getWebText("http://kakao-bot-api.herokuapp.com/transfers/subway/"+ station_name +"/××××××××××××××××××××××××××××××", "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36",false,false);
      station_arrival_result = station_arrival_info.replace(/(<([^>]+)>)/g, "").trim();

      replier.reply(station_name +" 도착 정보 :\n"+ station_arrival_result +"\n\n[Tip] "+ tip);
   }

   if(msg == ".시외버스" || msg == ".ㅅㅇㅂㅅ")
   {
      tip();

      replier.reply("시외버스 시간조회 :\nhttps://m.bustago.or.kr:444/mobus/btmho/BTMHORN0001.do#\n\n[Tip] "+ tip);
   }

   if(msg == ".택시" || msg == ".ㅌㅅ" || msg == ".콜택시" || msg == ".ㅋㅌㅅ")
   {
      tip();

      replier.reply("춘천 스마일 콜택시(개인)\n033-913-7777\n\n[Tip] "+ tip);
   }

   if(msg == ".셔틀강원대" || msg == ".ㅅㅌㄱㅇㄷ")
   {
      tip();

      if (shuttle_bus_bool == true) {
         crawl = Utils.getWebText("http://kakao-bot-api.herokuapp.com/transfers/bus_station_to_campus/××××××××××××××××××××××××××××××","Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36",false,false);
         crawl_result = crawl.replace(/(<([^>]+)>)/g, "").trim();

         var week = new Array('일', '월', '화', '수', '목', '금', '토');

         replier.reply(week[d.getDay()] +"요일 남춘천역 → 강원대 버스시간표 :\n"+ crawl_result +"\n\n* 교내 셔틀 정보 : http://bit.ly/2XnBP48\n\n[Tip] "+ tip);
      } else {
         replier.reply("현재 기간에는 셔틀버스가 제공이 되지 않습니다.\n\n* 교내 셔틀 정보 : http://bit.ly/2XnBP48\n\n[Tip] "+ tip);
      }
   }

   if(msg == ".셔틀남춘천역" || msg == ".ㅅㅌㄴㅊㅊㅇ")
   {
      tip();

      if (shuttle_bus_bool == true) {
         crawl = Utils.getWebText("http://kakao-bot-api.herokuapp.com/transfers/bus_to_station/××××××××××××××××××××××××××××××","Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36",false,false);
         crawl_result = crawl.replace(/(<([^>]+)>)/g, "").trim();

         var week = new Array('일', '월', '화', '수', '목', '금', '토');

         replier.reply(week[d.getDay()] +"요일 강원대 → 남춘천역 버스시간표 :\n"+ crawl_result +"\n\n* 교내 셔틀 정보 : http://bit.ly/2XnBP48\n\n[Tip] "+ tip);
      } else {
         replier.reply("현재 기간에는 셔틀버스가 제공이 되지 않습니다.\n\n* 교내 셔틀 정보 : http://bit.ly/2XnBP48\n\n[Tip] "+ tip);
      }
   }

   if(msg == ".아텍스" || msg == ".ㅇㅌㅅ")
   {
      replier.reply('ITX-청춘 시간조회 명령어 :\n(출발역) → (도착역) 작성에 있어 다음과 같이 입력해주세요!\n\n[명령어 사용 규칙]\n.아텍스 (출발역) (도착역)\n\n[명령어 옳은 예]\n1) .아텍스 가평 남춘천\n2) .ㅇㅌㅅ 가평 남춘천\n * "가평"역이 출발역, "남춘천"역이 도착역\n\n[명령어 나쁜 예]\n.ㅇㅌㅅ ㄱㅍ ㄴㅊㅊ\n\n* 이전 메뉴 ⇒ .교통');
   }

   if(msg.indexOf(".아텍스 ") != -1 || msg.indexOf(".ㅇㅌㅅ ") != -1)
   {
      station_full = msg.substring(5,50);
      arr = station_full.split(" ");

      departure_name = arr[0];
      arrival_name = arr[1];
      
      replier.reply('ITX-청춘 시간을 조회중입니다..');
      
      crawl = org.jsoup.Jsoup.connect("http://kakao-bot-api.herokuapp.com/transfers/itx.json/"+ departure_name +"/"+ arrival_name +"/××××××××××××××××××××××××××××××").ignoreContentType(true).get().text();
      crawlResult = JSON.parse(crawl);
      
      var arr = [];
      for (var i = 0 ; i < crawlResult.itx_time.length ; i++)
      {
         arr.push([]);
         arr[i][0] = crawlResult.itx_time[i].time;
      }
      
      var trainTimeResult = "";
      for (var i = 0 ; i < crawlResult.itx_time.length ; i++)
      {
         trainTimeResult += arr[i][0] + "\n";
      }
      
      if (crawlResult.itx_time == "") { { replier.reply("["+ crawlResult.departure +"역 → "+ crawlResult.arrival +"역] 은 지원되지 않습니다.\n\n* ITX 열차조회 명령어 사용법 :\n(출발역) → (도착역)\n[명령어 예시]\n1) .아텍스 청량리 남춘천\n2) .ㅇㅌㅅ 청량리 남춘천"); } }
      else {
         replier.reply("["+ crawlResult.departure +"역 → "+ crawlResult.arrival +"역] ITX-청춘 시간표\n("+ d.getFullYear() + "년 "+ (d.getMonth() + 1) + "월 "+ d.getDate() +"일)\n\n"+ blank + trainTimeResult + "\n\n* 코레일 : http://www.letskorail.com\n* 이전 메뉴 ⇒ .교통"); 
      }
   }

   if(msg == ".대학생활" || msg == ".ㄷㅎㅅㅎ")
   {
      replier.reply("대학 생활 명령어 안내 :\n1. 월간 학사일정 ⇒ .학사일정\n2. 대학 공지사항(종합) ⇒ .대학소식\n3. 학식 메뉴 안내 ⇒ .학식메뉴\n4. 복사실 안내 ⇒ .복사실\n5. 교내 식당 위치 ⇒ .교내식당\n6. 교내 카페 위치 ⇒ .교내카페\n7. 학생증 안내 ⇒ .학생증\n8. 교내 와이파이 암호 ⇒ .와이파이\n9. FTP 자료실 안내 ⇒ .자료실\n10. 교내 의료시설 안내 ⇒ .의료시설\n11. 무인 민원(학교서류 및 등본 등 민원서류) ⇒ .무인민원\n12. 교내 ATM 위치 ⇒ .현금입출금\n13. 도서관 안내 ⇒ .도서관\n14. 기숙사 안내 ⇒ .기숙사\n15. 천지관 편의시설 안내 ⇒\n.천지관시설\n16. 학생 복지 안내 ⇒ .학생복지\n\n* 명령어는 자음으로 입력해도 됩니다!\n(예 > .학사일정 = .ㅎㅅㅇㅈ)");
   }

   if(msg == ".대학소식" || msg == ".ㄷㅎㅅㅅ")
   {
      replier.reply("대학 소식 명령어 안내 :\n1. 대학 공지사항 ⇒ .대학공지\n2. 대학 학사공지 ⇒ .학사공지\n3. 대학 장학안내 ⇒ .대학장학\n4. 총학생회 공지 ⇒ .총학공지\n5. 기숙사 공지 ⇒ .기숙사공지\n\n* 명령어는 자음으로 입력해도 됩니다!\n(예 > .대학장학 = .ㄷㅎㅈㅎ)");
   }

   if(msg == ".학식메뉴" || msg == ".ㅎㅅㅁㄴ" || msg == ".학식" || msg == ".ㅎㅅ" || msg == ".ㄱㅅㅅㅁㄴ" || msg == ".ㄱㅅㅅㅁㄴ")
   {
      replier.reply("학식 메뉴 안내 :\n 1. 재정생활관 ⇒ .재정메뉴\n 2. 새롬관(구 BTL) ⇒ .새롬관메뉴 혹은 .구티엘메뉴\n 3. 이룸관(신 BTL) ⇒ .이룸관메뉴 혹은 .뉴티엘메뉴\n 4. 백록관 ⇒ .백록관메뉴\n 5. 천지관 ⇒ .천지관메뉴\n 6. 삼척/도계 학식메뉴 ⇒ .삼도학식\n\n[가격] 학식(백록관, 천지관) 평균가격 : 3500원, 기숙사 식권 값 : 4200원\n* 재정생활관 식당, 백록관, 천지관은 주말 미운영\n\n* 명령어는 자음으로 입력해도 됩니다!\n(예 > .재정메뉴 = .ㅈㅈㅁㄴ)");
   }
   
   if(msg == ".삼도메뉴" || msg == ".ㅅㄷㅁㄴ" )
   {
      replier.reply("삼척/도계 캠퍼스 메뉴 안내 :\n 1. 삼척/도계 학식메뉴 ⇒ .삼도학식\n 2. 월간 학사일정 ⇒ .학사일정\n 3. 대학 공지사항(종합) ⇒ .대학소식\n 4. 교내 와이파이 암호 ⇒ .와이파이\n 5. FTP 자료실 안내 ⇒ .자료실\n\n* 명령어는 자음으로 입력해도 됩니다!\n(예 > .삼도학식 = .ㅅㄷㅎㅅ)");
   }
   
   if(msg == ".삼도학식" || msg == ".ㅅㄷㅎㅅ" )
   {
      replier.reply("삼척/도계 캠퍼스 학식 메뉴 :\n 1. 삼척 5공학관 ⇒ .공학메뉴\n 2. 삼척 기숙사 ⇒ .삼척기숙사메뉴\n 3. 도계 학생회관/교직원 ⇒ .도계메뉴\n 4. 도계 기숙사 ⇒ .도계기숙사메뉴\n\n* 학식 검증도움 Special Thanks to.\n  [도계] BLT버거킹 님\n  [삼척] 두타 투썸 플레이스 님\n\n* 명령어는 자음으로 입력해도 됩니다!\n(예 > .도계메뉴 = .ㄷㄱㅁㄴ)");
   }
   
   if(msg == ".도계메뉴" || msg == ".ㄷㄱㅁㄴ")
   {
      crawl = org.jsoup.Jsoup.connect("http://kakao-bot-api.herokuapp.com/crawl_sam_do_meals/dogye_meal_normal.json/××××××××××××××××××××××××××××××").ignoreContentType(true).get().text();
      crawlResult = JSON.parse(crawl);
      
      var arr = [];
      for (var i = 0 ; i < crawlResult.length ; i++)
      {
         arr.push([]);
         arr[i][0] = crawlResult[i].title;
         arr[i][1] = crawlResult[i].meal_date;
         arr[i][2] = crawlResult[i].kind_of_meal;
         arr[i][3] = crawlResult[i].menu;
         arr[i][4] = crawlResult[i].meal_time;
      }
      
      if (crawlResult.length == 0) { replier.reply("현재 자료 최신화 중입니다.. 잠시후에 다시 시도해주세요."); } 
      else { replier.reply(arr[0][0] + " (" + arr[0][1] + " " + arr[0][2] + ") : " + arr[0][3] + "\n\n" + arr[1][0] + " (" + arr[1][1] + " " + arr[1][2] + ") : " + arr[1][3] + "\n\n" + arr[2][0] + " (" + arr[2][1] + " " + arr[2][2] + ") : " + arr[2][3] + blank + "\n\n* " + arr[2][2] + "* 식사 시간 : " + arr[2][4] + "\n* 덮밥 및 백반 : 4000원\n* [Tip] 학식메뉴를 잔반없이 다 먹을 시 잔반쿠폰 1장을 받게 되는데, 일정 갯수를 모을 시 교내 편의시설을 이용할 수 있는 1000원 쿠폰으로 페이백 됩니다!\n\n* 이전 메뉴 ⇒ .삼도메뉴\n* 검증도움 Special Thanks to. BLT버거킹 님"); }
   }
   
   if(msg == ".도계기숙사메뉴" || msg == ".ㄷㄱㄱㅅㅅㅁㄴ" || msg == ".도계생활관메뉴" || msg == ".ㄷㄱㅅㅎㄱㅁㄴ")
   {
      crawl = org.jsoup.Jsoup.connect("http://kakao-bot-api.herokuapp.com/crawl_sam_do_meals/dogye_meal_dormitory.json/××××××××××××××××××××××××××××××").ignoreContentType(true).get().text();
      crawlResult = JSON.parse(crawl);

      if (crawlResult == null) { replier.reply("현재 자료 최신화 중입니다.. 잠시후에 다시 시도해주세요."); }
      else { replier.reply(crawlResult.title + " (" + crawlResult.meal_date + " " + crawlResult.kind_of_meal + ")" + " : " + crawlResult.menu + "\n\n* "+ crawlResult.kind_of_meal +" 식사 시간 :\n" + crawlResult.meal_time + "\n\n* 이전 메뉴 ⇒ .삼도메뉴\n* 검증도움 Special Thanks to. BLT버거킹 님"); }
   }
   
   if(msg == ".공학메뉴" || msg == ".ㄱㅎㅁㄴ" || msg == ".공학관메뉴" || msg == ".ㄱㅎㄱㅁㄴ")
   {
      crawl = org.jsoup.Jsoup.connect("http://kakao-bot-api.herokuapp.com/crawl_sam_do_meals/samcheock_meal_normal.json/××××××××××××××××××××××××××××××").ignoreContentType(true).get().text();
      crawlResult = JSON.parse(crawl);
      
      var arr = [];
      for (var i = 0 ; i < crawlResult.length ; i++)
      {
         arr.push([]);
         arr[i][0] = crawlResult[i].title;
         arr[i][1] = crawlResult[i].meal_date;
         arr[i][2] = crawlResult[i].kind_of_meal;
         arr[i][3] = crawlResult[i].menu;
         arr[i][4] = crawlResult[i].meal_time;
      }
      
      if (crawlResult.length == 0) { replier.reply("현재 자료 최신화 중입니다.. 잠시후에 다시 시도해주세요."); }
      else { replier.reply(arr[0][0] + "  (" + arr[0][1] + " " + arr[0][2] + ") : " + arr[0][3] + "\n\n" + arr[1][0] + "  (" + arr[1][1] + " " + arr[1][2] + ") : " + arr[1][3] + "\n\n" + arr[2][0] + "  (" + arr[2][1] + " " + arr[2][2] + ") : " + arr[2][3] + blank + "\n\n* " + arr[2][2] + " 식사 시간 : " + arr[2][4] + "\n\n* 이전 메뉴 ⇒ .삼도메뉴\n* 검증도움 Special Thanks to. 두타 투썸 플레이스 님"); }
   }
   
   if(msg == ".삼척기숙사메뉴" || msg == ".ㅅㅊㄱㅅㅅㅁㄴ" || msg == ".삼척생활관메뉴" || msg == ".ㅅㅊㅅㅎㄱㅁㄴ")
   {
      crawl = org.jsoup.Jsoup.connect("http://kakao-bot-api.herokuapp.com/crawl_sam_do_meals/samcheock_meal_dormitory.json/××××××××××××××××××××××××××××××").ignoreContentType(true).get().text();
      crawlResult = JSON.parse(crawl);

      if (crawlResult == null) { replier.reply("현재 자료 최신화 중입니다.. 잠시후에 다시 시도해주세요."); }
      else { replier.reply(crawlResult.title + " (" + crawlResult.meal_date + " " + crawlResult.kind_of_meal + ")" + " : " + crawlResult.menu + "\n\n* "+ crawlResult.kind_of_meal +" 식사 시간 : " +  crawlResult.meal_time + "\n\n* 이전 메뉴 ⇒ .삼도메뉴\n* 검증도움 Special Thanks to. 두타 투썸 플레이스 님"); }
   }

   if(msg == ".복사실" || msg == ".ㅂㅅㅅ" )
   {
      replier.reply("복사실 안내 :\n1. 제본 신청, 복사 등이 가능한 교내 복사실 - 천지관, 60주년 기념관 2층 CU 옆, 의학 1호관\n * 평일 운영 시간 : 08:30 ~ 18:00(의대는 확인 요망)\n * 60주년 기념관 복사실은 현금 및 계좌이체만 가능\n * 천지관 복사실은 토요일에도 운영 (08:30 ~ 13:00)\n * 토익 성적표 등 횟수가 한정된 복사는 교내 복사실에서 하지마세요.\n2. 무인 복사시설 - BTL 기숙사, 재정생활관 CU\n3. 복사 시 복사카드 필요 (구매 : 만원)\n * 복사카드는 천지관, 60주년 기념관에 있는 복사실에서 구매 가능.\n4. 복사실이 닫혀있고, 급할 시 [공대쪽문] CU, [자대쪽문] CU, [후문] 존앤존 PC방 이용 요망.\n\n* 이전 메뉴 ⇒ .대학생활");
   }

   if(msg == ".교내식당" || msg == ".ㄱㄴㅅㄷ")
   {
      replier.reply("교내 식당 위치 :\n1. 백록관 및 석재 신소재센터 : 정문 부근\n * 정문, 공대, 인문대, 사범대(일부), 사회과학대, 로스쿨, 60주년기념관 학생에게 있어 가까움.\n2. 천지관 : 후문 부근\n * 자연과학대, 사범대(일부), 농대, 경영대 학생에게 있어 가까움.\n3. 오늘의 학식메뉴 ⇒ .학식메뉴\n\n* 이전 메뉴 ⇒ .대학생활");
   }

   if(msg == ".교내카페" || msg == ".ㄱㄴㅋㅍ")
   {
      replier.reply("교내 카페 위치 :\n보듬관, 60주년 기념관, 글로벌경영관, 석재 신소재센터 5층, 천지관 2층, 농생대 1호관(도서관 후문), 새롬관 BTL(남), 이룸관 BTL 1층(원리터)\n\n[카페마운틴] 08시 30분 ~ 19시 (토요일은 10시 ~ 17시)\n * 방학 : 09시 ~\n[원리터(이룸관 BTL)] 09시 ~ 00시\n[글로벌경영 카페] 평일 08:30(방학 09:00) ~ 19:00 / 토요일 10:00 ~ 17:00\n\n* 이전 메뉴 ⇒ .대학생활");
   }

   if(msg == ".학생증" || msg == ".ㅎㅅㅈ")
   {
      replier.reply("학생증 안내(춘천) :\n1. 학생증은 다음과 같은 용도로 쓰입니다.\n 1) 교내 건물 출입증(교내 모든 건물은 평일 오후 11시 30분 쯤 이후, 주말에 자동으로 잠깁니다.)\n 2) 도서관 책 대출, 열람실 예약 등(학생증이 없을 시 신분증으로 대체 가능)\n 3) 학생 인증을 통한 학교 주변 음식점 할인\n 4) 신한체크 S20 혜택과 동일\n2. 학생증 최초발급 신청 : http://bit.ly/2UyEzKL\n * 해당 페이지에서 서류 작성 후, '강원대 내 은행(태백관)' 내방 방문 필수 (신분증 지참)\n * 재발급 시에는 홈페이지에서 서류작성 과정 생략, 바로 은행 내방방문\n3. 건물 출입권한 획득 : 학과 건물 출입문 옆에 있는 인터폰 연락\n\n* 이전 메뉴 ⇒ .대학생활");
   }

   if(msg == ".와이파이" || msg == ".ㅇㅇㅍㅇ")
   {
      replier.reply("교내 와이파이 암호 안내 :\n1. KNU_WLAN_Open : beyondme\n2. KNU_WLAN_Secure\n 1) 스마트폰 : ID 및 암호는 학번 및 포탈암호\n 2) 노트북 등 : Cuvic 프로그램 설치 (http://bit.ly/2G1STU1)\n3. U+ Zone : lguplus100\n\n* 이전 메뉴 ⇒ .대학생활");
   }

   if(msg == ".자료실" || msg == ".ㅈㄹㅅ")
   {
      replier.reply("FTP 안내 :\n1. FTP 페이지 : ftp://ftp.kangwon.ac.kr (주소에 ftp:// 붙여주세요!)\n2. FTP 자료실에서는 Windows10 정품, 한글, MATLAB 등 프로그램 다운로드가 가능합니다.\n3. 소프트웨어 정품키는 http://bit.ly/2UiEs6I 사이트를 참고바랍니다.\n4. FTP 접속은 교내 인터넷/와이파이를 통해서만 접속 가능합니다.\n * 기숙사, 보듬관 등 일부 건물 제외\n\n* 이전 메뉴 ⇒ .대학생활");
   }

   if(msg == ".의료시설" || msg == ".ㅇㄹㅅㅅ" || msg == ".보건실" || msg == ".의료" || msg == ".양호실" || msg == ".보건")
   {
      replier.reply("교내 의료시설 안내 :\n1. 보건소 및 성폭력 상담은 나래관 건물에서 해결이 됩니다.\n * 나래관 위치 : 경영대(강원대 후문) 근방\n2. 두통, 감기약 등 기본적인 약 처방이 가능합니다.\n3. 강원대 학생이 강원대학교에서 진료 시 비급여에 한해 15% 진료비 할인이 됩니다.\n4. 더 자세한 소개 : http://bit.ly/2OOXxaT\n\n* 이전 메뉴 ⇒ .대학생활");
   }

   if(msg == ".무인민원" || msg == ".ㅁㅇㅁㅇ")
   {
      replier.reply("무인민원 안내 :\n1. 학교 서류 발급 : 60주년 기념관 2층, 나래관\n2. 학교 서류 및 정부 무인민원 : 나래관\n * 신분증 지참 必\n\n[학교 서류] 성적, 재학, 졸업예정, 학적부, 교육비납입, 입학성적, 장학금수혜, 병역의무자 국외여행추천서, 장학추천서, 수료, 봉사활동��수\n[정부 무인민원] 주민등록등본(초본), 지적/토지/건축, 차량, 보건복지, 농지원부(관외 발급불가), 병적증명서, 지방세 세목별 과세증명서, 어선원부, 교육제증명, 국세증명, 건강보험\n\n* 이전 메뉴 ⇒ .대학생활");
   }

   if(msg == ".현금입출금" || msg == ".ㅎㄱㅇㅊㄱ" || msg == ".ATM" || msg == ".atm")
   {
      replier.reply("교내 ATM기 위치 :\n1. 공대 쪽문 : 신한은행 (07시 ~ 23시 30분)\n2. 백록관 : 신한은행 및 농협\n3. 천지관 : 신한은행, 우체국, 농협(2층)\n4. 태백관 : 신한은행\n * 학생증제작, 은행업무(계좌신설, 카드발급 등) 응대\n5. 나래관 : 신한은행, 농협\n6. 재정생활관 CU 및 새롬관 BTL(남) : 신한은행\n7. 공3호관 및 의생대 4층 : 신한은행\n8. 중앙도서관 후문 : 신한은행\n\n* 이전 메뉴 ⇒ .대학생활");
   }

   if(msg == ".도서관" || msg == ".ㄷㅅㄱ")
   {
      replier.reply("도서관 안내 :\n1. 도서관은 열람실 운영시간 기준 [동계(11월 ~ 2월 말)] 06:00 ~ 24:00, [하계(3월 ~ 10월 말)] 05:00 ~ 24:00\n * 중간/기말고사 1주일 전에는 2주간 02:00 연장운영\n * 휴관일 : 국경일, 개교기념일(6월 14일)\n2. 학생증이 없어도 도서 대여 및 열람실 예약 가능\n * 단, 신분증 지참 필수\n3. 별관 제1열람실(집현관) : 24시간 운영\n4. 도서관 홈페이지에서 논문 자료 열람이 무료로 가능합니다. (RISS, DBPIA 등 제공)\n5. 실시간 열람실 좌석 : http://bit.ly/2OOLMB3\n\n* 이전 메뉴 ⇒ .대학생활");
   }

   if(msg == ".기숙사" || msg == ".ㄱㅅㅅ")
   {
      replier.reply("기숙사 안내 :\n1. 기숙사 홈페이지 : http://bit.ly/2uOb4pY\n2. 기숙사 입사조건 : 봉사활동 15회 AND 30시간\n * 15회 + 30시간이 봉사 만점임.\n * 봉사활동 점수 효력은 1년동안 유지\n * 봉사 신청(수강신청 기간) : http://bit.ly/2G3Fk6J\n * 평가요소 : 직전학기 까지의 평균성적+봉사활동 시간+봉사활동 횟수+(거리가산점)\n3. 국제 생활관\n * 후문 쪽에 위치\n * 기숙사 식당 없음.\n * 기숙사 내 영어수업 의무참여(학습비 청구)\n4. 선호도 평가 : 이룸관 >= 새롬관 > 국제생활관 > (그 외 기숙사)\n5. 기숙사 통금시간 : 오전 01시 ~ 오전 05시\n6. 다음 전형에 해당 시 기숙사 입사 우선순위가 주어진다 :\n 1) 신입생(1학년 1학기)\n 2) 국가유공자 자녀\n 3) 기초생활 수급자\n 4) 외국인 유학생\n 5) 대학원생\n 6) 형제/자매/남매 중 한 명이라도 기숙사 합격 시\n * 규정 참고 : http://bit.ly/2GozJYw\n7. 1학기에 기숙사 합격 시 2학기 때에는 봉사/성적 등 점수 반영 없이 연장신청을 통해 추가 입사 가능.\n8. 퇴계관 등 일부 기숙사 도어락 음소거법 : http://bit.ly/2WSKubh\n\n* 이전 메뉴 ⇒ .대학생활");
   }

   if(msg == ".천지관시설" || msg == ".ㅊㅈㄱㅅㅅ")
   {
      replier.reply("천지관 시설 안내 :\n1층 : 학생식당, 편의점(CU), 서점, 문방구. 안경점, 우체국 택배, 신한은행 및 우체국 ATM, 헌혈의집\n2층 : 농협 ATM, 공동열람실, 맘스터치, 카페마운틴, 복사실, 실험복 등 취급가게, 미용실, 사진관\n\n* 이전 메뉴 ⇒ .대학생활");
   }

   if(msg == ".학생복지" || msg == ".ㅎㅅㅂㅈ" || msg == ".대학복지" || msg == ".ㄷㅎㅂㅈ")
   {
      replier.reply("대학 복지 안내 :\n1. 강원대 재학생은 웹메일 인증을 통해 무료로 배포되는 소프트웨어를 다운로드 받아보실 수 있습니다.\n * 참고1 : www.damda.info/univs/3\n * 참고2 ⇒ .자료실 명령어로 확인\n2. 나래관에서 무료 정장대여를 받아보실 수 있습니다.\n * 정장대여 시 신분증 지참, 증명사진/기업면접 등 사유 필요\n3. 강원대 주변 상권에서 강원대 학생임을 증명하면 학생 할인을 받아보실 수 있습니다.\n * 참고 : http://bit.ly/2HTGRM5\n4. 강원대 병원에서 진료 할인을 받아보실 수 있습니다.\n * 참고 ⇒ .의료시설 명령어로 확인\n5. 간단한 감기약 등 에 대해서는 나래관에서 무료로 받아갈 수 있습니다.\n\n* 이전 메뉴 ⇒ .대학생활");
   }

   if(msg == ".날씨" || msg == ".ㄴㅆ")
   {
      replier.reply("날씨/미세먼지 명령어 안내 :\n1. 국내 지역날씨 ⇒ .기상\n2. 미세먼지 측정결과 ⇒ .미세먼지 (지역)\n3. 미세먼지 지원 지역 확인 :\n * 강원도 ⇒ .미세먼지강원\n * 서울 ⇒ .미세먼지서울\n * 경기도 ⇒ .미세먼지경기\n * 광주 ⇒ .미세먼지광주\n * 제주 ⇒ .미세먼지제주\n * 인천 ⇒ .미세먼지인천\n\n* 미세먼지 명령어 작성에 있어 다음과 같이 입력해주세요!\n [옳은 예] .ㅁㅅㅁㅈ 춘천 혹은 .미세먼지 춘천\n [나쁜 예] .ㅁㅅㅁㅈ ㅊㅊ");
   }
   
   if(msg == ".기상" || msg == ".ㄱㅅ")
   {
      replier.reply("날씨 기상상태 명령어 :\n날씨 조회를 희망하는 지역을 함께 작성해주시면 됩니다!\n\n[옳은 예] .기상 춘천 혹은 .ㄱㅅ 춘천\n[나쁜 예] .ㄱㅅ ㅊㅊ\n\n* 이전 메뉴 ⇒ .날씨");
   }

   if(msg.indexOf(".기상 ") != -1 || msg.indexOf(".ㄱㅅ ") != -1)
   {
      tip();
      location = msg.substring(4,50);

      replier.reply(location +' 지역 날씨를 조회중입니다..');

      weather = Utils.getWebText("http://kakao-bot-api.herokuapp.com/crawl_weathers/weather/"+ location +"/××××××××××××××××××××××××××××××","Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36",false,false);
      weather_result = weather.replace(/(<([^>]+)>)/g, "").trim();

      if (weather_result == "") { replier.reply(location +" 지역 기상 검색결과가 안나옵니다.\n올바르게 검색해주세요.\n\n[Tip] "+ tip); }
      else { replier.reply(weather_result +"\n더 자세히 : https://search.naver.com/search.naver?query="+ location +"+날씨\n\n[Tip] "+ tip); }
   }

   if(msg == ".곰두리문의" || msg == ".ㄱㄷㄹㅁㅇ" || msg == ".방문요청" || msg == ".ㅂㅁㅇㅊ" || msg == ".나가" || msg == ".퇴장" || msg == ".강퇴" || msg == ".강티" || msg == ".꺼져" || msg == ".ㄲㅈ" || msg == ".곰두리나가" || msg == ".곰두리 나가" || msg == ".곰두리퇴장" || msg == ".곰두리 퇴장" || msg == ".곰두리강퇴" || msg == ".곰두리 강퇴" || msg == ".곰두리꺼져" || msg == ".곰두리 꺼져")
   {
      replier.reply("[문의] http://bit.ly/2KhaR90\n\n* 오픈채팅방 방문요청, 봇 퇴장요청, 버그 및 잘못된 정보 제보, 그 외 의견이 있으시면 언제든 연락주세요!^^ \n* 항상 BOT을 써주셔서 감사해오!");
   }

   if(msg == ".봇제작자" || msg == ".ㅂㅈㅈㅈ")
   {
      replier.reply("해당 BOT은 김철민 이 만들었습니다 :)\n* 항상 BOT을 써주셔서 감사해오!\n\n* Feat. 멋쟁이 사자처럼 @ 강원대학교");
   }

   if(msg == ".레시피" || msg == ".ㄹㅅㅍ")
   {
      bot_activity_count = bot_activity_count+1;
         
      crawl = org.jsoup.Jsoup.connect("http://kakao-bot-api.herokuapp.com/recipes/index/××××××××××××××××××××××××××××××").ignoreContentType(true).get().text();
      crawl_result = crawl.replace(/(<([^>]+)>)/g, "").trim();
      replier.reply(crawl_result);
   }

   if(msg == ".대학공지" || msg == ".ㄷㅎㄱㅈ")
   {
      crawl = org.jsoup.Jsoup.connect("http://kakao-bot-api.herokuapp.com/crawl_chun_notice/notice.json/××××××××××××××××××××××××××××××").ignoreContentType(true).get().text();
      crawlResult = JSON.parse(crawl);
      
      var arr = [];
      for (var i = 0 ; i < crawlResult.length ; i++)
      {
         arr.push([]);
         arr[i][0] = crawlResult[i].campus;
         arr[i][1] = crawlResult[i].title;
         arr[i][2] = crawlResult[i].date;
      }
      
      var noticeResult = "";
      for (var i = 0 ; i < crawlResult.length ; i++) { noticeResult += "[" + arr[i][0] + "] " + arr[i][1] + " ㆍ " + arr[i][2] + "\n"; }

      if (crawlResult.length == 0) { replier.reply("현재 자료 최신화 중입니다.. 잠시후에 다시 시도해주세요."); }
      else { replier.reply("강원대학교 대학 공지사항 :\n"+ blank +"\n"+ noticeResult +"\n\n* 강원대 종합공지 게시판 : http://bit.ly/2FKPngJ"); }
   }

   if(msg == ".대학장학" || msg == ".ㄷㅎㅈㅎ" || msg == ".장학금" || msg == ".ㅈㅎㄱ" || msg == ".장학공지" || msg == ".ㅈㅎㄱㅈ")
   {
      crawl = org.jsoup.Jsoup.connect("http://kakao-bot-api.herokuapp.com/crawl_chun_notice/campus_scholarship.json/××××××××××××××××××××××××××××××").ignoreContentType(true).get().text();
      crawlResult = JSON.parse(crawl);
      
      var arr = [];
      for (var i = 0 ; i < crawlResult.length ; i++)
      {
         arr.push([]);
         arr[i][0] = crawlResult[i].campus;
         arr[i][1] = crawlResult[i].title;
         arr[i][2] = crawlResult[i].date;
      }
      
      var noticeResult = "";
      for (var i = 0 ; i < crawlResult.length ; i++) { noticeResult += "[" + arr[i][0] + "] " + arr[i][1] + " ㆍ " + arr[i][2] + "\n"; }

      if (crawlResult.length == 0) { replier.reply("현재 자료 최신화 중입니다.. 잠시후에 다시 시도해주세요."); }
      else { replier.reply("강원대학교 장학 공지사항 :\n"+ blank +"\n"+ noticeResult +"\n\n* 강원대 장학안내 게시판 : http://bit.ly/2U6WVD4"); }
   }

   if(msg == ".학사공지" || msg == ".ㅎㅅㄱㅈ")
   {
      crawl = org.jsoup.Jsoup.connect("http://kakao-bot-api.herokuapp.com/crawl_chun_notice/campus_notice.json/××××××××××××××××××××××××××××××").ignoreContentType(true).get().text();
      crawlResult = JSON.parse(crawl);
      
      var arr = [];
      for (var i = 0 ; i < crawlResult.length ; i++)
      {
         arr.push([]);
         arr[i][0] = crawlResult[i].campus;
         arr[i][1] = crawlResult[i].title;
         arr[i][2] = crawlResult[i].date;
      }
      
      var noticeResult = "";
      for (var i = 0 ; i < crawlResult.length ; i++) { noticeResult += "[" + arr[i][0] + "] " + arr[i][1] + " ㆍ " + arr[i][2] + "\n"; }

      if (crawlResult.length == 0) { replier.reply("현재 자료 최신화 중입니다.. 잠시후에 다시 시도해주세요."); }
      else { replier.reply("강원대학교 학사 공지사항 :\n"+ blank +"\n"+ noticeResult +"\n\n* 강원대 학사공지 게시판 : http://bit.ly/2vVPakT"); }
   }

   if(msg == ".학사일정" || msg == ".ㅎㅅㅇㅈ")
   {
      crawl = org.jsoup.Jsoup.connect("http://kakao-bot-api.herokuapp.com/crawl_chun_notice/campus_monthly_schedule.json/××××××××××××××××××××××××××××××").ignoreContentType(true).get().text();
      crawlResult = JSON.parse(crawl);
      
      var arr = [];
      for (var i = 0 ; i < crawlResult.data.length ; i++)
      {
         arr.push([]);
         arr[i][0] = crawlResult.data[i].title;
         arr[i][1] = crawlResult.data[i].date;
      }
      
      var noticeResult = "";
      for (var i = 0 ; i < crawlResult.data.length ; i++) { noticeResult += i+1 + ". " + arr[i][0] + " : " + arr[i][1] + "\n"; }
      
      if (crawlResult.data.length == 0) { replier.reply("현재 자료 최신화 중입니다.. 잠시후에 다시 시도해주세요."); }
      else { replier.reply("- "+ year +"년 "+ crawlResult.month +" 학사 일정 -\n"+ noticeResult +"\n\n* 학사일정 참고 : http://bit.ly/2GgI5Tn"); }
   }

   if(msg == ".총학공지" || msg == ".ㅊㅎㄱㅈ" || msg == ".총학생회" || msg == ".ㅊㅎㅅㅎ")
   {
      crawl = org.jsoup.Jsoup.connect("http://kakao-bot-api.herokuapp.com/crawl_chun_notice/campus_student_header.json/××××××××××××××××××××××××××××××").ignoreContentType(true).get().text();
      crawlResult = JSON.parse(crawl);
      
      var arr = [];
      for (var i = 0 ; i < crawlResult.length ; i++)
      {
         arr.push([]);
         arr[i][0] = crawlResult[i].campus;
         arr[i][1] = crawlResult[i].title;
         arr[i][2] = crawlResult[i].date;
      }
      
      var noticeResult = "";
      for (var i = 0 ; i < crawlResult.length ; i++) { noticeResult += "[" + arr[i][0] + "] " + arr[i][1] + " ㆍ " + arr[i][2] + "\n"; }

      if (crawlResult.length == 0) { replier.reply("현재 자료 최신화 중입니다.. 잠시후에 다시 시도해주세요."); }
      else { replier.reply("총학생회("+ arr[0][0] +") 공지사항 :\n"+ blank +"\n"+ noticeResult +"\n\n* 강원대학교 총학생회 : http://bit.ly/2ZEU1UR"); }
   }

   if(msg == ".기숙사공지" || msg == ".ㄱㅅㅅㄱㅈ")
   {
      crawl = org.jsoup.Jsoup.connect("http://kakao-bot-api.herokuapp.com/crawl_chun_notice/dorm_chun_notice.json/××××××××××××××××××××××××××××××").ignoreContentType(true).get().text();
      crawlResult = JSON.parse(crawl);
      
      var arr = [];
      for (var i = 0 ; i < crawlResult.length ; i++)
      {
         arr.push([]);
         arr[i][0] = crawlResult[i].campus;
         arr[i][1] = crawlResult[i].title;
         arr[i][2] = crawlResult[i].date;
      }
      
      var noticeResult = "";
      for (var i = 0 ; i < crawlResult.length ; i++) { noticeResult += "[" + arr[i][0] + "] " + arr[i][1] + " ㆍ " + arr[i][2] + "\n"; }
      
      if (crawlResult.length == 0) { replier.reply("현재 자료 최신화 중입니다.. 잠시후에 다시 시도해주세요."); }
      else { replier.reply("기숙사("+ arr[0][0] +") 공지사항 :\n"+ blank +"\n"+ noticeResult +"\n\n* 강원대학교 기숙사(춘천) : http://bit.ly/2KyPLA8"); }
   }

   if(msg == ".재정메뉴" || msg == ".ㅈㅈㅁㄴ" || msg == ".재정생활관메뉴" || msg == ".ㅈㅈㅅㅎㄱㅁㄴ")
   {
      tip();

      crawl = org.jsoup.Jsoup.connect("http://kakao-bot-api.herokuapp.com/crawl_chun_meals/dor_normal.json/××××××××××××××××××××××××××××××").ignoreContentType(true).get().text();
      crawlResult = JSON.parse(crawl);

      if (crawlResult == null) { replier.reply("현재 자료 최신화 중입니다.. 잠시후에 다시 시도해주세요."); }
      else { replier.reply(crawlResult.title + " (" + crawlResult.meal_date + " " + crawlResult.kind_of_meal + ")" + " : " + crawlResult.menu + "\n\n* "+ crawlResult.kind_of_meal +" 식사 시간 : " +  crawlResult.meal_time + "\n\n* 식권 : 4200원\n* 이전 메뉴 ⇒ .학식메뉴\n\n[Tip] "+ tip); }
   }

   if(msg == ".새롬관메뉴" || msg == ".구티엘메뉴" || msg == ".ㅅㄹㄱㅁㄴ" || msg == ".ㄱㅌㅇㅁㄴ")
   {
      tip();
      
      crawl = org.jsoup.Jsoup.connect("http://kakao-bot-api.herokuapp.com/crawl_chun_meals/old_btl.json/××××××××××××××××××××××××××××××").ignoreContentType(true).get().text();
      crawlResult = JSON.parse(crawl);

      if (crawlResult == null) { replier.reply("현재 자료 최신화 중입니다.. 잠시후에 다시 시도해주세요."); }
      else { replier.reply(crawlResult.title + " (" + crawlResult.meal_date + " " + crawlResult.kind_of_meal + ")" + " : " + crawlResult.menu + "\n\n* "+ crawlResult.kind_of_meal +" 식사 시간 : " +  crawlResult.meal_time + "\n\n* 식권 : 4200원\n* 이전 메뉴 ⇒ .학식메뉴\n\n[Tip] "+ tip); }
   }

   if(msg == ".이룸관메뉴" || msg == ".뉴티엘메뉴" || msg == ".ㅇㄹㄱㅁㄴ" || msg == ".ㄴㅌㅇㅁㄴ")
   {
      tip();

      crawl = org.jsoup.Jsoup.connect("http://kakao-bot-api.herokuapp.com/crawl_chun_meals/new_btl.json/××××××××××××××××××××××××××××××").ignoreContentType(true).get().text();
      crawlResult = JSON.parse(crawl);

      if (crawlResult == null) { replier.reply("현재 자료 최신화 중입니다.. 잠시후에 다시 시도해주세요."); }
      else { replier.reply(crawlResult.title + " (" + crawlResult.meal_date + " " + crawlResult.kind_of_meal + ")" + " : " + crawlResult.menu + "\n\n* "+ crawlResult.kind_of_meal +" 식사 시간 : " +  crawlResult.meal_time + "\n\n* 식권 : 4200원\n* 이전 메뉴 ⇒ .학식메뉴\n\n[Tip] "+ tip); }
   }

   if(msg == ".백록관메뉴" || msg == ".ㅂㄹㄱㅁㄴ")
   {
      crawl = org.jsoup.Jsoup.connect("http://kakao-bot-api.herokuapp.com/crawl_chun_meals/bak.json/××××××××××××××××××××××××××××××").ignoreContentType(true).get().text();
      crawlResult = JSON.parse(crawl);
      
      var arr = [];
      for (var i = 0 ; i < crawlResult.length ; i++)
      {
         arr.push([]);
         arr[i][0] = crawlResult[i].title;
         arr[i][1] = crawlResult[i].meal_date;
         arr[i][2] = crawlResult[i].kind_of_meal;
         arr[i][3] = crawlResult[i].menu;
         arr[i][4] = crawlResult[i].meal_time;
      }
      
      if (crawlResult.length < 5) { replier.reply("현재 자료 최신화 중입니다.. 잠시후에 다시 시도해주세요."); }
      else { replier.reply(arr[0][0] + " (" + arr[0][1] + " " + arr[0][2] + ")" + " : " + arr[0][3] + "\n" + arr[1][0] + " (" + arr[1][1] + " " + arr[1][2] + ")" + " : " + arr[1][3] + "\n\n" + blank + arr[4][0] + " (" + arr[4][1] + " " + arr[4][2] + ")" + " : " + arr[4][3] + "\n\n" + arr[2][0] + " (" + arr[2][1] + " " + arr[2][2] + ")" + " : " + arr[2][3] + "\n\n" + arr[3][0] + " (" + arr[3][1] + " " + arr[3][2] + ")" + " : " + arr[3][3] + "\n\n* 라면류 : 1500원 이상, 돈까스류: 3300원 이상, 백반류 : 2700원 이상, 교직원식단 : 5000원 이상\n\n* 이전 메뉴 ⇒ .학식메뉴"); }
   }

   if(msg == ".천지관메뉴" || msg == ".ㅊㅈㄱㅁㄴ")
   {
      crawl = org.jsoup.Jsoup.connect("http://kakao-bot-api.herokuapp.com/crawl_chun_meals/cheon.json/××××××××××××××××××××××××××××××").ignoreContentType(true).get().text();
      crawlResult = JSON.parse(crawl);
      
      var arr = [];
      for (var i = 0 ; i < crawlResult.length ; i++)
      {
         arr.push([]);
         arr[i][0] = crawlResult[i].title;
         arr[i][1] = crawlResult[i].meal_date;
         arr[i][2] = crawlResult[i].kind_of_meal;
         arr[i][3] = crawlResult[i].menu;
         arr[i][4] = crawlResult[i].meal_time;
      }
      
      if (crawlResult.length < 5) { replier.reply("현재 자료 최신화 중입니다.. 잠시후에 다시 시도해주세요."); }
      else { replier.reply(arr[0][0] + " (" + arr[0][1] + " " + arr[0][2] + ")" + " : " + arr[0][3] + "\n\n" + arr[1][0] + " (" + arr[1][1] + " " + arr[1][2] + ")" + " : " + arr[1][3] + "\n\n" + blank + arr[4][0] + " (" + arr[4][1] + " " + arr[4][2] + ")" + " : " + arr[4][3] + "\n\n" + arr[2][0] + " (" + arr[2][1] + " " + arr[2][2] + ")" + " : " + arr[2][3] + "\n\n" + arr[3][0] + " (" + arr[3][1] + " " + arr[3][2] + ")" + " : " + arr[3][3] + "\n\n* 라면류 : 1500원 이상, 돈까스류: 3300원 이상, 백반류 : 2700원 이상, 교직원식단 : 5000원 이상\n\n* 이전 메뉴 ⇒ .학식메뉴"); }
   }

   if(msg == ".미세먼지" || msg == ".ㅁㅅㅁㅈ")
   {
      replier.reply("미세먼지 명령어 안내 :\n1. 미세먼지 측정결과 ⇒ .미세먼지 (지역)\n2. 미세먼지 지원 지역 확인 :\n * 강원도 ⇒ .미세먼지강원\n * 서울 ⇒ .미세먼지서울\n * 경기도 ⇒ .미세먼지경기\n * 광주 ⇒ .미세먼지광주\n * 제주 ⇒ .미세먼지제주\n * 인천 ⇒ .미세먼지인천\n\n* 미세먼지 명령어 작성에 있어 다음과 같이 입력해주세요!\n [옳은 예] .ㅁㅅㅁㅈ 춘천 혹은 .미세먼지 춘천\n [나쁜 예] .ㅁㅅㅁㅈ ㅊㅊ");
   }
   
   if(msg.indexOf(".미세먼지 ") != -1 || msg.indexOf(".ㅁㅅㅁㅈ ") != -1)
   {
      station = msg.substring(6,15);
      crawl = Utils.getWebText("http://kakao-bot-api.herokuapp.com/crawl_weathers/fine_dust/"+ station + "/××××××××××××××××××××××××××××××","Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36",false,false);
      crawl_result = crawl.replace(/(<([^>]+)>)/g, "").trim();
      if (crawl_result == "") { replier.reply(station +" 지역은 지원되지 않습니다.\n\n- 미세먼지 지원 지역 확인 :\n * 강원도 ⇒ .미세먼지강원\n * 서울 ⇒ .미세먼지서울\n * 경기도 ⇒ .미세먼지경기\n * 광주 ⇒ .미세먼지광주\n * 제주 ⇒ .미세먼지제주\n * 인천 ⇒ .미세먼지인천"); }
      else { replier.reply(crawl_result); }
   }

   if(msg == ".미세먼지강원" || msg == ".ㅁㅅㅁㅈㄱㅇ" || msg == ".미세먼지 강원" || msg == ".ㅁㅅㅁㅈ ㄱㅇ")
   {
      replier.reply("[강원도] 춘천, 방산, 양구, 원주, 명륜, 문막, 옥천, 천곡, 남양동1, 평창, 북평, 정선, 간성, 치악산, 횡성, 상리, 양양군, 속초, 철원, 홍천, 영월, 화천, 태백, 인제\n\n* 미세먼지 명령어 작성에 있어 다음과 같이 입력해주세요!\n [옳은 예] .ㅁㅅㅁㅈ 춘천 혹은 .미세먼지 춘천\n [나쁜 예] .ㅁㅅㅁㅈ ㅊㅊ");
   }

   if(msg == ".미세먼지서울" || msg == ".ㅁㅅㅁㅈㅅㅇ" || msg == ".미세먼지 서울" || msg == ".ㅁㅅㅁㅈ ㅅㅇ")
   {
      replier.reply("[서울특별시] 용산, 강남, 강서, 종로, 광진, 성동, 중랑, 동대문, 홍릉, 성북, 정릉, 도봉, 은평, 서대문, 마포, 신촌, 공항대로, 구로, 영등포, 동작, 관악, 서초, 도산대로, 한강대로, 청계천로, 강변북로\n\n* 미세먼지 명령어 작성에 있어 다음과 같이 입력해주세요!\n [옳은 예] .ㅁㅅㅁㅈ 용산 혹은 .미세먼지 용산\n [나쁜 예] .ㅁㅅㅁㅈ ㅇㅅ");
   }

   if (msg == ".미세먼지경기" || msg == ".ㅁㅅㅁㅈㄱㄱ" || msg == ".미세먼지 경기" || msg == ".ㅁㅅㅁㅈ ㄱㄱ")
   {
      replier.reply("[경기도] 신풍, 인계, 광교, 영통, 천천, 동수원, 고색동, 호매실, 백현, 단대, 정자, 성남, 수내, 모란역, 북정동, 운중동, 상대원, 의정부, 의정부1, 안양6, 부림, 호계, 안양2, 철산, 소하, 고잔, 원시, 본오, 원곡, 부곡, 대부\n\n* 미세먼지 명령어 작성에 있어 다음과 같이 입력해주세요!\n [옳은 예] .ㅁㅅㅁㅈ 안양2 혹은 .미세먼지 안양2\n [나쁜 예] .ㅁㅅㅁㅈ ㅇㅇ2");
   }

   if (msg == ".미세먼지광주" || msg == ".ㅁㅅㅁㅈㄱㅈ" || msg == ".미세먼지 광주" || msg == ".ㅁㅅㅁㅈ ㄱㅈ")
   {
      replier.reply("[광주광역시] 서석, 농성, 치평, 두암, 운암, 건국, 송정1, 오선, 주월\n\n* 미세먼지 명령어 작성에 있어 다음과 같이 입력해주세요!\n [옳은 예] .ㅁㅅㅁㅈ 운암 혹은 .미세먼지 운암\n [나쁜 예] .ㅁㅅㅁㅈ ㅇㅇ");
   }

   if (msg == ".미세먼지제주" || msg == ".ㅁㅅㅁㅈㅈㅈ" || msg == ".미세먼지 제주" || msg == ".ㅁㅅㅁㅈ ㅈㅈ")
   {
      replier.reply("[제주도] 이도동, 연동, 동홍동, 성산읍, 대정읍, 고산리\n\n* 미세먼지 명령어 작성에 있어 다음과 같이 입력해주세요!\n [옳은 예] .ㅁㅅㅁㅈ 성산읍 혹은 .미세먼지 성산읍\n [나쁜 예] .ㅁㅅㅁㅈ ㅅㅅㅇ");
   }

   if (msg == ".미세먼지인천" || msg == ".ㅁㅅㅁㅈㅇㅊ" || msg == ".미세먼지 인천" || msg == ".ㅁㅅㅁㅈ ㅇㅊ")
   {
      replier.reply("[인천광역시] 신흥, 송림, 구월동, 숭의, 석바위, 부평(역), 연희, 검단, 계산, 고잔, 석남, 송해, 동춘, 운서\n\n* 미세먼지 명령어 작성에 있어 다음과 같이 입력해주세요!\n [옳은 예] .ㅁㅅㅁㅈ 부평 혹은 .미세먼지 부평\n [나쁜 예] .ㅁㅅㅁㅈ ㅂㅍ");
   }
}