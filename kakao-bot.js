/* 해당 카카오BOT Javascript는 Github 오픈소스 공개용으로서, 일부 내용은 비공개 처리됩니다. */

var bot_activity_count = 0; // 봇 메세지 카운트 (전체 채팅방 카운트)
var botOn = true; // 봇 활성화 여부
var botOn_comment = ""; // 봇이 꺼져있을 시 사유메세지를 담을 변수

function response(room, msg, sender, isGroupChat, replier)
{
   var say_hi = Math.floor(Math.random() * 5) + 1; // '안녕하세요' 혹은 '하이' 라고 할 시 응답할 확률

   if((say_hi == 1 && msg.indexOf("안녕") != -1) || (say_hi == 1 && msg.indexOf("하이") != -1) || (say_hi == 1 && msg.indexOf("ㅎㅇ") != -1))
   {
      bot_activity_count = bot_activity_count+1;
      /* BOT 활용 TIP */
      tip = Utils.getWebText("http://everytime-bot.herokuapp.com/kakao_bot_random_tips","Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36",false,false);
      tip = tip.replace(/(<([^>]+)>)/g, "").trim();
      replier.reply('안녕하세용! 여러분들의 도우미, 곰두리 봇이에오! 저를 깨우시려면 ".help" 라고 톡을 해보세요!^^\n\n[Tip] '+ tip);
   }
   
   if(msg == ".cmd" || msg == ".help" || msg == ".명령어" || msg == ".도움말" || msg == ".ㅁㄹㅇ" || msg == ".ㄷㅇㅁ" || msg == ".쟈비스" || msg == ".헤이쟈비스" || msg == ".자비스" || msg == ".헤이자비스" || msg == ".곰두리" || msg == ".ㄱㄷㄹ" || msg == "/곰두리" || msg == "/help" || msg == "/cmd" || msg == "/도움말")
   {
      if (botOn == true) {
         bot_activity_count = bot_activity_count+1;
         
         /* BOT 활용 TIP */
         tip = Utils.getWebText("http://everytime-bot.herokuapp.com/kakao_bot_random_tips","Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36",false,false);
         tip = tip.replace(/(<([^>]+)>)/g, "").trim();
         
         replier.reply("명령어 안내 :\n1. 대학 생활 ⇒ .대학생활\n2. 일반 생활 ⇒ .생활\n3. 날씨 및 미세먼지 안내 ⇒ .날씨\n4. 장학 정보 ⇒ .장학\n5. 교통(시외버스, 전철, ITX-청춘) 시간 조회 ⇒ .교통\n6. 곰두리봇 문의 ⇒ .곰두리문의\n7. 오픈채팅방 방문요청 ⇒ .방문요청\n\n* 명령어는 자음으로 입력해도 됩니다!\n(예 > .대학생활 = .ㄷㅎㅅㅎ)\n[Tip] "+ tip);
         
         if (msg.indexOf("/") != -1)
         {
            replier.reply("다음부터는 맨 앞에 / 이 아닌 . 으로 입력해주세요~!");
         }
      }
      else if (botOn == false) { replier.reply("BOT이 꺼져있습니다!\n[상태] "+ botOn +"\n[사유] "+ botOn_comment); }
   }
   
   
   if(msg == ".공지사항" || msg == ".ㄱㅈㅅㅎ")
   {
      bot_activity_count = bot_activity_count+1;
      crawl = Utils.getWebText("http://everytime-bot.herokuapp.com/kakao_bot_notices","Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36",false,false);
      crawl_result = crawl.replace(/(<([^>]+)>)/g, "").trim();
      /* BOT 활용 TIP */
      tip = Utils.getWebText("http://everytime-bot.herokuapp.com/kakao_bot_random_tips","Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36",false,false);
      tip = tip.replace(/(<([^>]+)>)/g, "").trim();
      replier.reply("- 곰두리BOT 알림 -\n\n"+ crawl_result +"\n\n[Tip] "+ tip);
   }


   if(msg == ".생활" || msg == ".ㅅㅎ")
   {
      if (botOn == true) {
         bot_activity_count = bot_activity_count+1;
         replier.reply("일반 생활 명령어 안내 :\n1. 자취인 랜덤 요리 레시피 ⇒ .레시피\n2. LOL 유저 전적 검색 : .롤전적 (유저닉네임)\n* 명령어는 자음으로 입력해도 됩니다!\n(예 > .레시피 = .ㄹㅅㅍ)");
      }
      else if (botOn == false) { replier.reply("BOT이 꺼져있습니다!\n[상태] "+ botOn +"\n[사유] "+ botOn_comment); }
   }
   
   
   if(msg == ".롤전적" || msg == ".ㄹㅈㅈ")
   {
      if (botOn == true) {
         bot_activity_count = bot_activity_count+1;
         replier.reply("롤 전적 명령어 :\n열람을 희망하는 닉네임을 함께 작성해주시면 됩니다!\n\n[옳은 예] .롤전적 기엽지 혹은 .ㄹㅈㅈ 기엽지\n[나쁜 예] .ㄹㅈㅈ ㄱㅇㅈ\n\n* 이전 메뉴 ⇒ .생활");
      }
      else if (botOn == false) { replier.reply("BOT이 꺼져있습니다!\n[상태] "+ botOn +"\n[사유] "+ botOn_comment); }
   }
   
   
   if(msg == ".교통" || msg == ".ㄱㅌ")
   {
      if (botOn == true) {
         bot_activity_count = bot_activity_count+1;
         replier.reply("교통 시간조회 안내 명령어 안내 :\n1. 시외버스 ⇒ https://m.bustago.or.kr:444/mobus/btmho/BTMHORN0001.do#\n2. 춘천 스마일 콜택시(개인) ⇒ 033-913-7777\n3. 경춘선 전철 시간표 ⇒ 준비중\n4. ITX-청춘 [남춘천역 → (도착 희망역)] ⇒ .아텍스서울\n5. ITX-청춘 [(출발 희망역) → 남춘천역] 시간표 ⇒ .아텍스춘천\n\n* 명령어는 자음으로 입력해도 됩니다!\n(예 > .아텍스서울 용산 = .ㅇㅌㅅㅅㅇ 용산)");
      }
      else if (botOn == false) { replier.reply("BOT이 꺼져있습니다!\n[상태] "+ botOn +"\n[사유] "+ botOn_comment); }
   }


   if(msg == ".대학생활" || msg == ".ㄷㅎㅅㅎ")
   {
      if (botOn == true) {
         bot_activity_count = bot_activity_count+1;
         replier.reply("대학 생활 명령어 안내 :\n1. 학사일정 ⇒ .학사일정\n2. 대학 공지사항 ⇒ .대학공지\n3. 대학 학사공지 ⇒ .학사공지\n4. 대학 장학안내 ⇒ .대학장학\n5. 학식 메뉴 안내 ⇒ .학식메뉴\n6. 복사실 안내 ⇒ .복사실\n7. 교내 식당 위치 ⇒ .교내식당\n8. 교내 카페 위치 ⇒ .교내카페\n9. 학생증 안내 ⇒ .학생증\n10. 교내 와이파이 암호 ⇒ .와이파이\n11. FTP 자료실 안내 ⇒ .자료실\n12. 교내 의료시설 안내 ⇒ .의료시설\n13. 무인 민원(학교서류 및 등본 등 민원서류) ⇒ .무인민원\n14. 교내 ATM 위치 ⇒ .현금입출금\n15. 도서관 안내 ⇒ .도서관\n16. 기숙사 안내 ⇒ .기숙사\n17. 천지관 편의시설 안내 ⇒ .천지관시설\n18. 학생 복지 안내 : .대학복지\n\n* 명령어는 자음으로 입력해도 됩니다!\n(예 > .학사일정 = .ㅎㅅㅇㅈ)");
      }
      else if (botOn == false) { replier.reply("BOT이 꺼져있습니다!\n[상태] "+ botOn +"\n[사유] "+ botOn_comment); }
   }

   if(msg == ".학식메뉴" || msg == ".ㅎㅅㅁㄴ")
   {
      if (botOn == true) {
         bot_activity_count = bot_activity_count+1;
         replier.reply("학식 메뉴 안내 :\n 1. 재정생활관 ⇒ .재정메뉴\n 2. 새롬관(구 BTL) ⇒ .새롬관메뉴 혹은 .구티엘메뉴\n 3. 이룸관(신 BTL) ⇒ .이룸관메뉴 혹은 .뉴티엘메뉴\n 4. 백록관 ⇒ .백록관메뉴\n 5. 천지관 ⇒ .천지관메뉴\n\n[가격] 학식(백록관, 천지관) 평균가격 : 3500원, 기숙사 식권 값 : 4200원\n* 재정생활관 식당, 백록관, 천지관은 주말 미운영\n\n* 명령어는 자음으로 입력해도 됩니다!\n(예 > .재정메뉴 = .ㅈㅈㅁㄴ)");
      }
      else if (botOn == false) { replier.reply("BOT이 꺼져있습니다!\n[상태] "+ botOn +"\n[사유] "+ botOn_comment); }
   }

   if(msg == ".복사실" || msg == ".ㅂㅅㅅ" )
   {
      if (botOn == true) {
         bot_activity_count = bot_activity_count+1;
         replier.reply("복사실 안내 :\n1. 제본 신청, 복사 등이 가능한 교내 복사실 - 천지관, 60주년 기념관 2층 CU 옆, 의학 1호관\n * 평일 운영 시간 : 08:30 ~ 18:00(의대는 확인 요망)\n * 60주년 기념관 복사실은 현금 및 계좌이체만 가능\n * 천지관 복사실은 토요일에도 운영 (08:30 ~ 13:00)\n * 토익 성적표 등 횟수가 한정된 복사는 교내 복사실에서 하지마세요.\n2. 무인 복사시설 - BTL 기숙사, 재정생활관 CU\n3. 복사 시 복사카드 필요 (구매 : 만원)\n * 복사카드는 천지관, 60주년 기념관에 있는 복사실에서 구매 가능.\n4. 복사실이 닫혀있고, 급할 시 [공대쪽문] CU, [자대쪽문] CU, [후문] 존앤존 PC방 이용 요망.\n\n* 이전 메뉴 ⇒ .대학생활");
      }
      else if (botOn == false) { replier.reply("BOT이 꺼져있습니다!\n[상태] "+ botOn +"\n[사유] "+ botOn_comment); }
   }

   if(msg == ".교내식당" || msg == ".ㄱㄴㅅㄷ")
   {
      if (botOn == true) {
         bot_activity_count = bot_activity_count+1;
         replier.reply("교내 식당 위치 :\n1. 백록관 및 석재 신소재센터 : 정문 부근\n * 정문, 공대, 인문대, 사범대(일부), 사회과학대, 로스쿨, 60주년기념관 학생에게 있어 가까움.\n2. 천지관 : 후문 부근\n * 자연과학대, 사범대(일부), 농대, 경영대 학생에게 있어 가까움.\n\n* 이전 메뉴 ⇒ .대학생활");
      }
      else if (botOn == false) { replier.reply("BOT이 꺼져있습니다!\n[상태] "+ botOn +"\n[사유] "+ botOn_comment); }
   }

   if(msg == ".교내카페" || msg == ".ㄱㄴㅋㅍ")
   {  
      if (botOn == true) {
         bot_activity_count = bot_activity_count+1;
         replier.reply("교내 카페 위치 :\n보듬관, 60주년 기념관, 글로벌경영관, 석재 신소재센터 5층, 천지관 2층, 농생대 1호관(도서관 후문), 새롬관 BTL(남), 이룸관 BTL 1층(원리터)\n\n[카페마운틴] 08시 30분 ~ 19시 (토요일은 10시 ~ 17시)\n * 방학 : 09시 ~\n[원리터(이룸관 BTL)] 09시 ~ 00시\n[글로벌경영 카페] 평일 08:30(방학 09:00) ~ 19:00 / 토요일 10:00 ~ 17:00\n\n* 이전 메뉴 ⇒ .대학생활");
      }
      else if (botOn == false) { replier.reply("BOT이 꺼져있습니다!\n[상태] "+ botOn +"\n[사유] "+ botOn_comment); }
   }

   if(msg == ".학생증" || msg == ".ㅎㅅㅈ")
   {
      if (botOn == true) {
         bot_activity_count = bot_activity_count+1;
         replier.reply("학생증 안내(춘천) :\n1. 학생증은 다음과 같은 용도로 쓰입니다.\n 1) 교내 건물 출입증(교내 모든 건물은 평일 오후 11시 30분 쯤 이후, 주말에 자동으로 잠깁니다.)\n 2) 도서관 책 대출, 열람실 예약 등(학생증이 없을 시 신분증으로 대체 가능)\n 3) 학생 인증을 통한 학교 주변 음식점 할인\n 4) 신한체크 S20 혜택과 동일\n2. 학생증 최초발급 신청 : http://bit.ly/2UyEzKL\n * 해당 페이지에서 서류 작성 후, '강원대 내 은행(태백관)' 내방 방문 필수 (신분증 지참)\n * 재발급 시에는 홈페이지에서 서류작성 과정 생략, 바로 은행 내방방문\n3. 건물 출입권한 획득 : 출입문 옆에 있는 인터폰 연락 혹은 교내 세콤(대학본부 지하) 방문\n\n* 이전 메뉴 ⇒ .대학생활");
      }
      else if (botOn == false) { replier.reply("BOT이 꺼져있습니다!\n[상태] "+ botOn +"\n[사유] "+ botOn_comment); }
   }

   if(msg == ".와이파이" || msg == ".ㅇㅇㅍㅇ")
   {
      if (botOn == true) {
         bot_activity_count = bot_activity_count+1;
         replier.reply("교내 와이파이 암호 안내 :\n1. KNU_WLAN_Open : beyondme\n2. KNU_WLAN_Secure\n 1) 스마트폰 : ID 및 암호는 학번 및 포탈암호\n 2) 노트북 등 : Cuvic 프로그램 설치 (http://bit.ly/2G1STU1)\n3. U+ Zone : lguplus100\n\n* 이전 메뉴 ⇒ .대학생활");
      }
      else if (botOn == false) { replier.reply("BOT이 꺼져있습니다!\n[상태] "+ botOn +"\n[사유] "+ botOn_comment); }
   }

   if(msg == ".자료실" || msg == ".ㅈㄹㅅ")
   {
      if (botOn == true) {
         bot_activity_count = bot_activity_count+1;
         replier.reply("FTP 안내 :\n1. FTP 페이지 : ftp://ftp.kangwon.ac.kr (주소에 ftp:// 붙여주세요!)\n2. FTP 자료실에서는 Windows10 정품, 한글, MATLAB 등 프로그램 다운로드가 가능합니다.\n3. 소프트웨어 정품키는 http://bit.ly/2UiEs6I 사이트를 참고바랍니다.\n4. FTP 접속은 교내 인터넷/와이파이를 통해서만 접속 가능합니다.\n * 기숙사, 보듬관 등 일부 건물 제외\n\n* 이전 메뉴 ⇒ .대학생활");
      }
      else if (botOn == false) { replier.reply("BOT이 꺼져있습니다!\n[상태] "+ botOn +"\n[사유] "+ botOn_comment); }
   }

   if(msg == ".의료시설" || msg == ".ㅇㄹㅅㅅ" || msg == ".보건실" || msg == ".의료" || msg == ".양호실" || msg == ".보건")
   {
      if (botOn == true) {
         bot_activity_count = bot_activity_count+1;
         replier.reply("교내 의료시설 안내 :\n1. 보건소 및 성폭력 상담은 나래관 건물에서 해결이 됩니다.\n * 나래관 위치 : 경영대(후문) 근방\n2. 두통, 감기약 등 기본적인 약 처방이 가능합니다.\n3. 강원대 학생이 강원대학교에서 진료 시 비급여에 한해 15% 진료비 할인이 됩니다.\n4. 더 자세한 소개 : http://bit.ly/2OOXxaT\n\n* 이전 메뉴 ⇒ .대학생활");
      }
      else if (botOn == false) { replier.reply("BOT이 꺼져있습니다!\n[상태] "+ botOn +"\n[사유] "+ botOn_comment); }
   }

   if(msg == ".무인민원" || msg == ".ㅁㅇㅁㅇ")
   {
      if (botOn == true) {
         bot_activity_count = bot_activity_count+1;
         replier.reply("무인민원 안내 :\n1. 학교 서류 발급 : 60주년 기념관 2층, 나래관\n2. 학교 서류 및 정부 무인민원 : 나래관\n * 신분증 지참 必\n\n[학교 서류] 성적, 재학, 졸업예정, 학적부, 교육비납입, 입학성적, 장학금수혜, 병역의무자 국외여행추천서, 장학추천서, 수료, 봉사활동이수\n[정부 무인민원] 주민등록등본(초본), 지적/토지/건축, 차량, 보건복지, 농지원부(관외 발급불가), 병적증명서, 지방세 세목별 과세증명서, 어선원부, 교육제증명, 국세증명, 건강보험\n\n* 이전 메뉴 ⇒ .대학생활");
      }
      else if (botOn == false) { replier.reply("BOT이 꺼져있습니다!\n[상태] "+ botOn +"\n[사유] "+ botOn_comment); }
   }

   if(msg == ".현금입출금" || msg == ".ㅎㄱㅇㅊㄱ")
   {
      if (botOn == true) {
         bot_activity_count = bot_activity_count+1;
         replier.reply("교내 ATM기 위치 :\n1. 공대 쪽문 : 신한은행 (07시 ~ 23시 30분)\n2. 백록관 : 신한은행 및 농협\n3. 천지관 : 신한은행, 우체국, 농협(2층)\n4. 태백관 : 신한은행\n * 학생증제작, 은행업무(계좌신설, 카드발급 등) 응대\n5. 나래관 : 신한은행, 농협\n6. 재정생활관 CU 및 새롬관 BTL(남) : 신한은행\n7. 공3호관 및 의생대 4층 : 신한은행\n8. 중앙도서관 후문\n\n* 이전 메뉴 ⇒ .대학생활");
      }
      else if (botOn == false) { replier.reply("BOT이 꺼져있습니다!\n[상태] "+ botOn +"\n[사유] "+ botOn_comment); }
   }

   if(msg == ".도서관" || msg == ".ㄷㅅㄱ")
   {
      if (botOn == true) {
         bot_activity_count = bot_activity_count+1;
         replier.reply("도서관 안내 :\n1. 도서관은 열람실 운영시간 기준 [동계(11월 ~ 2월 말)] 06:00 ~ 24:00, [하계(3월 ~ 10월 말)] 05:00 ~ 24:00\n * 중간/기말고사 1주일 전에는 2주간 02:00 연장운영\n * 휴관일 : 국경일, 개교기념일(6월 14일)\n2. 학생증이 없어도 도서 대여 및 열람실 예약 가능\n * 단, 신분증 지참 필수\n3. 별관 제1열람실(집현관) : 24시간 운영\n4. 도서관 홈페이지에서 논문 자료 열람이 무료로 가능합니다. (RISS, DBPIA 등 제공)\n5. 실시간 열람실 좌석 : http://bit.ly/2OOLMB3\n\n* 이전 메뉴 ⇒ .대학생활");
      }
      else if (botOn == false) { replier.reply("BOT이 꺼져있습니다!\n[상태] "+ botOn +"\n[사유] "+ botOn_comment); }
   }

   if(msg == ".기숙사" || msg == ".ㄱㅅㅅ")
   {
      if (botOn == true) {
         bot_activity_count = bot_activity_count+1;
         replier.reply("기숙사 안내 :\n1. 기숙사 홈페이지 : http://bit.ly/2uOb4pY\n2. 기숙사 입사조건 : 봉사활동 15회 AND 30시간\n * 15회 + 30시간이 봉사 만점임.\n * 봉사활동 점수 효력은 1년동안 유지\n * 봉사 신청(수강신청 기간) : http://bit.ly/2G3Fk6J\n * 평가요소 : 직전학기 까지의 평균성적+봉사활동 시간+봉사활동 횟수+(거리가산점)\n3. 국제 생활관\n * 후문 쪽에 위치\n * 기숙사 식당 없음.\n * 기숙사 내 영어수업 의무참여(학습비 청구)\n4. 선호도 평가 : 이룸관 >= 새롬관 > 국제생활관 > (그 외 기숙사)\n5. 기숙사 통금시간 : 오전 01시 ~ 오전 05시\n6. 다음 전형에 해당 시 기숙사 입사 우선순위가 주어진다 :\n 1) 신입생(1학년 1학기)\n 2) 국가유공자 자녀\n 3) 기초생활 수급자\n 4) 외국인 유학생\n 5) 대학원생\n 6) 형제/자매/남매 중 한 명이라도 기숙사 합격 시\n * 규정 참고 : http://bit.ly/2GozJYw\n7. 1학기에 기숙사 합격 시 2학기 때에는 봉사/성적 등 점수 반영 없이 연장신청을 통해 추가 입사 가능.\n8. 퇴계관 등 일부 기숙사 도어락 음소거법 : http://bit.ly/2WSKubh\n\n* 이전 메뉴 ⇒ .대학생활");
      }
      else if (botOn == false) { replier.reply("BOT이 꺼져있습니다!\n[상태] "+ botOn +"\n[사유] "+ botOn_comment); }
   }

   if(msg == ".천지관시설" || msg == ".ㅊㅈㄱㅅㅅ")
   {
      if (botOn == true) {
         bot_activity_count = bot_activity_count+1;
         replier.reply("천지관 시설 안내 :\n1층 : 학생식당, 편의점(CU), 서점, 문방구. 안경점, 우체국 택배, 신한은행 및 우체국 ATM, 헌혈의집\n2층 : 농협 ATM, 공동열람실, 맘스터치, 카페마운틴, 복사실, 실험복 등 취급가게, 미용실, 사진관\n\n* 이전 메뉴 ⇒ .대학생활");
      }
      else if (botOn == false) { replier.reply("BOT이 꺼져있습니다!\n[상태] "+ botOn +"\n[사유] "+ botOn_comment); }
   }
   
   if(msg == ".대학복지" || msg == ".ㄷㅎㅂㅈ")
   {
      if (botOn == true) {
         bot_activity_count = bot_activity_count+1;
         replier.reply("대학 복지 안내 :\n1) 강원대 재학생은 웹메일 인증을 통해 무료로 배포되는 소프트웨어를 다운로드 받아보실 수 있습니다.\n * 참고1 : www.damda.info/univs/3\n * 참고2 : .자료실\n2) 나래관에서 무료 정장대여를 받아보실 수 있습니다.\n * 정장대여 시 신분증 지참, 증명사진/기업면접 등 사유 필요\n3) 강원대 주변 상권에서 강원대 학생임을 증명하면 학생 할인을 받아보실 수 있습니다.\n * 참고 : http://bit.ly/2HTGRM5\n4) 강원대 병원에서 진료 할인을 받아보실 수 있습니다.\n * 참고 : .의료시설 명령어로 확인.\n\n* 이전 메뉴 ⇒ .대학생활");
      }
      else if (botOn == false) { replier.reply("BOT이 꺼져있습니다!\n[상태] "+ botOn +"\n[사유] "+ botOn_comment); }
   }


   if(msg == ".날씨" || msg == ".ㄴㅆ")
   {
      if (botOn == true) {
         bot_activity_count = bot_activity_count+1;
         replier.reply("날씨/미세먼지 명령어 안내 :\n1. 춘천 날씨/강수확률 ⇒ .춘천날씨\n2. 미세먼지 측정결과 ⇒ .미세먼지 (지역)\n3. 미세먼지 지원 지역 확인 :\n * 강원도 ⇒ .미세먼지강원\n * 서울 ⇒ .미세먼지서울\n * 경기도 ⇒ .미세먼지경기\n * 광주 ⇒ .미세먼지광주\n * 제주 ⇒ .미세먼지제주\n * 인천 ⇒ .미세먼지인천\n\n* 미세먼지 명령어 작성에 있어 다음과 같이 입력해주세요!\n [옳은 예] .ㅁㅅㅁㅈ 춘천 혹은 .미세먼지 춘천\n [나쁜 예] .ㅁㅅㅁㅈ ㅊㅊ");
      }
      else if (botOn == false) { replier.reply("BOT이 꺼져있습니다!\n[상태] "+ botOn +"\n[사유] "+ botOn_comment); }
   }


   if(msg == ".장학" || msg == ".ㅈㅎ" || msg == ".장학금" || msg == ".ㅈㅎㄱ")
   {
      if (botOn == true) {
         bot_activity_count = bot_activity_count+1;
         replier.reply("장학정보 명령어 안내 :\n1. 대학 장학 게시글 ⇒ .대학장학\n\n* 명령어는 자음으로 입력해도 됩니다!\n(예 : .대학장학 = .ㄷㅎㅈㅎ)");
      }
      else if (botOn == false) { replier.reply("BOT이 꺼져있습니다!\n[상태] "+ botOn +"\n[사유] "+ botOn_comment); }
   }


   if(msg == ".곰두리문의" || msg == ".ㄱㄷㄹㅁㅇ" || msg == ".방문요청" || msg == ".ㅂㅁㅇㅊ" || msg == ".나가" || msg == ".퇴장" || msg == ".강퇴" || msg == ".강티" || msg == ".꺼져" || msg == ".ㄲㅈ" || msg == ".곰두리나가" || msg == ".곰두리 나가" || msg == ".곰두리퇴장" || msg == ".곰두리 퇴장" || msg == ".곰두리강퇴" || msg == ".곰두리 강퇴" || msg == ".곰두리꺼져" || msg == ".곰두리 꺼져")
   {
      if (botOn == true) {
         bot_activity_count = bot_activity_count+1;
         replier.reply("[문의] http://bit.ly/2KhaR90\n\n* 오픈채팅방 방문요청, 봇 퇴장요청, 버그 및 잘못된 정보 제보, 그 외 의견이 있으시면 언제든 연락주세요!^^ \n* 항상 BOT을 써주셔서 감사해오!");
      }
      else if (botOn == false) { replier.reply("BOT이 꺼져있습니다!\n[상태] "+ botOn +"\n[사유] "+ botOn_comment); }
   }


   if(msg == ".레시피" || msg == ".ㄹㅅㅍ")
   {
      if (botOn == true) {
         bot_activity_count = bot_activity_count+1;
         crawl = Utils.getWebText("http://everytime-bot.herokuapp.com/recipes","Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36",false,false);
         crawl_result = crawl.replace(/(<([^>]+)>)/g, "").trim();
         replier.reply(crawl_result);
      }
      else if (botOn == false) { replier.reply("BOT이 꺼져있습니다!\n[상태] "+ botOn +"\n[사유] "+ botOn_comment); }
   }

   if(msg == ".대학공지" || msg == ".ㄷㅎㄱㅈ")
   {
      if (botOn == true) {
         bot_activity_count = bot_activity_count+1;
         crawl = Utils.getWebText("http://everytime-bot.herokuapp.com/crawl_chun_notice/notice","Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36",false,false);
         crawl_result = crawl.replace(/(<([^>]+)>)/g, "").trim();
         replier.reply(crawl_result);
      }
      else if (botOn == false) { replier.reply("BOT이 꺼져있습니다!\n[상태] "+ botOn +"\n[사유] "+ botOn_comment); }
   }

   if(msg == ".대학장학" || msg == ".ㄷㅎㅈㅎ")
   {
      if (botOn == true) {
         bot_activity_count = bot_activity_count+1;
         crawl = Utils.getWebText("http://everytime-bot.herokuapp.com/crawl_chun_notice/campus_scholarship","Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36",false,false);
         crawl_result = crawl.replace(/(<([^>]+)>)/g, "").trim();
         replier.reply(crawl_result);
      }
      else if (botOn == false) { replier.reply("BOT이 꺼져있습니다!\n[상태] "+ botOn +"\n[사유] "+ botOn_comment); }
   }
   
   if(msg == ".학사공지" || msg == ".ㅎㅅㄱㅈ")
   {
      if (botOn == true) {
         bot_activity_count = bot_activity_count+1;
         crawl = Utils.getWebText("http://everytime-bot.herokuapp.com/crawl_chun_notice/campus_notice","Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36",false,false);
         crawl_result = crawl.replace(/(<([^>]+)>)/g, "").trim();
         replier.reply(crawl_result);
      }
      else if (botOn == false) { replier.reply("BOT이 꺼져있습니다!\n[상태] "+ botOn +"\n[사유] "+ botOn_comment); }
   }

   if(msg == ".학사일정" || msg == ".ㅎㅅㅇㅈ")
   {
      if (botOn == true) {
         bot_activity_count = bot_activity_count+1;
         crawl = Utils.getWebText("http://everytime-bot.herokuapp.com/crawl_chun_monthly_schedules/index","Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36",false,false);
         crawl_result = crawl.replace(/(<([^>]+)>)/g, "").trim();
         replier.reply(crawl_result);
      }
      else if (botOn == false) { replier.reply("BOT이 꺼져있습니다!\n[상태] "+ botOn +"\n[사유] "+ botOn_comment); }
   }

   if(msg == ".재정메뉴" || msg == ".ㅈㅈㅁㄴ")
   {
      if (botOn == true) {
         bot_activity_count = bot_activity_count+1;
         crawl = Utils.getWebText("http://everytime-bot.herokuapp.com/crawl_chun_meals/dor_normal","Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36",false,false);
         crawl_result = crawl.replace(/(<([^>]+)>)/g, "").trim();
         replier.reply(crawl_result +"\n\n* 식권 : 4200원\n* 이전 메뉴 ⇒ .학식메뉴");
      }
      else if (botOn == false) { replier.reply("BOT이 꺼져있습니다!\n[상태] "+ botOn +"\n[사유] "+ botOn_comment); }
   }

   if(msg == ".새롬관메뉴" || msg == ".구티엘메뉴" || msg == ".ㅅㄹㄱㅁㄴ" || msg == ".ㄱㅌㅇㅁㄴ")
   {
      if (botOn == true) {
         bot_activity_count = bot_activity_count+1;
         crawl = Utils.getWebText("http://everytime-bot.herokuapp.com/crawl_chun_meals/old_btl","Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36",false,false);
         crawl_result = crawl.replace(/(<([^>]+)>)/g, "").trim();
         replier.reply(crawl_result +"\n\n* 식권 : 4200원\n* 이전 메뉴 ⇒ .학식메뉴");
      }
      else if (botOn == false) { replier.reply("BOT이 꺼져있습니다!\n[상태] "+ botOn +"\n[사유] "+ botOn_comment); }
   }

   if(msg == ".이룸관메뉴" || msg == ".뉴티엘메뉴" || msg == ".ㅇㄹㄱㅁㄴ" || msg == ".ㄴㅌㅇㅁㄴ")
   {
      if (botOn == true) {
         bot_activity_count = bot_activity_count+1;
         crawl = Utils.getWebText("http://everytime-bot.herokuapp.com/crawl_chun_meals/new_btl","Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36",false,false);
         crawl_result = crawl.replace(/(<([^>]+)>)/g, "").trim();
         replier.reply(crawl_result +"\n\n* 식권 : 4200원\n* 이전 메뉴 ⇒ .학식메뉴");
      }
      else if (botOn == false) { replier.reply("BOT이 꺼져있습니다!\n[상태] "+ botOn +"\n[사유] "+ botOn_comment); }
   }

   if(msg == ".백록관메뉴" || msg == ".ㅂㄹㄱㅁㄴ")
   {
      if (botOn == true) {
         bot_activity_count = bot_activity_count+1;
         bak_normal = Utils.getWebText("http://everytime-bot.herokuapp.com/crawl_chun_meals/bak","Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36",false,false);
         bak_normal_result = bak_normal.replace(/(<([^>]+)>)/g, "").trim();
         
         bak_staff = Utils.getWebText("http://everytime-bot.herokuapp.com/crawl_chun_meals/bak_staff","Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36",false,false);
         bak_staff_result = bak_staff.replace(/(<([^>]+)>)/g, "").trim();
         
         replier.reply(bak_normal_result + "\n\n" + bak_staff_result +"\n\n* 라면류 : 1500원 이상, 돈까스류: 3300원 이상, 백반류 : 2700원 이상, 교직원식단 : 5000원 이상\n\n* 이전 메뉴 ⇒ .학식메뉴");
      }
      else if (botOn == false) { replier.reply("BOT이 꺼져있습니다!\n[상태] "+ botOn +"\n[사유] "+ botOn_comment); }
   }

   if(msg == ".천지관메뉴" || msg == ".ㅊㅈㄱㅁㄴ")
   {
      if (botOn == true) {
         bot_activity_count = bot_activity_count+1;
         cheon_normal = Utils.getWebText("http://everytime-bot.herokuapp.com/crawl_chun_meals/cheon","Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36",false,false);
         cheon_normal_result = cheon_normal.replace(/(<([^>]+)>)/g, "").trim();
         
         cheon_staff = Utils.getWebText("http://everytime-bot.herokuapp.com/crawl_chun_meals/cheon_staff","Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36",false,false);
         cheon_staff_result = cheon_staff.replace(/(<([^>]+)>)/g, "").trim();
         
         cheon_topping = Utils.getWebText("http://everytime-bot.herokuapp.com/crawl_chun_meals/cheon_topping","Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36",false,false);
         cheon_topping_result = cheon_topping.replace(/(<([^>]+)>)/g, "").trim();
         
         replier.reply(cheon_normal_result + "\n\n" + cheon_staff_result + "\n\n" + cheon_topping_result +"\n\n* 라면류 : 1500원 이상, 돈까스류: 3300원 이상, 백반류 : 2700원 이상, 교직원식단 : 5000원 이상\n\n* 이전 메뉴 ⇒ .학식메뉴");
      }
      else if (botOn == false) { replier.reply("BOT이 꺼져있습니다!\n[상태] "+ botOn +"\n[사유] "+ botOn_comment); }
   }

   
   if(msg == ".미세먼지" || msg == ".ㅁㅅㅁㅈ")
   {
      if (botOn == true) {
         bot_activity_count = bot_activity_count+1;
         replier.reply("미세먼지 명령어 안내 :\n1. 미세먼지 측정결과 ⇒ .미세먼지 (지역)\n2. 미세먼지 지원 지역 확인 :\n * 강원도 ⇒ .미세먼지강원\n * 서울 ⇒ .미세먼지서울\n * 경기도 ⇒ .미세먼지경기\n * 광주 ⇒ .미세먼지광주\n * 제주 ⇒ .미세먼지제주\n * 인천 ⇒ .미세먼지인천\n\n* 미세먼지 명령어 작성에 있어 다음과 같이 입력해주세요!\n [옳은 예] .ㅁㅅㅁㅈ 춘천 혹은 .미세먼지 춘천\n [나쁜 예] .ㅁㅅㅁㅈ ㅊㅊ");
      }
      else if (botOn == false) { replier.reply("BOT이 꺼져있습니다!\n[상태] "+ botOn +"\n[사유] "+ botOn_comment); }
   }

   if(msg == ".미세먼지강원" || msg == ".ㅁㅅㅁㅈㄱㅇ" || msg == ".미세먼지 강원" || msg == ".ㅁㅅㅁㅈ ㄱㅇ")
   {
      if (botOn == true) {
         bot_activity_count = bot_activity_count+1;
         replier.reply("[강원도] 춘천, 방산, 양구, 원주, 명륜, 문막, 옥천, 천곡, 남양동1, 평창, 북평, 정선, 간성, 치악산, 횡성, 상리, 양양군, 속초, 철원, 홍천, 영월, 화천, 태백, 인제\n\n* 미세먼지 명령어 작성에 있어 다음과 같이 입력해주세요!\n [옳은 예] .ㅁㅅㅁㅈ 춘천 혹은 .미세먼지 춘천\n [나쁜 예] .ㅁㅅㅁㅈ ㅊㅊ");
      }
      else if (botOn == false) { replier.reply("BOT이 꺼져있습니다!\n[상태] "+ botOn +"\n[사유] "+ botOn_comment); }
   }

   if(msg == ".미세먼지서울" || msg == ".ㅁㅅㅁㅈㅅㅇ" || msg == ".미세먼지 서울" || msg == ".ㅁㅅㅁㅈ ㅅㅇ")
   {
      if (botOn == true) {
         bot_activity_count = bot_activity_count+1;
         replier.reply("[서울특별시] 용산, 강남, 강서, 종로, 광진, 성동, 중랑, 동대문, 홍릉, 성북, 정릉, 도봉, 은평, 서대문, 마포, 신촌, 공항대로, 구로, 영등포, 동작, 관악, 서초, 도산대로, 한강대로, 청계천로, 강변북로\n\n* 미세먼지 명령어 작성에 있어 다음과 같이 입력해주세요!\n [옳은 예] .ㅁㅅㅁㅈ 용산 혹은 .미세먼지 용산\n [나쁜 예] .ㅁㅅㅁㅈ ㅇㅅ");
      }
      else if (botOn == false) { replier.reply("BOT이 꺼져있습니다!\n[상태] "+ botOn +"\n[사유] "+ botOn_comment); }
   }

   if(msg == ".미세먼지경기" || msg == ".ㅁㅅㅁㅈㄱㄱ" || msg == ".미세먼지 경기" || msg == ".ㅁㅅㅁㅈ ㄱㄱ")
   {
      if (botOn == true) {
         bot_activity_count = bot_activity_count+1;
         replier.reply("[경기도] 신풍, 인계, 광교, 영통, 천천, 동수원, 고색동, 호매실, 백현, 단대, 정자, 성남, 수내, 모란역, 북정동, 운중동, 상대원, 의정부, 의정부1, 안양6, 부림, 호계, 안양2, 철산, 소하, 고잔, 원시, 본오, 원곡, 부곡, 대부\n\n* 미세먼지 명령어 작성에 있어 다음과 같이 입력해주세요!\n [옳은 예] .ㅁㅅㅁㅈ 안양2 혹은 .미세먼지 안양2\n [나쁜 예] .ㅁㅅㅁㅈ ㅇㅇ2");
      }
      
      else if (botOn == false) { replier.reply("BOT이 꺼져있습니다!\n[상태] "+ botOn +"\n[사유] "+ botOn_comment); }
   }

   if(msg == ".미세먼지광주" || msg == ".ㅁㅅㅁㅈㄱㅈ" || msg == ".미세먼지 광주" || msg == ".ㅁㅅㅁㅈ ㄱㅈ")
   {
      if (botOn == true) {
         bot_activity_count = bot_activity_count+1;
         replier.reply("[광주광역시] 서석, 농성, 치평, 두암, 운암, 건국, 송정1, 오선, 주월\n\n* 미세먼지 명령어 작성에 있어 다음과 같이 입력해주세요!\n [옳은 예] .ㅁㅅㅁㅈ 운암 혹은 .미세먼지 운암\n [나쁜 예] .ㅁㅅㅁㅈ ㅇㅇ");
      }
      else if (botOn == false) { replier.reply("BOT이 꺼져있습니다!\n[상태] "+ botOn +"\n[사유] "+ botOn_comment); }
   }
   
   if(msg == ".미세먼지제주" || msg == ".ㅁㅅㅁㅈㅈㅈ" || msg == ".미세먼지 제주" || msg == ".ㅁㅅㅁㅈ ㅈㅈ")
   {
      if (botOn == true) {
         bot_activity_count = bot_activity_count+1;
         replier.reply("[제주도] 이도동, 연동, 동홍동, 성산읍, 대정읍, 고산리\n\n* 미세먼지 명령어 작성에 있어 다음과 같이 입력해주세요!\n [옳은 예] .ㅁㅅㅁㅈ 성산읍 혹은 .미세먼지 성산읍\n [나쁜 예] .ㅁㅅㅁㅈ ㅅㅅㅇ");
      }
      else if (botOn == false) { replier.reply("BOT이 꺼져있습니다!\n[상태] "+ botOn +"\n[사유] "+ botOn_comment); }
   }
   
   if(msg == ".미세먼지인천" || msg == ".ㅁㅅㅁㅈㅇㅊ" || msg == ".미세먼지 인천" || msg == ".ㅁㅅㅁㅈ ㅇㅊ")
   {
      if (botOn == true) {
         bot_activity_count = bot_activity_count+1;
         replier.reply("[인천광역시] 신흥, 송림, 구월동, 숭의, 석바위, 부평(역), 연희, 검단, 계산, 고잔, 석남, 송해, 동춘, 운서\n\n* 미세먼지 명령어 작성에 있어 다음과 같이 입력해주세요!\n [옳은 예] .ㅁㅅㅁㅈ 부평 혹은 .미세먼지 부평\n [나쁜 예] .ㅁㅅㅁㅈ ㅂㅍ");
      }
      else if (botOn == false) { replier.reply("BOT이 꺼져있습니다!\n[상태] "+ botOn +"\n[사유] "+ botOn_comment); }
   }
   
   if(msg == ".아텍스서울" || msg == ".ㅇㅌㅅㅅㅇ")
   {
      if (botOn == true) {
         bot_activity_count = bot_activity_count+1;
         station = msg.substring(7,15);
         replier.reply('ITX 남춘천역 → (도착 희망역) 명령어 :\n남춘천역 → (도착 희망역) 작성에 있어 다음과 같이 입력해주세요!\n\n [옳은 예] .아텍스서울 가평 혹은 .ㅇㅌㅅㅅㅇ 가평\n * "가평"역이 도착 희망역임\n [나쁜 예] .ㅇㅌㅅㅅㅇ ㄱㅍ"\n\n* 이전 메뉴 ⇒ .교통');
      }
      else if (botOn == false) { replier.reply("BOT이 꺼져있습니다!\n[상태] "+ botOn +"\n[사유] "+ botOn_comment); }
   }
   
   if(msg == ".아텍스춘천" || msg == ".ㅇㅌㅅㅊㅊ")
   {
      if (botOn == true) {
         bot_activity_count = bot_activity_count+1;
         station = msg.substring(7,15);
         replier.reply('ITX (출발 희망역) → 남춘천역 명령어 :\n(출발 희망역) → 남춘천역 작성에 있어 다음과 같이 입력해주세요!\n\n [옳은 예] .아텍스춘천 청량리 혹은 .ㅇㅌㅅㅅㅇ 청량리\n * "청량리"역이 출발 희망역임\n [나쁜 예] .ㅇㅌㅅㅅㅇ ㅊㄹㄹ"\n\n* 이전 메뉴 ⇒ .교통');
      }
      else if (botOn == false) { replier.reply("BOT이 꺼져있습니다!\n[상태] "+ botOn +"\n[사유] "+ botOn_comment); }
   }

}