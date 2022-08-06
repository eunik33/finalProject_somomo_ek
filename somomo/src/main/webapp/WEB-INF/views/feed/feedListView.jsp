<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <!----------- CSS --------------->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/feedstyle.css">
    <!----------- 아이콘 CSS 링크 ------->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <!----------- 아이콘 CSS 링크 version 2------->
    <!-- Boxicons CSS -->
    <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
    
	<!-- Bootstrap-->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	      <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

	<!-- jquery -->
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <title>메인 페이지</title>
    
	<style>
		/* 제일 상단의 일반글/모임모집 작성 버튼 영역 */
		.fd-enroll-btn-area {
	       border: 1px solid rgb(158, 156, 156);
	       border-radius:5px;
	       padding: 10px;
	       text-align:center;
	   	}
		
		/**************** 게시글 부분 ********************/
		/* 글 테두리*/
		.fd-board {
			border: 1px solid rgb(158, 156, 156);
			box-shadow: 0 1px 0 0 lightgray;
		    border-radius:5px;
		    padding: 10px;
		    margin-top:10px;
		}
		
		/* 글 상단의 일반글/모임모집 부분*/
		/* 일반글 태그 (General) */
		.btnBoardTypeG {
	       font-size: 12px;
	       border-radius: 20px;
	       border: 1px solid lightgray;
	       background-color: lightgray;
	       color: black;
	   	}
		/* 모임모집 태그 (Meet) */
		.btnBoardTypeM {
	       font-size: 12px;
	       border-radius: 20px;
	       border: 1px solid pink;
	       background-color: pink;
	       color: black;
	   	}
		
		/* 글 상단의 지역(경기도/서울/인천 등등)*/
		.btnRegionNo {
		   	font-size: 12px;
		   	border: 1px solid rgb(248, 248, 154);
		    border-radius: 20px;
		    background-color: rgb(248, 248, 154);
		    color: black;
		}
		
		/* 작성자 정보, 시간, ...버튼 */
		.fd-board-writer-date {width: 100%;}
		
		/* 작성자 프로필이미지*/
		.profileImg-area {
			width: 50px;
			height: 50px;
		}
		.profileImg {
			border-radius: 50%;
			width:100%;
			height:50px;
		}
		
		/* 글 내용 부분 각 margin + 모달창*/
		.fdm, .mdm {margin-top:10px;}
		
		/* 좋아요/찜 버튼 */
		.likeBtn {
			width:30px;
			height:30px;
		}
		
		/*모달창 내 버튼 색 (다른 페이지와 통일 필요)*/
		.btnPink {
			color: white;
			background-color: rgb(250,188,186);
			font-weight: bold;
		}
		.btnPink:hover {
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

       
           	</div>


			<button type="button" class="btn btn-block btnPink" style="margin-top: 10px;">10개 더보기</button>
		</div>
        
        
        <script>
        	$(function(){
        		selectFeedList();
        	});
        	
        	function selectFeedList(){
        		$.ajax({
        			url : 'listtest.fd',
        			success : function(data){
        				let value = '';
        				for(let i in data){
        					if(data[i].boardType == 'G'){
        						console.log('G다아아');
        					}
        					else{
        						console.log('M이다아아');
        					}
        				}
        			}
        		});
        	}
        </script>
        
 
        <form action="" method="post" id="postForm">
        	<input type="hidden" name="bno" value="">
        </form>

        <script>
        	$(function(){
        		// 게시글 상세보기
            	$('.fd-board-contents').click(function(){
            		let bno = $(this).parent().find('input[name="boardNo"]').val();
            		location.href = "detail.fb?bno=" + bno;
            	});
            	
            	// 게시글 삭제
        		$('.checkDelete').click(function(){
        			if(confirm("삭제하시겠습니까?")){
	        			//let bno = $(this).parents().eq(7).find('input').val();
        				let bno = $(this).closest('div[class="fd-board"]').find('input[name="boardNo"]').val();
        				$('#postForm input[name="bno"]').val(bno);
        				$('#postForm').attr('action', 'delete.fb').submit();
        			}
        		});
            	
            });
        	
        	// 게시글 수정, 삭제
        	function postFormSubmit(num){
        		if(num == 1){ // 수정
        			$('#postForm').attr('action', 'update.fb').submit();
        		}
        	}
        	
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
						
						<div area="file-area">
							<input type="file" name="file1" id="file1">
							<input type="file" name="file2" id="file2">
							<input type="file" name="file3" id="file3">
							<input type="file" name="file4" id="file4">
						</div>
						
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
	
									
							<div class="mdm"><b>모임날짜</b></div>
							<input type="datetime-local" id="dateTimeLocal" name="meetDate" class="form-control" required>
							
							<div class="mdm"><b>모임장소</b></div>
							<input type="text" name="meetPlace" class="form-control" placeholder="장소입력" required></textarea>
	
							<div class="mdm"><b>모임인원</b></div>
							<input type="number" name="meetTotal" min="2" max="10" class="form-control" style="width:120px;" value="2">
							
							<div class="mdm"><b>모집성별</b></div>
							<select name="meetGender" class="custom-select" style="width:120px;" required>
								<option value="A" selected>누구나</option>
								<option value="F">여성만</option>
								<option value="M">남성만</option>
							</select>
					
							<div class="mdm"><b>모집나이</b></div>
							<label for="anyAge">누구나</label>
							<input type="radio" name="meetAge" id="anyAge" value="A" checked>
							<label for="selectAge">직접입력</label>
							<input type="radio" name="meetAge" id="selectAge" value="selectAge">
							
							<div class="row" id="selectAge-area" style="display:none">
								<div class="col-sm-3">
									<input type="number" min="15" class="selAge form-control" id="minAge" name="minAge" style="width:100px;">
								</div>
								~
								<div class="col-sm-3">
									<input type="number" min="15" class="selAge form-control" id="maxAge" name="maxAge" style="width:100px;">
								</div>
							</div>
							
							<div style="margin-top:10px;">
								<button type="submit" class="btn btn-block btnPink">글작성</button>
							</div>
						</form>
					</div>				
							
				</div>
			</div>
		</div>
			
		<script>
           	$(function(){
           		
            	// 모임날짜 현재날짜부터 선택 가능하게 처리
                let today = new Date(Date.now() - new Date().getTimezoneOffset() * 60000).toISOString().substring(0, 16);
                $('#dateTimeLocal').attr('min', today);
                $('#dateTimeLocal').val(today);
           		
           		// 모집나이 클릭 이벤트 처리
           		$('input:radio[name=meetAge]').click(function(){
           			if($('input[name=meetAge]:checked').val() == 'selectAge'){ // 모집나이>직접입력 선택했을 경우
           				$('#selectAge-area').attr('style', 'display:"";'); // 나이 입력 칸 보이게
           				$('.selAge').attr('required', true); // 나이 입력 필수
           			}
           			else{ // 모집나이>누구나 선택했을 경우
           				$('#selectAge-area').attr('style', 'display:none;'); // 나이 입력 칸 안 보이게
           				$('.selAge').attr('required', false); // 나이 입력 필수 x
           			}
           		});
           		
           		// 최대나이가 입력된 최소나이 이상이 되게끔 처리
           		$('#minAge').bind('input', function(){
           			let minAge = $(this).val();
           			
           			if($('#maxAge').val() < minAge){
           				$('#maxAge').val(minAge);
           			}
           			$('#maxAge').attr('min', minAge);	
           		});
           		
           	});
		</script>
			
        <!------ 메인 피드 끝----------->
        
    <!----------- 헤더 , 메인 컨텐츠 끝---------->        
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
    <!-- 오른쪽 사이드 바 끝-->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>