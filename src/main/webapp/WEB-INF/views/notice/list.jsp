<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container" style="margin-top: 15px;">
		<h3>공지사항</h3>
		<br>
		<form class="form-inline" action="./list">
			<div class="form-group">
				<select class="form-control" name="col" style="margin-right: 10px;">
					<option value="total">전체출력</option>
					<option value="wname">작성자</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="title_content">제목+내용</option>
				</select>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="검색어를 입력하세요"
					name="word" style="margin-right: 10px;">
			</div>
			<button type="submit" class="btn"
				style="background-color: #5BA6A6; color: white; margin-right: 10px;">검색</button>
			<c:if
				test="${not empty sessionScope.ID && sessionScope.grade == 'A'}">
				<button type="button" class="btn" style="background-color: #5BA6A6; color: white;" onclick="location.href='create'">등록</button>
			</c:if>
		</form>
		<br>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan="6">등록된 글이 없습니다.</td>
					</c:when>
					<c:otherwise>

						<c:forEach var="dto" items="${list}">
							<tr>
								<td>${dto.nID}</td>
								<td><a href="#" class="text-dark">${dto.title}</a></td>
								<td>${dto.ID}</td>
								<td>${dto.rdate }</td>
								<td>${dto.viewcnt }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>

			</tbody>
		</table>
	</div>
</body>
</html>