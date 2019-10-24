# 카카오 BOT API Center
<img src="/public/img/bot_logo.png?raw=true">

## 1. INFO
<div align="center"><img src="/public/img/kakao-bot_example.png?raw=true" height="500px"></div>

[KAKAO BOT] 카카오톡 친구추가 : knubot<br/>
[API Homepage] http://Kakao-bot-api.herokuapp.com

* 임시계정
ID : test4674@naver.com
암호 : 123456

## 2. 개발 정보
#### Ruby on Rails
* Ruby : 2.6.3
* Rails : 5.1.7

#### Kakao Bot
* 카카오봇 : javascript 기반 (사용어플 : Messenger Bot [<a href="https://play.google.com/store/apps/details?id=com.xfl.kakaotalkbot">클릭</a>])


## 3. 프로젝트 설명
1. 강원대학교 학생들에게 편의를 위해 제작되었습니다.
2. 첫 대학생활을 시작하는 신입생, 편입생의 편의를 조금이라도 조성해주고,다양한 정보의 접근성을 좀 더 편리하게 해주자는 취지로 제작을 하게 되었습니다.
3. 실제로 프로젝트 총괄을 담당하는 본인도 처음 학교생활을 시작할 때 이런 기초적인 것 조차를 몰라서 학교 생활 정보를 알아내는데에 많은 어려움을 겪었었습니다.
4. 과거에는 카카오톡 오픈채팅이 많이 활성화 되던 시절이 아니었다보니 정보를 탐색하는데에 있어서 더 힘들었는데, 이제는 교내 재학생 분들이 신입생, 편입생들에게 도움을 주기위해 카카오톡 오픈채팅 문화가 점점 발달하고 있고, 이를 노려서 카카오톡 봇을 제작하게 되었습니다.
5. KAKAO BOT 자동응답에 대해선 Messenger Bot 어플을 활용했습니다.
6. 유동적인 응답(학식메뉴, 대학 공지사항)에 대해선 API 서버 내의 JSON 과의 통신을 통해 통신 및 봇 응답이 이루어집니다.

    
## 4. 핵심 코드설명
1. ```Gemfile``` [[gemfile]]  홈페이지에 적용된 Gem(모듈) 입니다.
2. ```bot/kakao-bot.js``` [[kakaobotScript]]  Messenger Bot 어플 내 BOT 코드로 작성될 javascript 코드 입니다.
3. ```lib/tasks/``` [[crawl]]  웹에서 자동적으로 돌아가는 크롤링 자료(rake 파일)들이 모여져 있습니다.
4. ```lib/tasks/crawling_chun_meal_dorm_normal.rake``` [[dormMeal]]  기숙사 식단메뉴를 크롤링 합니다. (Background Job + CronJob을 이용한 크롤링 처리)
5. ```lib/tasks/crawling_chun_notice.rake``` [[univNotice]]  대학 공지사항 내용을 크롤링 합니다.(Background Job + CronJob을 이용한 크롤링 처리)
6. ```lib/tasks/crawling_fine_dust_gangwon.rake``` [[fineDustGangwon]]  강원도 미세먼지 수치를 공공데이터 API을 통해 얻어옵니다.(Background Job + CronJob을 이용한 크롤링 처리)
7. ```app/controllers/crawl_chun_meals_controller.rb``` [[MealController]]  교내 학식 정보에 대해 모델을 참고해서 Text 및 JSON 출력으로 보여줍니다.
8. ```app/controllers/invites_controller.rb``` [[inviteController]]  홈페이지 내 유저 고유의 초대코드를 관리합니다. (초대코드는 우리 사이트의 API Key Value 같은 개념, API 서버 접근 시 해당 Invite Code 대조 및 사용검증)
9. ```app/controllers/messages_controller.rb``` [[messagesController]]  홈페이지 내 유저간 쪽지기능 관련 코드입니다.
10. ```app/controllers/ranks_controller``` [[rankController]]  BOT 기능 중, [롤전적 조회] 기능에 대한 OPGG 사이트 크롤링, 유저의 BOT 내 기능사용에 대한 LOG를 남깁니다. 
11. ```app/models/bot_func_rank.rb``` [[botFuncRankModel]]  botFuncRank(BOT 기능 LOG) 내부 기능에 대해 Model 파일 내에서 처리되는 코드입니다. (* fat models skinny controllers)
12. ```app/controllers/searches_controller.rb``` [[searchController]]  홈페이지 내 글 검색을 다루는 Controller 입니다.
13. ```app/controllers/transfers_controller.rb``` [[transferController]]  전철, ITX-청춘 기차, 교내 통학버스 정보에 대해 모델을 참고해서 Text 및 JSON 출력으로 보여줍니다.

