<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="modal fade" id="MsgForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content ">
                <div class="modal-header fn-font">
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">X</span>
                    </button>
                </div>
                <form class="msg_form">
                    <input type="hidden" id="flag" name="flag" value="insert"/>
                    <input type="hidden" id="user_id" name="user_id" value="${sessionConfigVO.user_id}"/>
                    <div class="modal-body fn-font">
                        <table>
                            <colgroup>
                                <col style="width:150px;"/>
                                <col style="width:px;"/>
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>작성자</th>
                                    <th><input type="text" id="sendNick" name="sendNick" class="form-control" value="<c:out value='${sessionConfigVO.user_name}'/>" readonly/></th>
                                </tr>
                                <tr>
                                    <th>받는 사람</th>
                                    <th>
                                        <select id="recvNick" name="recvNick" class="form-control" value="">
                                            <c:forEach var="row" items="${userList}" varStatus="status">
                                                <option value="${row.user_name}">${row.user_name}</option>
                                            </c:forEach>
                                        </select>
                                    </th>
                                </tr>
                                <tr>
                                    <th>제목</th>
                                    <th><input type="text" id="ms_title" name="ms_title" class="form-control" value=""/></th>
                                    
                                </tr>
                                <tr>
                                    <th>내용</th>
                                    <th><textArea id="ms_content" name="ms_content" class="form-control"></textArea></th>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </form>
                <div class="modal-footer fn-font">
                    <button class="btn" type="button" id="msg_submit">SEND</button>
                    <button class="btn" type="button" data-dismiss="modal">NO</button>
                </div>
            </div>
        </div>
    </div>


</body>
</html>