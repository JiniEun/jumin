<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<title>회원목록</title>
<meta charset="utf-8">
<style>
.card {
	max-width: 680px;
	margin-top: 50px;
	padding: 30px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}

.btn-color {
	border-color: #5BA6A6;
	color: #5BA6A6;
}
</style>
<script type="text/javascript">
	function read(ID) {
		var url = "${root}/user/read/";
		url += ID;

		location.href = url;
	}
</script>
</head>
<body>
	<div class="container" style="margin-top: 10px;">
		<h3 style="margin-bottom: 10px;">회원목록</h3>
		<form class="form-inline" method="post" action="list">
			<div class="form-group" style="margin-right: 10px;">
				<select name="col" class="form-control">
					<option value="uname" <c:if test="${col=='uname' }">selected</c:if>>성명</option>
					<option value="id" <c:if test="${col=='id' }">selected</c:if>>아이디</option>
					<option value="email" <c:if test="${col=='email' }">selected</c:if>>이메일</option>
					<option value="total" <c:if test="${col=='total' }">selected</c:if>>전체출력</option>
				</select>
			</div>

			<div class="form-group" style="margin-right: 10px;">
				<input type="text" class="form-control" name="word" value="${word}">
			</div>
			<button class="btn btn-color" style="margin-right: 10px;">검색</button>
			<button class="btn btn-color" type="button"
				style="margin-right: 10px;" onclick="location.href='/user/create'">등록</button>
		</form>

		<br>

		<c:forEach var="dto" items="${list}">
			<table class="table table-bordered">
				<tr>
					<td rowspan="5" class="col-sm-2"><img
						src="/user/storage/${dto.fileName}" class="img-rounded"
						width="200px" height="200px"></td>
					<th class="col-sm-2">아이디</th>
					<td class="col-sm-8"><a href="javascript:read('${dto.ID}')">${dto.ID}</a></td>
				</tr>
				<tr>
					<th class="col-sm-2">성명</th>
					<td class="col-sm-8">${dto.uname}</td>
				</tr>
				<tr>
					<th class="col-sm-2">전화번호</th>
					<td class="col-sm-8">${dto.phone}</td>
				</tr>
				<tr>
					<th class="col-sm-2">이메일</th>
					<td class="col-sm-8">${dto.email}</td>
				</tr>
				<tr>
					<th class="col-sm-2">주소</th>
					<td class="col-sm-8">${dto.address1}${dto.address2}</td>
				</tr>
			</table>
		</c:forEach>
		${paging}

	</div>
</body>
</html>