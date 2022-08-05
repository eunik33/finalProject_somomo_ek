<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
	<!----------- CSS --------------->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/feedstyle.css">
	<!----------- 아이콘 CSS 링크 ------->
	<link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
	<!----------- 아이콘 CSS 링크 version 2------->
	
	<!----------- jQuery ------------>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<!----------- Bootstrap --------->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

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
       	.fd-board{
       		border: 1px solid rgb(158, 156, 156);
			box-shadow: 0 1px 0 0 lightgray;
	        border-radius:5px;
	        padding: 10px;
	        margin-top:10px;
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
            
			<div class="fd-enroll-btn-area">
				<button type="button" data-toggle="modal" data-target="#enrollBoardModal" class="btn btn-primary">일반글</button>
           		<button type="button" data-toggle="modal" data-target="#enrollMeetBoardModal" class="btn btn-primary">모임모집</button>
           	</div>
			<!-----------글 목록 띄워지는 공간----------->
           	<div class="fd-board-area">
           			
				<!------------글 예시 (모임모집)--------------->
           		<div class="fd-board">
					<!------- 상단 태그  -------->
           			<div class="fd-board-top">
						<a href="#" class="btnBoardTypeM">모임모집</a>&nbsp;<a href="#" class="btnRegionNo">경기도</a>
           			</div>
					<!------- 작성자 프로필, 날짜, 수정/삭제버튼  -------->
	        		<table class="fd-board-writer-date">
						<tr>
							<td rowspan="2" class="profileImg-area"><img class="profileImg" src="resources/img/test1.jpg"></td>
							<td>닉네임표시</td>
							<td align="right">...버튼</td>
						</tr>
						<tr><td class="fd-board-date">5시간 전</td></tr>
					</table>
					<!------- 내용  -------->
					<div class="fdm fd-board-contents">
						<div class="title"><b>모집중&nbsp;</b>1동탄에서 보드게임 하실 분 모집합니다!</div>
						<div class="fdm meet-info">
							👉보드게임카페 | 2022-08-08 15:00<br>
							👉누구나 참여 가능<br>
							👉1/4명 참여
						</div>
						<div class="fdm content">
							<p>안녕하세요 보드게임 하실 분 모집합니다! 날짜는 어쩌고저쩌고 조율가능합니다~~~
								최대 2줄만 보이게...???
							</p>
						</div>
					</div>
					<!------- 하단 찜버튼  -------->
					<div class="fd-board-bottom">
						<div align="right"><img class="likeBtn" src="resources/img/star-off.png"></div>
					</div>
				</div>
           	

           		<c:forEach var="f" items="${fList}">
           			<c:choose>
           				<c:when test="${f.boardType eq 'G'}">
							<!-----------일반게시글-------------->
						    <div class="fd-board">
						    	<input type="hidden" value="${f.boardNo}">
			           			<!------- 상단 태그  -------->
			           			<div class="fd-board-top">
			           				<a href="#" class="btnBoardTypeG">일반글</a>&nbsp;<a href="#" class="btnRegionNo">${f.regionName}</a>
			           			</div>
			           			<!------- 작성자 프로필, 날짜, 수정/삭제버튼  -------->
				        		<table class="fd-board-writer-date">
									<tr>
										<td rowspan="2" class="profileImg-area"><img class="profileImg" src="resources/img/test1.jpg" style="width:100%;"></td>
										<td>${f.nickname}</td>
										<td align="right">버튼</td>
									</tr>
									<tr><td class="fd-board-date">${f.boardDate}</td></tr>
								</table>
								<!------- 내용  -------->
								<div class="fd-board-contents fdm">
									<div class="title">${f.boardTitle}</div>
									<div class="content fdm">
										<p>${f.boardContent}</p>
									</div>
								</div>
								<!------- 하단 댓글,좋아요버튼  -------->
								<div class="fd-board-bottom fdm">
									<table style="width:100%">
										<tr>
											<td>댓글 ${f.countReply}개</td>
											<td align="right"><img class="likeBtn" src="resources/img/heart-off.png"></td></tr>
									</table>
								</div>
			           		</div>
           				</c:when>
           				<c:otherwise>
			           		<div class="fd-board">
			           			<input type="hidden" value="${f.boardNo}">
			           			<div class="fd-board-top">
			           				<a href="#" class="btnBoardTypeM">모임모집</a>&nbsp;<a href="#" class="btnRegionNo">${f.regionName}</a>
			           			</div>
				        		<table class="fd-board-writer-date">
									<tr>
										<td rowspan="2" class="profileImg-area"><img class="profileImg" src="resources/img/test1.jpg" style="width:100%;"></td>
										<td>${f.nickname}</td>
										<td align="right">버튼</td>
									</tr>
									<tr><td class="fd-board-date">${f.boardDate}</td></tr>
								</table>
								<div class="fd-board-contents fdm">
									<div class="title">
										<c:choose>
											<c:when test="${f.countMember lt f.meetTotal}">
												<b>모집중&nbsp;</b>
											</c:when>
											<c:otherwise>
												<b>모집마감&nbsp;</b>
											</c:otherwise>
										</c:choose>
										${f.boardTitle}
									</div>
									<div class="meet-info fdm">
										👉${f.meetPlace} | ${f.meetDate}<br>
										👉${f.meetCondition}<br>
										👉${f.countMember}/${f.meetTotal}명 참여
									</div>
									<div class="content fdm">
										<p>${f.boardContent}</p>
									</div>
								</div>
								<div class="fd-board-bottom">
									<div align="right"><img class="likeBtn" src="resources/img/star-off.png"></div>
								</div>
			           		</div>
           				</c:otherwise>
        			</c:choose>
        		
           		</c:forEach>
           	</div>


			<button type="button" class="btn btn-block btnPink" style="margin-top: 10px;">10개 더보기</button>
		</div>
            
            
            <script>
            	$(function(){
            		$('.fd-board').click(function(){
            			let bno = $(this).children().eq(0).val();
            			location.href = "detail.fb?bno=" + bno;
            		});
            	});
            	
            </script>
            
            
            
            <!--------------------- Modal 창 --------------------->
          
          <!------- 일반글 작성 모달 ------->
	<div class="modal fade" id="enrollBoardModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				    
				<div class="modal-header">
					<h4 class="modal-title w-100 text-center">일반게시글</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
							
				<div class="modal-body">
					<form action="insert.fd" method="post" enctype="multipart/form-data">
					<input type="hidden" name="boardWriter" value="user01">
					<input type="hidden" name="boardType" value="G">
							
					<div><b>지역</b></div>
					<select name="regionNo" class="custom-select" style="width:200px;" required>
						<option value="">지역선택</option>
						<c:forEach var="r" items="${rList}">
							<option value="${r.regionNo}">${r.regionName}</option>
						</c:forEach>
					</select>
					
					<div><b>제목</b></div>
					<input type="text" name="boardTitle" class="form-control" maxlength="50" placeholder="제목을 입력해주세요" required></textarea>
					
					<div><b>내용</b></div>
					<textarea name="boardContent" class="form-control" rows="8" placeholder="내용을 입력해주세요" style="resize: none;" required></textarea>
					
					<input multiple="multiple" type="file" name="upfile">
					
					<div style="margin-top:10px;">
					<button type="submit" class="btn btn-primary btn-block">글작성</button>
					</div>
					</form>
				</div>				
				
			</div>
		</div>
	</div>
	
    <!------- 모임모집글 작성 모달 ------->
	<div class="modal fade" id="enrollMeetBoardModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				    
				<div class="modal-header">
					<h4 class="modal-title w-100 text-center">모집게시글</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
							
				<div class="modal-body">
					<form action="insert.fd" method="post" enctype="multipart/form-data">
						<input type="hidden" name="boardWriter" value="user01">
						<input type="hidden" name="boardType" value="M">
								
						<div><b>지역</b></div>
						<select name="regionNo" class="custom-select" style="width:150px;" required>
							<option value="">지역선택</option>
							<c:forEach var="r" items="${rList}">
								<option value="${r.regionNo}">${r.regionName}</option>
							</c:forEach>
						</select>
						
						<div><b>제목</b></div>
						<input type="text" name="boardTitle" class="form-control" maxlength="50" placeholder="제목을 입력해주세요" required></textarea>
						
						<div><b>내용</b></div>
						<textarea name="boardContent" class="form-control" rows="8" placeholder="내용을 입력해주세요" style="resize: none;" required></textarea>
						
						<div><b>모임날짜</b></div>
						<input type="datetime-local" name="meetDate" class="form-control" required>
						
						<div><b>모임장소</b></div>
						<input type="text" name="meetPlace" class="form-control" placeholder="장소입력" required></textarea>
						
						<div><b>모집인원</b></div>
						<input type="number" min="2" name="meetTotal" class="form-control" style="width:150px;">
						
						<div><b>모집성별</b></div>
						<select name="meetGender" class="custom-select" style="width:150px;" required>
							<option value="A" selected>누구나</option>
							<option value="F">여성만</option>
							<option value="M">남성만</option>
						</select>
				
						<div><b>모집나이</b></div>
						<label for="anyAge">누구나</label>
						<input type="radio" name="meetAge" id="anyAge" value="A" checked>
						<label for="selectAge">직접입력</label>
						<input type="radio" name="meetAge" id="selectAge" value="selectAge">
						
						<div class="row" id="selectAge-area" style="display:none">
							<div class="col-sm-3">
								<input type="number" min="0" class="form-control" name="minAge" style="width:100px;">
							</div>
							~
							<div class="col-sm-3">
								<input type="number" min="0" class="form-control" name="maxAge" style="width:100px;">
							</div>
						</div>
						
						<div style="margin-top:10px;">
							<button type="submit" class="btn btn-primary btn-block">글작성</button>
						</div>
					</form>
				</div>				
				
			</div>
		</div>
	</div>
	
	<script>
          	$(document).ready(function(){
          		$('input:radio[name=meetAge]').click(function(){
          			if($('input[name=meetAge]:checked').val() == 'selectAge'){ // 모집나이>직접입력 선택했을 경우
          				console.log("1");
          				$('#selectAge-area').attr('style', 'display:"";');
          			}
          			else{
          				console.log("2");
          				$('#selectAge-area').attr('style', 'display:none;');
          			}
          		});
          	});
          	
    </script>
	

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