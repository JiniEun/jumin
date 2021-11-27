<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<c:forEach var="tmp" items="${clist }">

	<c:choose>
		<c:when test="${sessionScope.ID ne tmp.sender }">
		<!-- 받은 메세지 -->
		<div class="incoming_msg">
			<div class="received_msg">
				<div class="received_withd_msg">
					<p>${tmp.content }</p>
					<span class="time_date"> ${tmp.sendTime }</span>
				</div>
			</div>
		</div>
		</c:when>
		
		<c:otherwise>
		<!-- 보낸 메세지 -->
		<div class="outgoing_msg">
			<div class="sent_msg">
				<p>${tmp.content }</p>
				<span class="time_date"> ${tmp.sendTime }</span>
			</div>
		</div>
		</c:otherwise>
	</c:choose>

</c:forEach>