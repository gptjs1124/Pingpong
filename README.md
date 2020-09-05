# 개요
- 프로젝트명 : pingpong
- 일정 : 2020년 06월 17일 ~ 2020년 07월 20일
- 팀구성 : 김혜선,박선호,이재경,이효섭,정은하,채나은
- 개발 목표 : 서로 모국어 및 자신이 할 수 있는 언어를 다른 사라들과 교환하여 언어 학습 할 수 있는 사이트
- 사용기술 및 개발환경
```
- 서버 : EC2 ( Amazone ) , Apache Tomcat v8.5
- Java EE IDE(통합개발환경) : Eclipse, Spring
- Database : ORACLE SQL Developer, mybatis
- 사용언어 : JAVA, HTML, CSS, Javascript, JSP, SQL, EL/JSTL
- 라이브러리 : jQuery, AJAX, Bootstrap, Web Socket, sojaeji.js, chart.js, datepicker-ko.js
- API : Kakao Login, kakao MAP, kakao Address, PAPAGO, summer note API, i'mport
```
# 구현 기능
```
회원 
- KAKAO Login API를 이용한 SNS 로그인 
- 이메일 전송 
- sojaeji.js를 이용한 위치 선택 
- 아이디 찾기, 비밀번호 찾기 
- Scheduler를 이용한 나이 증가 

마이 페이지 
- 내 정보 출력, 수정 
- AOP로 이용 제한(로그인 안 한 경우 로그인 페이지 이동) 

소식통 게시판 
- 게시글 등록, 수정, 삭제, 출력 
- Summernote API를 이용한 게시글 등록 
- Datepicker를 이용한 날짜 지정 
- KAKAO Address API를 이용한 장소 지정 
- 파일 업로드, 다운로드 
- 게시글 출력 형태 지정(최신순/인기순) 
- AOP를 이용한 게시글 등록 제한(로그인 안 한 경우 로그인 페이지 이동) 
```
# 클래스다이어그램
Member / Mypage / New
https://github.com/gytjq456/pingpong/issues/165


# 유스케이스다이어그램
Member / Mypage / New
https://github.com/gytjq456/pingpong/issues/166