[gemfile]: /Gemfile
[kakaobotScript]: /bot/kakao-bot.js
[crawl]: /lib/tasks/
[dormMeal]: /lib/tasks/crawling_chun_meal_dorm_normal.rake
[univNotice]: /lib/tasks/crawling_chun_notice.rake
[fineDustGangwon]: /lib/tasks/crawling_fine_dust_gangwon.rake
[MealController]: /app/controllers/crawl_chun_meals_controller.rb
[inviteController]: /app/controllers/invites_controller.rb
[messagesController]: /app/controllers/messages_controller.rb
[rankController]: /app/controllers/ranks_controller
[botFuncRankModel]: /app/models/bot_func_rank.rb
[searchController]: /app/controllers/searches_controller.rb
[transferController]: /app/controllers/transfers_controller.rb


## 5. BOT이 작동하는 원리
<img src="/public/img/bot_prosess.png?raw=true" width="100%">

* 위 이미지 자료는 '대학 장학' 크롤링 과정을 담은 Process임.


## 6. Messenger Bot에서 지원하는 메소드/함수 간단 설명
[참고] http://semicolon1.dothome.co.kr/kakaobot.html
1. ```room``` 현재 내가 입장한 방 이름을 출력
2. ```msg``` 카카오톡 메세지
3. ```sender``` 메세지를 보내는 사람
4. ```replier``` 메세지를 받는 사람
5. ```isGroupChat``` 그륩채팅 확인 여부
6. ```replier.reply("Hello, World")``` 카카오 메세지(응답)
7. ```msg.indexOf("안녕하세요") != -1``` 메세지 원문 검색
    * "안녕"만 보내도 "안녕하세요" 탐색
8. ```msg.substring(n,m)``` 메세지 원문 중 n~m번 째 단어를 가져옴.
    * "안녕하세요".substring(3,5) = "하세요"
9. ```Utils.getWebText("(URL)","Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36",false,false);``` 크롤링을 지원하는 함수 (* 비전문적)
10. ```msg.replace(/(<([^>]+)>)/g, "")``` 크롤링시 많이 쓰이는 태그로서, 태그를 없애줌.
11. ```msg.trim()``` 크롤링 시 많이 쓰이는 태그로서, 공백을 없애줌.


## 7. M : 모델 설명
* Alarm : BOT 기능 중 사자후 기능에 의해 전체 메세지가 발송될 때, 메세지가 발송될 채팅방 목록
* BotFuncRank : 사용자가 BOT 명령어를 쓸 때, 해당 명령어의 사용에 대해 명령어 사용 Count
* Bulletin : 홈페이지 내 게시판 카테고리
* Comment : 홈페이지 내 댓글 (Post 모델에 의존)
* Conversation : 홈페이지 내 쪽지 기능
* CrawlChunFineDust : 미세먼지 데이터를 담아두는 모델
* CrawlChunMeal : 학식 메뉴 데이터를 담아두는 모델
* CrawlChunNotice : 홈페이지 공지사항 데이터를 담아두는 모델
* Invite : 초대코드(API Key Value)를 담아두는 모델 (API 서버 접근 시 해당 Invite Code 대조 및 사용검증)
* Log : 홈페이지 내 API 서비스 접근 시, 유저에 대한 접근 기록을 담아두는 모델
* Post : 홈페이지 내 게시판 (Bulletin 모델에 의존)
* User : 홈페이지 유저 정보를 담아두는 모델

## 8. 카카오 BOT 유의사항
1. 전역변수 외 BOT 명령어는 ```function response(...)``` 함수 내에서 작성해주세요.
2. 크롤링이 필요한 명령어 개발은 웬만하면 Ruby on rails 혹은 Django(Python), Spring 등을 활용을 해주세요.
    * 카카오 BOT 내에서도 크롤링 함수가 지원되긴 하나, 비전문적입니다.


## 9. 라이센스
<div align="center"><img src="/public/img/bear.png?raw=true" width="250px"></div><br/>

1. 강원대학교 대외협력팀 측으로 부터 대학 공지사항, 장학 정보, 학사 일정, 셔틀버스, 학교 식단표 정보수집 허용을 받았습니다.
2. 강원대학교 대외협력팀으로 부터 곰두리 캐릭터 라이센스 승인을 받아냈습니다.
    * 수익적인 목적으로 사용 금지


## 10. 카카오 운영정책 관련
<img src="/public/img/kakao_reply.jpg?raw=true" width="250px">

1. 곰두리 BOT은 <a target="_blank" href="https://www.kakao.com/policy/oppolicy">카카오 운영정책</a>을 준수합니다.