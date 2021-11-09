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
                <h4 class="mb-3">회원가입</h4>
                <form class="validation-form" novalidate>
                    <div class="row">
                        <div class="col-md-6 mb-3"> <label for="name">이름</label> <input type="text" class="form-control"
                                id="name" placeholder="" value="" required>
                            <div class="invalid-feedback"> 이름을 입력해주세요. </div>
                        </div>
                        <div class="col-md-6 mb-3"> <label for="nickname">별명</label> <input type="text"
                                class="form-control" id="nickname" placeholder="" value="" required>
                            <div class="invalid-feedback"> 별명을 입력해주세요. </div>
                        </div>
                    </div>
                    <div class="mb-3"> <label for="id">ID</label> <input type="text" class="form-control" id="id"
                            placeholder="Enter ID" required>
                        <div class="invalid-feedback">아이디를 입력해주세요.</div>
                    </div>
                    <div class="mb-3"> <label for="email">이메일</label> <input type="email" class="form-control"
                            id="email" placeholder="you@example.com" required>
                        <div class="invalid-feedback"> 이메일을 입력해주세요. </div>
                    </div>
                    <div class="mb-3"> <label for="password">비밀번호</label> <input type="password" class="form-control"
                            id="password" placeholder="password" required>
                        <div class="invalid-feedback"> 비밀번호를 입력해주세요. </div>
                    </div>
                    <div class="mb-3"> <label for="repassword">비밀번호 확인</label> <input type="password"
                            class="form-control" id="repassword" placeholder="repassword" required>
                        <div class="invalid-feedback"> 비밀번호 확인</div>
                    </div>
                    <div class="row">
                        <div class="col-md-2 mb-3"> <label for="gender">성별</label> <select
                                class="custom-select d-block w-100" id="gender">
                                <!-- <option value=""></option> -->
                                <option>남성</option>
                                <option>여성</option>
                                <option>공개안함</option>
                            </select>
                            <div class="invalid-feedback"> 성별을 선택해주세요. </div>
                        </div>
                        <div class="col-md-6 mb-3"> <label for="birth">생년월일</label> <input type="date"
                                class="form-control" id="birth" placeholder="birth" required>
                            <div class="invalid-feedback"> 생년월일</div>
                        </div>
                    </div>
                    <div class="mb-3"> <label for="address">주소</label> <input type="text" class="form-control"
                            id="address" placeholder="서울특별시 강남구" required>
                        <div class="invalid-feedback"> 주소를 입력해주세요. </div>
                    </div>
                    <div class="mb-3"> <label for="address2">상세주소<span class="text-muted">&nbsp;(필수 아님)</span></label>
                        <input type="text" class="form-control" id="address2" placeholder="상세주소를 입력해주세요.">
                    </div>
                    <hr class="mb-4">
                    <div class="custom-control custom-checkbox"> <input type="checkbox" class="custom-control-input"
                            id="aggrement" required> <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에
                            동의합니다.</label> </div>
                    <div class="mb-4"></div> <button class="btn btn-color btn-lg btn-block" type="submit">가입
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