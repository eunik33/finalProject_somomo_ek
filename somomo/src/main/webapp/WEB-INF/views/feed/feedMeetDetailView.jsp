<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!----------- CSS --------------->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/feedDetail.css">
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
		.fd-board-top a {
			text-decoration: none;
			color: black;
		}
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

		/* 버튼 색 (다른 페이지와 통일 필요)*/
		.btnPink{
			display:block;
			width:100%;
			margin-top: 10px;
			padding: 10px;
			background-color: rgb(250,188,186);
			border: 1px solid rgb(250,188,186);
			border-radius: 20px;
			color: white;
			font-size: 18px;
			font-weight: bold;
		}
		.btnPink:hover{
     		background-color: #FEC8C6;
     		border: 1px solid #FEC8C6;
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
				
				<!-- ajax로 글 내용 띄우줄 공간 -->
				<div class="board-area">
				
				</div>
				
            </div>
		
		<script>
           	$(function(){
           		// 게시글 정보 가져오기
           		selectMeetBoard();
           		// 좋아요 체크
				checkLike();
           		
				$('.likeBtn').click(function(){	
					changeLike(this);
					
				});
           		
           		// =========모달 창 관련==========
            	// 모임날짜 현재날짜부터 선택 가능하게 처리
                let today = new Date(Date.now() - new Date().getTimezoneOffset() * 60000).toISOString().substring(0, 16);
                $('#dateTimeLocal').attr('min', today);
                
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
				$('#minAge').on('focus keyup input', function(){
           			let minAge = $(this).val();
           			
           			if($('#maxAge').val() < minAge){
           				$('#maxAge').val(minAge);
           			}
           			$('#maxAge').attr('min', minAge);	
           		});
           		
           	});
           	
           	function selectMeetBoard(){
           		$.ajax({
           			url : 'selectBoard.fd',
           			method : 'POST',
           			data : {
           				boardNo : '${fb.boardNo}'
           			},
           			success : function(data){
           				// 응답된 문자열은 html형식(feed/ajaxMeetDetail.jsp에 응답내용 있음)
           				$('.board-area').html(data);
           				
           				$('.updateMeetBoard').click(function(){
           					$('#updateMeetBoardModal').modal('toggle');
           				});
           				
           				
           			},
           			error : function(){
           				console.log('에러');
           			}
           		});
           	}
           	
       		function checkLike(){
           		$.ajax({
           			url : 'checkLike.fd',
           			method : 'POST',
           			data : {
           				userId : '${loginUser.userId}',
           				boardNo : '${fb.boardNo}'
           			},
           			success : function(result){
           				if(result == 'Y'){
           					$('.likeBtn').html('<img class="likeY" src="resources/img/star-on.png">');
           				}
           				else{
           					$('.likeBtn').html('<img class="likeN" src="resources/img/star-off.png">');
           				}
           				
           			},
           			error : function(){
           				console.log('에러');
           			}
           		});
       		}
       		
        	function changeLike(likeImg){

				// 기존에 좋아요 안 눌렀을 경우 => 좋아요 등록
        		if($(likeImg).children('img').hasClass('likeN')){ 
        			
        			//console.log('좋아요 등록');
            		
        			$.ajax({
            			url : 'insertLike.fd',
            			method : 'POST',
            			data : { 
            				userId : '${loginUser.userId}',
            				boardNo : '${fb.boardNo}'
            			},
            			success : function(result){
            				
            				if(result == 'success'){
            						$(likeImg).html('<img class="likeY" src="resources/img/star-on.png">');
            				}
            			},
            			error : function(){
            				//console.log('에러');
            			}
            		});
            	}
        		
        		// 기존에 좋아요 눌렀을 경우 => 좋아요 취소
        		else{ 
        			
        			//console.log('좋아요 취소');
        			
            		$.ajax({
            			url : 'deleteLike.fd',
            			data : { 
            				boardNo : bno,
            				userId : '${loginUser.userId}'
            			},
            			success : function(result){
            				
            				if(result == 'success'){
            					
            					if(boardType == 'G'){ // 일반글이었을 경우
            						$(likeImg).html('<img class="likeN" src="resources/img/heart-off.png">');
            					}
            					else{ // 모임모집글이었을 경우
            						$(likeImg).html('<img class="likeN" src="resources/img/star-off.png">');
            					}
            				}
            			},
            			error : function(){
            				//console.log('에러');
            			}
            		});
        		}

        	}
       		
       		function checkCountLike(){
       			$.ajax({
       				url : 'countLikes.fd',
       				method : 'POST',
       				data : {
       					boardNo : '${fb.boardNo}'
       				},
       				success : function(count){
       					$('.countLike').html('찜'+ count + '개');
       				},
       				error : function(){
       					console.log('에러');
       				}
       			});
       		}
		</script>


	    <!------- 모임모집글 수정 모달 ------->
		<div class="modal fade" id="updateMeetBoardModal">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					    
					<div class="modal-header">
						<h4 class="modal-title w-100 text-center">모집게시글 수정</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
								
					<div class="modal-body">
						<form action="update.fd" method="post" enctype="multipart/form-data">
							<input type="hidden" name="boardWriter" value="${loginUser.userId}">
							<input type="hidden" name="boardType" value="M">
									
							<div><b>지역</b></div>
							<select id="upRegion" name="regionNo" class="custom-select" style="width:150px;" required>
								<option value="">지역선택</option>
								<c:forEach var="r" items="${rList}">
									<option value="${r.regionNo}">${r.regionName}</option>
								</c:forEach>
							</select>
							<script>
								$(function(){
									$("#upRegion option").each(function(){
										if($(this).val() == "${fb.regionNo}"){
											$(this).attr("selected", true);
										}
									});
								});
							</script>
							
							<div class="mdm"><b>제목</b></div>
							<input type="text" name="boardTitle" class="form-control" maxlength="50" placeholder="제목을 입력해주세요" value="${fb.boardTitle}" required>
							
							<div class="mdm"><b>내용</b></div>
							<textarea name="boardContent" class="form-control" rows="8" placeholder="내용을 입력해주세요" style="resize: none;" required>${fb.boardContent}</textarea>
	
							<div class="mdm"><b>모임날짜</b></div>
							<input type="datetime-local" id="dateTimeLocal" name="meetDate" class="form-control " value="${fn:replace(fb.meetDate, ' ', 'T')}"required>
							
							<div class="mdm"><b>모임장소</b></div>
							<input type="text" name="meetPlace" class="form-control" placeholder="장소입력" value="${fb.meetPlace}" required>
	
							<div class="mdm"><b>모임인원</b></div>
							<input type="number" name="meetTotal" min="${fb.countMember}" max="10" class="form-control" style="width:120px;" value="${fb.meetTotal}">
							
							<div class="mdm"><b>모집성별</b></div>
							<label for="any">누구나</label>
							<input type="radio" id="any" name="meetGender" value="A">&nbsp;
							<label for="onlyM">남성만</label>
							<input type="radio" id="onlyM"name="meetGender" value="M">&nbsp;
							<label for="onlyF">여성만</label>
							<input type="radio" id="onlyF" name="meetGender" value="F">
							<script>
								$(function(){
									$("input[name=meetGender]").each(function(){
										if($(this).val() == "${fb.meetGender}"){
											$(this).attr("checked", true);
										}
									});
								});
							</script>
					
							<div class="mdm"><b>모집나이</b></div>
							<label for="anyAge">누구나</label>
							<input type="radio" name="meetAge" id="anyAge" value="A">&nbsp;
							<label for="selectAge">직접입력</label>
							<input type="radio" name="meetAge" id="selectAge" value="selectAge">
							<script>
								$(function(){
									let meetAge = '${fb.meetAge}';
									if(meetAge == 'A'){
										$('#anyAge').attr('checked', true);
									}
									else{
										$('#minAge').val(Number('${fb.minAge}'));
										$('#maxAge').val(Number('${fb.maxAge}')); 
										$('#selectAge').attr('checked', true);
										$('#selectAge-area').attr('style', 'display:"";'); // 나이 입력 칸 보이게
									}
								});
							</script>
							
							<div class="row" id="selectAge-area" style="display:none">
								<div class="col-sm-3">
									<input type="number" min="15" class="selAge form-control" id="minAge" name="minAge" style="width:100px;">
								</div>
								~
								<div class="col-sm-3">
									<input type="number" class="selAge form-control" id="maxAge" name="maxAge" style="width:100px;">
								</div>
							</div>
							
							<div style="margin-top:10px;">
								<button type="submit" class="btnPink">글수정</button>
							</div>
						</form>
					</div>				
							
				</div>
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