<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!----------- CSS --------------->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<!----------- 아이콘 CSS 링크 ------->
<link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
<!----------- 아이콘 CSS 링크 version 2------->
<!-- Boxicons CSS -->
<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>

<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
<!-- Bootstrap-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<title>모임모집글상세보기</title>
	<style>

		/* 제일 상단의 일반글/모임모집 작성 버튼 영역 */
		.fd-enroll-btn-area{
	        border: 1px solid rgb(158, 156, 156);
	        border-radius:5px;
	        padding: 10px;
	        text-align:center;
       	}


		/**************** 게시글 부분 ********************/
		/* 글 테두리*/
		.fd-board {
			width: 100%;
			background: #fff;
			border-radius: 6px;
			padding: 20px;
			columns:#8d1b1b;
			box-shadow: 2px 2px 10px rgba(0, 0, 0, .2);
		}

		/* 글 상단의 일반글/모임모집 부분*/
		/* 일반글 태그 (General) */
           .btnBoardTypeG{
	        font-size: 12px;
	        border-radius: 20px;
	        border: 1px solid lightgray;
	        background-color: lightgray;
	        color: black;
	    }
		/* 모임모집 태그 (Meet) */
		.btnBoardTypeM{
	        font-size: 12px;
	        border-radius: 20px;
	        border: 1px solid pink;
	        background-color: pink;
	        color: black;
	    }

		/* 글 상단의 지역(경기도/서울/인천 등등)*/
	    .btnRegionNo{
	    	font-size: 12px;
	        border: 1px solid rgb(248, 248, 154);
	        border-radius: 20px;
	        background-color: rgb(248, 248, 154);
	        color: black;
	    }

		/* 작성자 정보, 시간, ...버튼(아이콘 등록 필요) */
       	.fd-board-writer-date{width: 100%;}

		/* 작성자 프로필이미지*/
		.profileImg-area{
			width: 50px;
			height: 50px;
		}
		.profileImg{
			border-radius: 50%;
			width:100%;
			height:50px;
		}

		/* 글 내용 부분 각 margin*/
		.fdm{margin-top:10px;}

		/* 좋아요/찜 버튼 */
		.likeBtn{
			width:30px;
			height:30px;
		}

		/*모달창 내 버튼 색 (다른 페이지와 통일 필요)*/
		.btnPink{
			color: white;
			background-color: rgb(250,188,186);
			font-weight: bold;
		}
		.btnPink:hover{
      		 	color:white;
      		 	background-color: #FEC8C6;
			font-weight: bold;
   		}
    </style>
</head>
    <body>
        <!--------------------- 왼쪽 사이드 바 ------------------------>

        <!-- nav 태그에 나중에 자바스크립트로 close 클래스 추가해준다 (열고닫고 할 수 있게) -->
        <nav>
            <div class="logo-name">
                <div class="logo-image">
                    <img src="${pageContext.request.contextPath}/resources/img/web_logo.jpg" alt="peach">
                </div>

                <span class="logo_name">SoMoMo</span>
            </div>

            <div class="menu-items">
                <ul class="nav-links">
                    <li>
                        <a href="list.fd">
                            <i class="uil uil-estate"></i>
                            <span class="link-name">HOME</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="uil uil-comment"></i>
                            <span class="link-name">CHAT</span>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="uil uil-user"></i>
                            <span class="link-name">My Page</span>
                        </a>
                    </li>
                    <!-- 나중에 margin으로 조절-->
                    <br><br><br><br>
                    
                    <li>
                        <a href="#" class="community">
                            <i class="uil uil-comments"></i>
                            <span class="link-name">Community</span>
                        </a>
                    </li>
                    
                    <!-- 커뮤니티 이름 나타내기 -->
                    <li>
                        <a href="#" class="">
                            <img src="${pageContext.request.contextPath}/resources/img/test1.jpg">
                            <span class="community-name">서핑</span>
                        </a>
                    </li>

                    <li>
                        <a href="#" class="">
                            <img src="${pageContext.request.contextPath}/resources/img/test2.jpg">
                            <span class="community-name">유적 탐사</span>
                        </a>
                    </li>

                    <li>
                        <a href="#" class="">
                            <img src="${pageContext.request.contextPath}/resources/img/test3.jpg">
                            <span class="community-name">자동차</span>
                        </a>
                    </li>
                </ul>

                <ul class="logout-mode">
                    <li>
                        <a href="#">
                            <i class="uil uil-signout"></i>
                            <span class="link-name">Logout</span>
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
        <!--------------------- 왼쪽 사이드 바 끝 ------------------------>

        <!----------- 헤더 , 메인 컨텐츠 ---------->
        <section class="main-content">
            <!------- 헤더 --------->
            <div class="top">
                <i class="uil uil-bars sidebar-toggle"></i>

                <div class="search-box">
                    <i class="uil uil-search"></i>
                    <input type="text" placeholder="검색">
                </div>
            </div>
            <!------- 헤더 끝--------->








            <!------ 메인 피드----------->
            <div class="main-feed">
				<div class="fd-board">
					   <div class="fd-board-top">
						   <a href="#" class="tag btnBoardTypeM">모임모집</a>&nbsp;
						   <a href="#" class="tag btnRegionNo">${fb.regionName}</a>
					   </div>
						<table class="fd-board-writer-date">
							<tr>
								<td rowspan="2" class="profileImg-area"><img class="profileImg" src="resources/img/test1.jpg" style="width:100%;"></td>
								<td>닉네임</td>
								<td align="right">
									<div class="dropdown">
										<i class='bx bx-dots-vertical-rounded dropdown-toggle' data-toggle="dropdown">
											<div class="dropdown-menu">
												<a class="dropdown-item updateGeneralBoard">수정</a>
												<a class="dropdown-item checkDelete">삭제</a>
												<a class="dropdown-item" href="#">신고(미정)</a>
											</div>
										</i>
									</div>
								</td>
							</tr>
							<tr><td class="fd-board-date">날짜</td></tr>
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
								<p id="content">${fb.boardContent}</p>
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
							<c:choose>
								<c:when test="${empty f.likeCheck}">
									<span class="likeBtn" data-bno="${f.boardNo}" data-btype="${f.boardType}">
										<img class="likeN" src="resources/img/star-off.png">
									</span>
								</c:when>
								<c:otherwise>
									<span class="likeBtn" data-bno="${f.boardNo}" data-btype="${f.boardType}">
										<img class="likeY" src="resources/img/star-on.png">
									</span>
								</c:otherwise>
							</c:choose>
							찜${fb.countLike}개
						</div>
						<div class="fdm">${fb.countMember}명 참여중</div>
						
					<button type="button" class="btn btn-block btnPink" style="margin-top: 10px;">채팅 입장</button>
				</div>
            </div>

            <!-- 메인 피드 끝 -->
            
            
            
            
            
            
            
            
        </section>

        <!------ 오른쪽 사이드 바 --------->
        <div class="right-sidebar">
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
        </div>
        <!-- 오른쪽 사이드 바 -->
        <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
    </body>
</html>