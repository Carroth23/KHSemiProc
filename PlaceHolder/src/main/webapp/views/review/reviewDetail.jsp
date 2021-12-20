<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>PlaceHolder</title>
      <link rel="shortcut icon" type="image/x-icon" href="/semi-img/favicon.png" />
      <!-- 제이쿼리CDN -->
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <!-- 부트스트랩CDN -->
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
      <!-- 폰트어썸CDN -->
      <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
        integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
      <!-- 구글 폰트CDN -->
      <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet">

      <link rel="stylesheet" href="/semi-css/hotelList.css">
    </head>

    <body>

      <div class="container">
        <div class="containerIn">
          <div class="container">

            <div class="row header">
              <div class="col-3 align-self-center">
                <a href="/index.jsp"><img src="/semi-img/logos.png" id="logo"></a>
              </div>
              <div class="col-8 align-self-center" id="head2">
                <form class="d-flex">
                  <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                  <button class="top-search"><i class="fas fa-search"></i></button>
                </form>
              </div>
              <!-- 햄버거메뉴 -->
              <div class="col-1  align-self-center justify-content-end">
                <nav class="navbar navbar-light">
                  <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas"
                    data-bs-target="#offcanvasNavbar">
                    <span class="navbar-toggler-icon"></span>
                  </button>
                  <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar"
                    aria-labelledby="offcanvasNavbarLabel">
                    <div class="offcanvas-header">
                      <h5 class="offcanvas-title" id="offcanvasNavbarLabel">PlaceHolder</h5>

                      <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"
                        aria-label="Close"></button>
                    </div>
                    <hr>
                    <div class="offcanvas-body">

                      <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                        <c:choose>
                          <c:when test="${loginId != null}">
                            <!-- 로그인 이후 보일 내용 -->
                            <li class="nav-item" id="loginAcc">
                              <div class="row">
                                <div class="col-12 loginAcc"></div>
                              </div>
                              <div class="row">
                                <div class="col-8 loginMent">${loginId}님안녕하세요.</div>
                                <div class="col-4"><a href="/logout.user"><button class="logOut">로그아웃</button></a></div>
                              </div>
                              <div class="row loginAccBannerH">
                                <div class="col-3">
                                  <a href="/list.hotel"><button class="loginAccBanner">예약</button></a>
                                </div>
                                <div class="col-3">
                                  <a href=""><button class="loginAccBanner">후기</button></a>
                                </div>
                                <div class="col-3">
                                  <a href=""><button class="loginAccBanner">찜목록</button></a>
                                </div>
                                <div class="col-3">
                                  <a href="/mypage.home"><button class="loginAccBanner">MyPage</button></a>
                                </div>
                              </div>
                            </li>
                          </c:when>
                          <c:otherwise>
                            <!-- 로그인 폼 -->
                            <li class="nav-item">
                              <div class="row signBox">
                                <form action="/login.user" method="post">
                                  <div class="col-12 signInput">
                                    <input type="text" placeholder="Input ID" class="inputId" name="id"> <input
                                      type="password" placeholder="Input PW" class="inputPw" name="pw">
                                  </div>
                                  <div class="row">
                                    <div class="col-6 sign">
                                      <button class="signBtns">로그인</button>
                                    </div>
                                    <div class="col-6 sign">
                                      <a href="/signupPage.user"><button type="button"
                                          class="signBtns signUp">회원가입</button></a>
                                    </div>
                                  </div>
                                </form>
                              </div>
                            </li>
                          </c:otherwise>
                        </c:choose>
                        <li class="nav-item">
                          <a href="/main.home"><button type="button" class="sideBanner">메인으로</button></a>
                        </li>
                        <li class="nav-item">
                          <button type="button" class="sideBanner" class="boardGo">자유게시판</button>
                        </li>
                      </ul>
                    </div>
                  </div>
                </nav>
              </div>
            </div>

            <div class="row" id="banner">
              <div class="col-2 goHome bannerIn">
                <p id="goHome">메인으로</p>
              </div>
              <div class="col-2 reservation bannerIn">
                <p id="pagereload">목록다시보기</p>
              </div>
              <div class="col-2 community bannerIn">
                <p class="boardGo">커뮤니티</p>
              </div>
              <div class="col-2 qna bannerIn">
                <p>고객센터</p>
              </div>
              <div class="col-2 mypage bannerIn">
                <a href="/mypage.home">
                  <p>마이페이지</p>
                </a>
              </div>
            </div>

            <!-- 배너 밑 검색바 -->
            <div class="row bannerSearch">
              <div class="col-2">
                <select id="searchOption">
                  <option>이름</option>
                  <option>위치</option>
                </select>
              </div>
              <div class="col-8">
                <input type="text" placeholder="상세검색어를 입력해주세요." class="detailSearch">
              </div>
              <div class="col-2 align-self-start">
                <button class="detailSearchBtn">
                  검색
                </button>
              </div>
            </div>
            <hr class="bannerHr">
            
            <!-- 리스트콘텐츠 시작 -->
        <!-- 리뷰칸 -->
        <div class="row" id="banner2">
		<c:forEach var="review" items="${myReview}">
			<form action="/modifyReview.review" method = "get" id="form">
		       <div class = "container" id = "articlecontainer">
            	<div class = "row top" style = "text-align:center">         		
            		<div class = "col-2 num">글 번호</div>
            		<div class = "col-5 title">호텔 아이디</div>
            		<div class = "col-3 writer">작성자</div>
            		<div class = "col-2 date">작성일</div>
            	</div>
            	<br>
            	<div class = "row middle" style = "text-align : center; background-color: whitesmoke">
            		<div class = "col-2 num">${review.reviewId}</div>
            		<div class = "col-5 title">${review.hotelId }</div>
            		<div class = "col-3 writer">${review.userId}</div>
            		<div class = "col-2 date">${review.reviewCreated}</div>
            		<hr class="bannerHr">
				</div><br>
				<div class="reviewContent">
					<div class = "col-12 content">
						별점 : 
						<select name="reviewScore">
							<option value="1">1 점</option>
							<option value="2">2 점</option>
							<option value="3">3 점</option>
							<option value="4">4 점</option>
							<option value="5">5 점</option>
						</select>
						<textarea style="width:100%; height:300px" name="reviewContent" id="reviewContent" readonly>${reviewContent}</textarea>
						<input type=text name="reviewId" style="display:none" value="${review.reviewId}">
					</div>
				</div>
				<input type=button value="리뷰 수정하기" id="modifyReview">
				<input type=submit value="수정 완료" id="submit" style="display:none">
                <input type=button value="수정 취소" id="cancelModification" style="display:none">
				<div>
				
         	</div>
                </form>
		</c:forEach>
            <div id="inner"></div>
          </div>
          
          <!-- 푸터 -->
          <div class="container-fluid footBack">
            <div class="container">
              <div id="footer">
                <div id="footerIn">
                  <div class="row">
                    <div class="col-3 footer-left">

                      <a href="index.jsp" class="fot_logo"></a>

                    </div>
                    <div class="col-3 footer-center">

                    </div>
                    <div class="col-6 footer-right">
                      <ul class="foot-ul-blog">
                        <li><a
                            href="https://section.blog.naver.com/BlogHome.naver?directoryNo=0&currentPage=1&groupId=0">블로그</a>
                        </li>
                        <li><a href="">이용약관</a></li>
                        <li><a href="">개인정보처리방침</a></li>
                        <li><a href="">운영 정책</a></li>
                        <li><a href="">고객 문의</a></li>
                      </ul>
                    </div>
                  </div>

                  <div class="row">

                    <div class="col-4">
                      <ul class="foot-sangho">
                        <li>상호명 : <a href="index.jsp" class="foot-sangho-a">PlaceHolder</a></li>
                        <li>공동대표 : 기억해조</li>
                        <li>사업자등록번호 : 230-00-12345</li>
                        <li>동신판매업신고번호 : 2021-서울종로-05000</li>
                      </ul>
                    </div>

                    <div class="col-5">
                      <ul class="foot-sangho">
                        <li>&nbsp;</li>
                        <li>대표전화 : 02-1234-5678</li>
                        <li>이메일 : PlaceHolder@LoremIpsum.com</li>
                        <li>영업소재지 : 서울특별시 중구 남대문로 120 대일빌딩 2F, 3F</li>
                      </ul>
                    </div>

                    <div class="col-3">
                      <ul class="foot-logos">

                        <li><a
                            href="https://section.blog.naver.com/BlogHome.naver?directoryNo=0&currentPage=1&groupId=0"
                            target='_blank' class="nblog"></a></li>
                        <li><a href="https://twitter.com/" target='_blank' class="twitter"></a></li>
                        <li><a href="https://www.instagram.com/" target='_blank' class="instargram"></a></li>
                        <li><a href="https://www.facebook.com/" target='_blank' class="facebook"></a></li>

                      </ul>
                    </div>
                  </div>
                  <hr class="bottomHr">
                  <div class="row">
                    <div class="col-9">
                      <p class="foot_caution">PlaceHolder는 통신판매중개자이자 통신판매 당사자 입니다. 따라서 PlaceHolder는 공간 거래정보 및 거래내역을 소유할
                        수
                        있습니다.</p>
                    </div>
                    <div class="col-3">
                      <p class="foot_caution">Copyright PLACEHOLDER Corp. All Rights Reserved.</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

        </div>
      </div>
      <script>

        // 페이지 새로고침
        document.querySelector("#pagereload").addEventListener("click", function () {
          location.href = "/list.hotel";
        })

        // 홈으로
        document.querySelector("#goHome").addEventListener("click", function () {
          location.href = "/index.jsp";
        })
        
        // 커뮤니티로
		$(".boardGo").on("click", function(){
          location.href = "/articleList.article";
        })
        
        // 수정 제출 전 확인
        $("#form").on("submit", function(){
        	if(!confirm("정말 수정하시겠습니까?")){
        		return false;
        	}
        })
        
        // 리뷰 수정하기 버튼 누르면              
        $("#modifyReview").on("click", function(){
        	$("#submit").css('display','inline');
        	$("#cancelModification").css('display','inline');
        	$("#modifyReview").css('display','none');
        	$("#reviewContent").attr("readonly", false);
        })
        
        let originalContent = $("#reviewContent").val();
        
        // 리뷰 수정 취소
        $("#cancelModification").on("click", function(){
        	if(confirm("정말 취소하시겠습니까?")){
        		$("#submit").css('display','none');
            	$("#cancelModification").css('display','none');
            	$("#modifyReview").css('display','inline');
            	$("#reviewContent").attr("readonly", true);
            	$("#reviewContent").val(originalContent);
            	
        	}
        })
        
      </script>

    </body>

    </html>