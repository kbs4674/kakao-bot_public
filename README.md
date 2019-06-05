# 카카오 BOT 프로젝트 : 곰두리 BOT

## 개발
#### 김철민


## 1. INFO
<img src="/image/kakao-bot_example2.jpg?raw=true" width="500px">

[Demo] 카카오톡 친구추가 : knubot

## 2. 개발 환경 정보
* 카카오 BOT : javascript 기반
    * 구글 플레이스토어에서 '<a href="https://play.google.com/store/apps/details?id=com.xfl.kakaotalkbot">카카오톡 봇</a>' 다운로드
* 크롤링 : Ruby on Rails 5.1.6


## 3. 프로젝트 개요
1. 강원대학교 학생들에게 편의를 위해 제작되었습니다.
2. 첫 대학생활을 시작하는 신입생, 편입생의 편의를 조금이라도 조성해주고,다양한 정보의 접근성을 좀 더 편리하게 해주자는 취지로 제작을 하게 되었습니다.
3. 실제로 프로젝트 총괄을 담당하는 본인도 처음 학교생활을 시작할 때 이런 기초적인 것 조차를 몰라서 학교 생활 정보를 알아내는데에 많은 어려움을 겪었었습니다.
4. 과거에는 카카오톡 오픈채팅이 많이 활성화 되던 시절이 아니었다보니 정보를 탐색하는데에 있어서 더 힘들었는데, 이제는 교내 재학생 분들이 신입생, 편입생들에게 도움을 주기위해 카카오톡 오픈채팅 문화가 점점 발달하고 있고, 이를 노려서 카카오톡 봇을 제작하게 되었습니다.


## 4. 핵심 코드파일
1. ```kakao-bot.js``` [<a target="_blank" href="/kakao-bot.js">이동</a>] 카카오 Bot 동작을 이루는 코드
2. ```crawling_rake_file/``` [<a href="/crawling_rake_file">이동</a>] 카카오 Bot 이 반응하는 일부 답변 중, 학식메뉴, 교통정보 등 유동적으로 답변을 할 필요가 있는 정보에 대해 크롤링을 하는 코드
    * 해당 코드는 Ruby on Rails 기반에서 작동이 되는 task 파일들입니다.


## 5. BOT이 작동하는 원리
<img src="/image/bot_prosess.jpg?raw=true" height="250px">

* 위 이미지 자료는 '대학 장학' 크롤링 과정을 담은 Process임.

## 6. 카카오 BOT 코드 간단 설명
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


## 7. 카카오 BOT 유의사항
1. 전역변수 외 BOT 명령어는 ```function response(...)``` 함수 내에서 작성해주세요.
2. 크롤링이 필요한 명령어 개발은 웬만하면 Ruby on rails 혹은 Django(Python) 활용을 해주세요.
    * 카카오BOT에서도 크롤링 함수가 지원되긴 하나, 비전문적 입니다.


## 7. 라이센스
<div align="center"><img src="/image/bear.png?raw=true" width="250px"></div><br/>

1. 강원대학교 대외협력팀 측으로 부터 대학 공지사항, 장학 정보, 학사 일정, 셔틀버스, 학교 식단표 정보수집 허용을 받았습니다.
2. 강원대학교 대외협력팀으로 부터 곰두리 캐릭터 라이센스 승인을 받아냈습니다.
    * 수익적인 목적으로 사용 금지


## 8. 카카오 운영정책 관련
<img src="/image/kakao_reply.jpg?raw=true" width="250px">

1. 곰두리 BOT은 <a target="_blank" href="https://www.kakao.com/policy/oppolicy">카카오 운영정책</a>을 준수합니다.