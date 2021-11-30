<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.btn-color2 {
	background-color: #5BA6A6;
	color: white;
}
</style>
<script type="text/javascript">
	function read(fbID) {
		var url = "read";
		url += "?fbID=" + fbID;
		url += "&col=${col}";
		url += "&word=${word}";
		url += "&nowPage=${nowPage}";
		location.href = url;

	}
</script>
</head>
<body>
	<div class="container" style="margin-top: 15px;">
		<h2 style="color:#5BA6A6;">동네친구</h2>
		<br>
		<form class="form-inline" action="list">
			<div class="form-group">
				<select class="form-control" name="col" style="margin-right: 10px;">
					<option value="total"
						<c:if test= "${col=='total'}"> selected </c:if>>전체출력</option>
					<option value="title"
						<c:if test= "${col=='title'}"> selected </c:if>>제목</option>
					<option value="content"
						<c:if test= "${col=='content'}"> selected </c:if>>내용</option>
					<option value="title_content"
						<c:if test= "${col=='title_content'}"> selected</c:if>>제목+내용</option>
				</select>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="검색어를 입력하세요"
					name="word" style="margin-right: 10px;" value="${word}">
			</div>
			<button type="submit" class="btn btn-color2"
				style="margin-right: 10px;">검색</button>
			<c:if
				test="${not empty sessionScope.ID}">
				<button type="button" class="btn btn-color2"
					onclick="location.href='../fboard/create'">등록</button>
			</c:if>
		</form>
		<br>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>카테고리</th>
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
								<td>${dto.category}</td>
								<td><a href="javascript:read('${dto.fbID}')" class="text-dark">${dto.title}</a></td>
								<td>${dto.nickname}</td>
								<td>${dto.rdate }</td>
								<td>${dto.viewcnt }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<div>${paging}</div>
	</div>
</body>
</html>