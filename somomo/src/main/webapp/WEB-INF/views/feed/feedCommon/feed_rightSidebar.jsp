<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div {
		/*border : 1px solid blue;*/
	}
	.search-area{
    	position: relative;
    	top: 75px;
    	left: 15%;
    	background-color:rgb(255, 224, 217);
    	padding : 15px;
    	border-radius: 10px;
	}
	.search-area>div{
		margin-top:10px;
	}
	.smallBtn{
		display:inline-block;
	}
</style>
</head>
<body>
        <div class="right-top">
            <i class="uil uil-bell"></i>
            <i class="uil uil-comment-dots"></i>
            <i class="uil uil-user-circle profile">
                <ul class="profile-link">
                    <li><a href=""><i class="uil uil-user-circle"></i> 프로필</a></li>
                    <li><a href=""><i class="uil uil-setting"></i> Settings</a></li>
                    <li><a href=""><i class="uil uil-signout"></i> 로그아웃</a></li>
                </ul>
            </i>
        </div>
        
        <div class="search-area">
        	<form action="search.fd" method="get">
	        	<div class="search-region">
	        		<div><b>검색 지역</b></div>
		     		<select name="regionNo" class="custom-select" style="width:150px;">
						<option value="0" selected>전체지역</option>
							<c:forEach var="r" items="${rList}">
								<option value="${r.regionNo}">${r.regionName}</option>
							</c:forEach>
					</select>
	        	</div>
	        	<div class="search-boardType">
	     			<div><b>글 종류</b></div>
					<input type="radio" id="any" name="boardType" value="A" checked>
					<label for="any">전체</label>&nbsp;
					<input type="radio" id="onlyM"name="boardType" value="G">
					<label for="onlyM">일반글</label>&nbsp;
					<input type="radio" id="onlyF" name="boardType" value="M">
					<label for="onlyF">모임모집글</label>
	        	</div>
	        	<div class="search-keyword">
	        		<div><b>검색 내용</b></div>
	        		<input type="text" class="form-control" name="keyword" value="">
	        	</div>
	        	
	        	<div class="search-btn">
		        	<button type="submit" class="searchBtn btnPink smallBtn" style="text-align:center;">검색</button>
	        	</div>
        	</form>
        	

        </div>
</body>
</html>