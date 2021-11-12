<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="util" uri="/ELFunctions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓 메인 페이지</title>
	<style>
         
         #form{ 
          padding: 2em 0 2em 0;
          
        }
        #top{
          padding: 2em 0 4em 0;
        }
        #g1
        {
          text-align: center;
          margin-bottom: 40px;
        }
        #one {
          list-style: none;
          display: inline-block;
          border: 1px solid #5BA6A6;
          margin: 7px;
        }

        #two {
          padding: 10px 30px;
          display: flex;
          align-items: center;
          justify-content: center;
          text-decoration: none;
          color: #5BA6A6;
          background-color: transparent;
        }

        #two.active,
        #two:hover {
          background-color: #5BA6A6;
          color: white;
        }
    </style>

</head>
<body>

    <div id="features-wrapper">
      <div class="container">
        <div id="top">
        <h2 class="col-12 text-center tm-section-title">동네 장터</h2>
        <p class="col-12 text-center">다양한 물품들을 서로 거래해 보세요.<br><br>
        <button type="button" class="btn" onclick="location.href='../market/create'" style="border-color:#5BA6A6; color: #5BA6A6;">상품등록하기</button></p>
        </div>
        
        <div class="tm-paging-links">
          <nav>
            <ul id="g1">
              <li class="tm-paging-item" id="one"><a href="#" class="tm-paging-link active" id="two">전자제품</a></li>
              <li class="tm-paging-item" id="one"><a href="#" class="tm-paging-link" id="two">의류</a></li>
              <li class="tm-paging-item" id="one"><a href="#" class="tm-paging-link" id="two">기타</a></li>
            </ul>
          </nav>
        </div>
        <c:set var="list" value="${list}"/>          
        <div class="row">
        <c:forEach var="dto" begin="0" end="3" items="${list}">
          <div class="col-4 col-12-medium">

            <!-- Box -->
              <section class="box feature">
                <a href="#" class="image featured"><img src="/static/images/market/${dto.filename }" alt="" width="300" height="300"/></a>
                <div class="inner">
                  <header>
                    <h4>${dto.title} </h4>
                    <p>${dto.id} </p>
                  </header>
                  <p>서울시 강남구</p>
                </div>
              </section>
		</c:forEach>
          </div>
          <c:forEach var="dto" begin="4" end="7" items="${list}">
          <div class="col-4 col-12-medium">

            <!-- Box -->
              <section class="box feature">
                <a href="#" class="image featured"><img src="/static/images/market/${dto.filename }" alt="" width="300" height="300"/></a>
                <div class="inner">
                  <header>
                    <h4>${dto.title}</h4>
                    <p>${dto.id}</p>
                  </header>
                  <p>서울시 강남구</p>
                </div>
              </section>
			
          </div>
          </c:forEach>
          <c:forEach var="dto" begin="4" end="7" items="${list}">
          <div class="col-4 col-12-medium">

            <!-- Box -->
              <section class="box feature">
                <a href="#" class="image featured"><img src="/static/images/market/${dto.filename }" alt="" width="300" height="300"/></a>
                <div class="inner">
                  <header>
                    <h4>${dto.title}</h4>
                    <p>${dto.id}</p>
                  </header>
                  <p>서울시 강남구</p>
                </div>
              </section>

          </div>
          </c:forEach>
        </div>
        ${paging}
      </div>
   

</body>