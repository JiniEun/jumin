<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chatbot</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<%-- WebSocket 관련 설정 --%>
<%--/static 폴더 기준 --%>
<script src="/js/sockjs.min.js"></script>
<script src="/js/stomp.min.js"></script>
<script type="text/JavaScript" src="/js/app.js"></script>
<style>
.input-form {
	max-width: 680px;
	margin-top: 20px;
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
</head>
<body>
	<div class="container" id="main-content" style="margin-top: 20px;">
		<h4 class="mb-3">고객센터 Q&A</h4>
		<div class="input-form-backgroud row">
			<div class="input-form col-md-8 mx-auto">
				<form class="form-inline">
					<div class="form-group" style="margin-bottom: 20px;">
						<label for="connect">chatbot 연결:</label>
						<button id="connect" class="btn btn-color" type="submit">연결</button>
						<button id="disconnect" class="btn btn-color" type="submit"
							disabled="disabled">해제</button>
					</div>
				</form>
				<form class="form-inline" style="margin-bottom: 20px;">
					<div class="row">
						<div class="col">
							<div class="form-group">
								<input type="text" id="msg" class="form-control"
									placeholder="내용을 입력하세요...." value="예시 : 로그인이 안 돼요"
									style="width: 400px; margin-right:10px;" required>
									<button id="send" class="btn btn-color" disabled type="submit">◃</button>
							</div>
						</div>
						
					</div>
				</form>
				<div class="row">
					<div class="col-md-12">
						<table id="conversation" class="table table-striped">
							<thead>
								<tr>
									<th>메세지</th>
								</tr>
							</thead>
							<tbody id="communicate">
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="input-form col-md-4 mx-auto">
				<div class="card-title">질문 목록</div>
				<div class="card-body">로그인이 안 돼요</div>
				<div class="card-body">회원가입이 안됩니다</div>
				<div class="card-body">친구매칭이 안 돼요</div>
				<div class="card-body">고객센터 문의할게 있어요</div>
				<div class="card-body">관리자로 어떻게 등록하나요</div>
			</div>
		</div>
	</div>
</body>
</html>