<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<c:forEach var="tmp" items="${list}">
	<div class="chat_list_box${tmp.roomID } chat_list_box">
		<div type="button" class="chat_list" roomID="${tmp.roomID }" otherID="${tmp.otherID }">
			<!-- active chat -->
			<div class ="chat_people">
		    <!--<div class="chat_img">
					<a href="other_profile.do>otherID=${tmp.otherID }">
						<img src="" alt="sunil">
					</a>
				</div> -->
				<div class="chat_ib">
					<h5>${tmp.otherID }<span class="chat_date">${tmp.sentTime }</span></h5>
					<div class="row">
						<div class="col-10">
							<p>${tmp.content }</p>
						</div>
						<!-- 만약 현재 사용자가 안읽은 메세지 개수가 0보다 클 때만 badge 표시 -->
						<c:if test="${tmp.unread>0 }">
							<div class="col-2 unread${tmp.roomID }">
								<span class="badge bg-danger">${tmp.unread }</span>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:forEach>