<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="fd-board">
	   <div class="fd-board-top">
		   <a href="#" class="tag btnBoardTypeM">모임모집</a>&nbsp;
		   <a href="#" class="tag btnRegionNo">${fb.regionName}</a>
	   </div>
		<table class="fd-board-writer-date">
			<tr>
				<td rowspan="2" class="profileImg-area"><img class="profileImg" src="resources/img/test1.jpg" style="width:100%;"></td>
				<td>${fb.boardWriter}</td>
				<td align="right">
					<div class="dropdown">
						<i class='bx bx-dots-vertical-rounded dropdown-toggle' data-toggle="dropdown">
							<div class="dropdown-menu">
									<a class="dropdown-item updateMeetBoard">수정</a>
									<a class="dropdown-item checkDelete">삭제</a>
								<a class="dropdown-item" href="#">신고(미정)</a>
							</div>
						</i>
					</div>
				</td>
			</tr>
			<tr><td class="fd-board-date">${fb.boardDate}</td></tr>
		</table>
		<div class="fd-board-contents fdm">
			<div class="title">
				<c:choose>
					<c:when test="${fb.countMember lt fb.meetTotal}">
						<b>모집중&nbsp;</b>
					</c:when>
					<c:otherwise>
						<b>모집마감&nbsp;</b>
					</c:otherwise>
				</c:choose>
				${fb.boardTitle}
			</div>
			<div class="content fdm">
				<% pageContext.setAttribute("newLine", "\n"); %>
				<p id="content">${fn:replace(fb.boardContent, newLine, '<br/>')}</p>
			</div>
			<div class="meet-info fdm" style="padding:5px;">
				<div><img src="resources/img/test1.jpg" width="100%"></div>
				<div class="fdm">
					👉${fb.meetPlace} | ${fb.meetDate}<br>
					👉${fb.meetCondition}<br>
					👉${fb.countMember}/${fb.meetTotal}명 참여
				</div>
			</div>
		</div>
		<div style="margin-top:20px;">
			<span class="likeBtn">
				<img class="likeN" src="resources/img/star-off.png">
			</span>
			<span class="countLike">찜${fb.countLike}개</span>
		</div>
		<div class="fdm">${fb.countMember}명 참여중</div>
		
	<button type="button" class="btnPink">채팅 입장</button>
</div>