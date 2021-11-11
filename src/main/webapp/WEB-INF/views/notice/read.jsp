<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.btn-color {
	border-color: #5BA6A6;
	color: #5BA6A6;
}
</style>
</head>
<body>
<div class="container-lg">
        <!-- <h3>공지사항 제목1</h3> -->
        <div class="card card-default">
            <div class="card-header" style="font-size:20px;">공지사항 제목1</div>
            <!-- <div class="card-header">작성자</div> -->
            <div class="card-body">
                <h5 class="card-title">작성자</h5>
                <p class="card-text">개발자1</p>
            </div>

            <!-- <div class="card-header">내용</div> -->
            <div class="card-body">
                <h5 class="card-title">내용</h5>
                <p class="card-text">내용입니다</p>
            </div>

            <div class="card-body">
                <h5 class="card-title">등록일</h5>
                <p class="card-text">1102</p>
            </div>

            <!-- <div class="card-header">조회수</div> -->
            <div class="card-body">
                <h5 class="card-title">조회수</h5>
                <p class="card-text">1</p>
            </div>
        </div>
        <br>
        <div>
            <button type="button" class="btn btn-color">등록</button>
            <button type="button" class="btn btn-color">수정</button>
            <button type="button" class="btn btn-color">삭제</button>
            <button type="button" class="btn btn-color">목록</button>
        </div>
    </div>
</body>
</html>