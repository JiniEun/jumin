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
</style>
</head>
<body>
	<div class="container-sm">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">고객센터 Q&A</h4>
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
				<div>자주 사용하는 질문</div>

			</div>
		</div>
	</div>
	<script>
            window.addEventListener('load', () => { const forms = document.getElementsByClassName('validation-form'); Array.prototype.filter.call(forms, (form) => { form.addEventListener('submit', function (event) { if (form.checkValidity() === false) { event.preventDefault(); event.stopPropagation(); } form.classList.add('was-validated'); }, false); }); }, false);
        </script>
</body>
</html>