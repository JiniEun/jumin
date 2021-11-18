<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chatbot</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<%-- WebSocket 관련 설정 --%>
<%--/static 폴더 기준 --%>
<script src="../js/sockjs.min.js"></script>
<script src="../js/stomp.min.js"></script>
<script type="text/JavaScript" src="../js/app.js"></script>
<style>
.input-form {
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
</head>
<body>
	<!-- <div class="container-sm" id="main-content">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">고객센터 Q&A</h4>
				<form class="form-inline">
					<div class="form-group">
						<label for="connect">웹소켓 연결:</label>
						<button id="connect" class="btn btn-color" type="submit">연결</button>
						<button id="disconnect" class="btn btn-color" type="submit"
							disabled="disabled">해제</button>
					</div>
				</form>
				<form class="form-inline">
					<div class="row">
						<div class="col">
							<div class="form-group" style="width: 80%;">
								<input type="text" id="msg" class="form-control"
									placeholder="내용을 입력하세요...." value="로그인이 안 돼요"
									style="width: 90%;" required>
							</div>
						</div>
						<div class="col-md-2">
							<button id="send" class="btn btn-color" disabled type="submit">◃</button>
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
				<div>자주 사용하는 질문</div>
			</div>
		</div>
	</div> -->
	<div id="main-content" class="container">
    <H2>개발 가이드</H2>
            <form class="form-inline">
                <div class="form-group">
                    <label for="connect">웹소켓 연결:</label>
                    <button id="connect" class="btn btn-default" type="submit">연결</button>
                    <button id="disconnect" class="btn btn-default" type="submit" disabled="disabled">해제</button>
                </div>
            </form>
            <form class="form-inline">
                <div class="form-group" style="width: 90%;">
                    <label for="msg">문의</label>
                    <input type="text" id="msg" class="form-control" placeholder="내용을 입력하세요...." value="JAVA에 대해서 알려주세요."  style="width:90%;">
                </div>
                <button id="send" class="btn btn-default" disabled type="submit">보내기</button>
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
</body>
</html>