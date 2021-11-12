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

.btn-default {
	border-color: #ced4da;
	color: #212529;
}

#idcheck, #emailcheck {
	color: red;
}
</style>
<script type="text/javascript">
  function idCheck(id){
	  if(id==''){
		  alert("아이디를 입력하세요");
		  document.frm.ID.focus();
	  }else{
		  var url = "idcheck";
		  var param = "ID="+id;
		  
		  $.get(url, param, function(data, textStatus) {

			  $("#idcheck").text(data.str);
		  })
	  }
  } 
  
  function emailCheck(email){
	  if(email==''){
		  alert("email를 입력하세요");
		  document.frm.email.focus();
	  }else{
		  var url = "emailcheck";
		  url += "?email="+email;
		  
		  $.get(url, function(data, textStatus) {
			  
			  $("#emailcheck").text(data.str);
		  	
		  })
	  }
  }
  function inCheck(f){
	  if(f.uname.value.length==0){
			alert("이름을 입력하세요");
			f.uname.focus();
			return false;
		}
	  if(f.nickname.value.length==0){
			alert("별명을 입력하세요");
			f.nickname.focus();
			return false;
		}
	  if(f.ID.value.length==0){
			alert("아이디를 입력하세요");
			f.id.focus();
			return false;
		}
		if(f.password.value.length==0){
			alert("비번을 입력하세요");
			f.passwd.focus();
			return false;
		}
		if(f.repassword.value.length==0){
			alert("비번확인을 입력하세요");
			f.repassword.focus();
			return false;
		}
	  if(f.password.value != f.repassword.value){
			alert("비번과 비번확인이 일치하지 않습니다.");
			f.password.value="";
			f.repassword.value="";
			f.password.focus();
			return false;
	  }
	  if(f.phone.value.length==0){
			alert("전화번호를 입력하세요");
			f.phone.focus();
			return false;
		}
	  if(!$("#aggrement").is(":checked")){
		  return false;
	  }
  }
  </script>
</head>
<body>
	<div class="container-sm">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3">회원가입</h4>
				<form class="validation-form" novalidate action="create"
					method="post" name='frm' enctype="multipart/form-data" onsubmit="return inCheck(this)">
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="uname">이름</label> <input type="text"
								class="form-control" id="uname" name="uname" placeholder="" value="" required>
							<div class="invalid-feedback">이름을 입력해주세요.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="nickname">별명</label> <input type="text"
								class="form-control" id="nickname" placeholder="" name="nickname" value=""
								required>
							<div class="invalid-feedback">별명을 입력해주세요.</div>
						</div>
					</div>
					<label for="ID">ID</label>
					<div class="row">
						<div class="col-md-6 mb-3">
							<input type="text" class="form-control col" id="ID"
								placeholder="Enter ID" name="ID" required>
							<div class="invalid-feedback">아이디를 입력해주세요.</div>
							<div id="idcheck"></div>
						</div>
						<div class="col-md-4">
							<button type="button" class="btn btn-default"
								onclick="idCheck(document.frm.ID.value)">ID 중복확인</button>
						</div>
					</div>
					<label for="email">이메일</label>
					<div class="row">
						<div class="col-md-6 mb-3">
							<input type="text" class="form-control col" id="email"
								placeholder="you@example.com" name="email" required>
							<div class="invalid-feedback">이메일을 입력해주세요.</div>
							<div id="emailcheck"></div>
						</div>
						<div class="col-md-4">
							<button type="button" class="btn btn-default"
								onclick="emailCheck(document.frm.email.value)">Email
								중복확인</button>
						</div>
					</div>
					<div class="mb-3">
						<label for="password">비밀번호</label> <input type="password"
							class="form-control" id="password" name="password" placeholder="password"
							required>
						<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="repassword">비밀번호 확인</label> <input type="password"
							class="form-control" id="repassword" placeholder="repassword"
							required>
						<div class="invalid-feedback">비밀번호 확인</div>
					</div>
					<div class="row">
						<div class="col-md-2 mb-3">
							<label for="gender">성별</label> 
							<select class="custom-select d-block w-100" id="gender" name="gender">
								<!-- <option value=""></option> -->
								<option value="Male">남성</option>
								<option value="Female">여성</option>
							</select>
							<div class="invalid-feedback">성별을 선택해주세요.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="birth">생년월일</label> <input type="date"
								class="form-control" id="birth" name="birth" placeholder="birth"required>
							<div class="invalid-feedback">생년월일</div>
						</div>
					</div>
					<div class="mb-3">
						<label for="phone">전화번호</label> <input type="tel"
							class="form-control" id="phone" name="phone" placeholder="010-0000-0000"
							pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required>
						<div class="invalid-feedback">전화번호를 입력해주세요</div>
					</div>
					<div class="mb-3">
						<label for="address">주소</label> <input type="text"
							class="form-control" id="address1" name="address1" placeholder="서울특별시 강남구"
							required>
						<div class="invalid-feedback">주소를 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="address2">상세주소<span class="text-muted">&nbsp;(필수
								아님)</span></label> <input type="text" class="form-control" id="address2" name="address2"
							placeholder="상세주소를 입력해주세요.">
					</div>
					<hr class="mb-4">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="aggrement"
							required> <label class="custom-control-label"
							for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
					</div>
					<div class="mb-4"></div>
					<button class="btn btn-color btn-lg btn-block" type="submit">가입
						완료</button>
				</form>
			</div>
		</div>
	</div>
	<script>
        window.addEventListener('load', () => { const forms = document.getElementsByClassName('validation-form'); Array.prototype.filter.call(forms, (form) => { form.addEventListener('submit', function (event) { if (form.checkValidity() === false) { event.preventDefault(); event.stopPropagation(); } form.classList.add('was-validated'); }, false); }); }, false);
    </script>
</body>
</html>