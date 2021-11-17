<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<div class="container-sm">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">고객센터 Q&A</h4>
				<form class="form-inline">
					<div class="form-group">
						<label for="connect">웹소켓 연결:</label>
						<button id="connect" class="btn btn-default" type="submit">연결</button>
						<button id="disconnect" class="btn btn-default" type="submit"
							disabled="disabled">해제</button>
					</div>
				</form>
				<form class="validation-form" novalidate>
					<div class="row">
						<div class="col-md-6 mb-3">
							<input type="text" class="form-control" id="name" placeholder=""
								value="" required>
						</div>
						<div class="col-md-6 mb-3">
							<button class="btn" type="submit"
								style="background-color: #5BA6A6; color: white;"><</button>

						</div>

					</div>
				</form>
				<form class="form-inline">
					<div class="form-group" style="width: 80%;">
						<label for="msg">문의</label> <input type="text" id="msg"
							class="form-control" placeholder="내용을 입력하세요...."
							value="JAVA에 대해서 알려주세요." style="width: 90%;">
					</div>
					<button id="send" class="btn btn-color" disabled type="submit">보내기</button>
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
	</div>
	<script>
            window.addEventListener('load', () => { const forms = document.getElementsByClassName('validation-form'); Array.prototype.filter.call(forms, (form) => { form.addEventListener('submit', function (event) { if (form.checkValidity() === false) { event.preventDefault(); event.stopPropagation(); } form.classList.add('was-validated'); }, false); }); }, false);
        </script>
</body>
</html>