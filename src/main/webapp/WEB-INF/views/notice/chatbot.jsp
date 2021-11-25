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
<script src="/js/app.js?"></script>
<link rel="stylesheet" href="/resources/static/css/chatbot.css">
</head>
<body>
	<div class="container" id="main-content" style="margin-top: 20px;">
		<h4 class="mb-3">고객센터 Q&amp;A</h4>
		<div class="input-form-backgroud row">
			<div class="input-form col-md-8 mx-auto">
				<form class="form-inline">
					<div class="form-group" style="margin-bottom: 20px;">
						<button id="connect" class="btn btn-color" type="submit">대화
							시작</button>
						<button id="disconnect" class="btn btn-color" type="submit"
							disabled="disabled">대화 종료</button>
					</div>
				</form>
				<div class="card1">
					<div class="card-header">Chat</div>
					<div class="card-body height3">
						<div id="conversation">
							<ul class="chat-list" id="communicate">
							</ul>
						</div>
					</div>
				</div>
				<form class="form-inline" style="margin-bottom: 20px;">
					<div class="row">
						<div class="col">
							<div class="form-group">
								<input type="text" id="msg" class="form-control"
									placeholder="예시 : 로그인이 안 돼요" value=""
									style="width: 400px; margin-right: 10px;" required>
								<button id="send" class="btn btn-color" disabled type="submit">◃</button>
							</div>
						</div>

					</div>
				</form>
			</div>
			<div class="input-form col-md-4 mx-auto">
				<div class="card-title">자주 하는 질문 목록</div>
				<ul class="list-group list-group-flush">
					<li class="question list-group-item"><a class="text-primary">Q. 로그인이 안 돼요</a>
						<ul class="hide">
							<li class="list">A. 고객센터로 문의 메일 부탁드립니다.</li>
						</ul></li>

					<li class="question list-group-item"><a class="text-primary">Q. 회원가입이 안됩니다</a>
						<ul class="hide">
							<li>A. 회원가입이 되지 않을 경우 문의 주세요</li>
						</ul></li>

					<li class="question list-group-item"><a class="text-primary">Q. 친구매칭이 안 돼요</a>
						<ul class="hide">
							<li>A. 회원가입이 되지 않을 경우 문의 주세요</li>
						</ul></li>

					<li class="question list-group-item"><a class="text-primary">Q. 고객센터 문의할게 있어요</a>
						<ul class="hide">
							<li>A. 회원가입이 되지 않을 경우 문의 주세요</li>
						</ul></li>

					<li class="question list-group-item"><a class="text-primary">Q. 관리자로 어떻게 등록하나요</a>
						<ul class="hide">
							<li>A. 회원가입이 되지 않을 경우 문의 주세요</li>
						</ul></li>
				</ul>

			</div>
		</div>
	</div>
</body>
<script>
	$(document).ready(function() {
		// memu 클래스 바로 하위에 있는 a 태그를 클릭했을때
		$(".question>a").click(function() {
			// 현재 클릭한 태그가 a 이기 때문에
			// a 옆의 태그중 ul 태그에 hide 클래스 태그를 넣던지 빼던지 한다.
			$(this).next("ul").toggleClass("hide");
		});

	});
</script>
</html>