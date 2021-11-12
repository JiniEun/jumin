<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="container" style="margin-top:15px;">
        <h3>공지사항</h3>
        <br>
        <form class="form-inline" action="./list">
            <div class="form-group">
                <select class="form-control" name="col" style="margin-right:10px;">
                    <option value="total">전체출력</option>
                    <option value="wname">작성자</option>
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                    <option value="title_content">제목+내용</option>
                </select>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" placeholder="검색어를 입력하세요" name="word" style="margin-right:10px;">
            </div>
            <button type="submit" class="btn" style="background-color: 	#5BA6A6; color: white; margin-right:10px;">검색</button>
            <button type="button" class="btn" style="background-color: 	#5BA6A6; color: white;">등록</button>

        </form>
        <br>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>등록날짜</th>
                    <th>조회수</th>
                </tr>
            </thead>
            <tbody>

                <tr>
                    <td>공지사항 번호1</td>
                    <td>
                        <a href="#" class="text-dark">공지 제목1</a>
                    </td>
                    <td>작성자</td>
                    <td>작성일1101</td>
                    <td>조회수</td>
                </tr>
                <tr>
                    <td>공지사항 번호2</td>
                    <td>
                        <a href="#" class="text-dark">공지 제목2</a>
                    </td>
                    <td>작성자</td>
                    <td>작성일1102</td>
                    <td>조회수</td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>