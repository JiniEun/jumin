# Dongne
   
> ## Spring Boot 기반 웹 프로젝트

- 프로젝트 주제 및 목적

**동네의 정보를 제공하고 주민 간 정보를 공유할 수 있는 종합 커뮤니티 웹 제작** <br><br>
내가 살고 있는 동네의 정보를 한 번에 확인하고, <br>
사용자 간 동네의 실시간 정보를 빠르게 주고받을 수 있도록 한다. <br>
흩어져 있는 동네의 여러 정보들을 해당 종합 커뮤니티 웹 서비스를 통해 편리하게 접근하고, <br>
같은 지역내의 사용자 간의 자유로운 정보 공유를 가능하도록 한다. 

<br><br>

## Project 개요

### 주요 구현 기능

- UI 계층도 (홈페이지 계층 구조도)

<img src="https://user-images.githubusercontent.com/49184115/144734032-3a5a0fdc-bf93-4323-a8a8-2b3ac713e370.png" alt="main" style="width:600px;"/>

<br>

1. 메인 페이지 (코로나 정보, 날씨, 각 게시판 최근 게시물) 

<img src="https://user-images.githubusercontent.com/49184115/144734249-55ba78eb-a5fb-461d-8176-6d78c8550daf.png" alt="main" style="width:400px;"/>

사용자의 접속 위치 기반
날씨와 코로나 현황 자료 제공

<br>

2. 로그인 및 회원가입

<img src="https://user-images.githubusercontent.com/49184115/144734334-3316f26a-3e95-4e8b-a101-aaa4e5fa03d3.png" alt="main" style="width:400px;"/>
<img src="https://user-images.githubusercontent.com/49184115/144734349-bd6b02ac-939e-4f7f-a911-daa0d9c420a3.png" alt="main" style="width:400px;"/>

<br>

3. 동네 나들이 (주요시설, 동네스팟)

<img src="https://user-images.githubusercontent.com/49184115/144734456-5784b390-8e22-404b-9e26-deebfd4ff6a8.png" alt="main" style="width:400px;"/>

- 주요 시설

지역 내 공공기관, 주요 시설  소개 및 naver map api를 활용한 위치 표시 <br>
지도 로드맵 연동

<br>

<img src="https://user-images.githubusercontent.com/49184115/144734490-fd012727-6668-4e0e-ad09-a45f6a220782.png" alt="main" style="width:400px;"/>

- 동네 스팟

글 작성 시 평점 부여 <br>
게시물별 SNS 공유 기능 (카카오, 트위터, 페이스북) <br>
해당 게시물 지도 검색 (네이버 지도 링크)

<br>

4. 동네 장터

<img src="https://user-images.githubusercontent.com/49184115/144734769-4cedcb85-3e71-4d8d-a879-2fae439af558.png" alt="main" style="width:400px;"/>

- 같은 지역 내의 사용자 간의 중고거래 기능을 담은 게시판
- 카테고리 별로 조회할 수 있으며 검색 기능을 이용해 원하는 제품명을 검색하여 조회가 가능
- 댓글 기능

<br>

5. 동네 모임 (동호회, 동네친구)

<img src="https://user-images.githubusercontent.com/49184115/144734618-f0dab0fa-eaf7-4732-a8fa-0b08f1e7ac6d.png" alt="main" style="width:400px;"/>

- 동호회

우리 동네 동호회, 모임 소개 및 소식 공유 <br>
ckeditor를 이용한 게시글 등록 <br>
댓글 기능 <br>

<img src="https://user-images.githubusercontent.com/49184115/144734541-7e6f28a7-c19c-4f2f-9dda-915096f44ec4.png" alt="main" style="width:400px;"/>

- 동네친구

동네 친구 모집 글 등록 및 신청하여 회원 간 매칭 <br>
쪽지 기능 <br>
게시글에 연령대와 성별을 표시하여 이용자 간 소통에 원활함 제공 <br>

<img src="https://user-images.githubusercontent.com/49184115/144734652-ce0a9d6f-eb58-4d00-8797-0e030d057596.png" alt="main" style="width:400px;"/>

- 쪽지 기능

<br>

6. 동네 커뮤니티

<img src="https://user-images.githubusercontent.com/49184115/144734676-2fd9c1eb-b089-430c-aecd-1b7649821442.png" alt="main" style="width:400px;"/>
<img src="https://user-images.githubusercontent.com/49184115/144734679-918db283-3df2-47d4-a4f8-109927c36b2f.png" alt="main" style="width:400px;"/>

- 회원들 간 동네 실시간 소식 공유 자유 게시판
- 댓글 기능을 포함한 자유로운 의사소통 가능

<br>

7. 고객센터(공지사항, 챗봇)

<img src="https://user-images.githubusercontent.com/49184115/144734720-bdcdde2d-dbe9-4aec-b75c-306fd45cca68.png" alt="main" style="width:400px;"/>

- 공지사항

웹 페이지의 공지사항 게시판 역할

- Q&A 챗봇

간단한 질문들을 담은 챗봇 게시판 <br>
Naver Clova Chatbot을 이용해 서비스 제공. 

<br><br><br>

### DB ERD

<img src="https://user-images.githubusercontent.com/49184115/144734084-8a610498-ceb3-4f26-a698-33333c925cff.png" alt="main" style="width:600px;"/>

<br><br>

> ## 개발 환경

<br>

- ![Java](https://img.shields.io/badge/-Java-007396?logo=java&logoColor=white&style=flat-square&logoHeight=50) / ![SpringBoot](https://img.shields.io/badge/-Springboot-6DB33F?logo=springboot&logoColor=white&style=flat-square&logoHeight=50)
- AWS - Oracle DB
- ![JSP](https://img.shields.io/badge/-Jsp-F7DF1E?logo=jsp&logoColor=white&style=flat-square&logoHeight=50)
- ![Bootstrap](https://img.shields.io/badge/-Bootstrap-7952B3?logo=Bootstrap&logoColor=white&style=flat-square&logoHeight=50)

<img src="https://user-images.githubusercontent.com/49184115/144734852-2c8a54e5-f320-40e4-8fa8-467e10b9bb2a.png" alt="main" style="width:600px;"/>

