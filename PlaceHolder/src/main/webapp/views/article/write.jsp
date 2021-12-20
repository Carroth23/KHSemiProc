<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>PlaceHolder</title>
      <!-- 파비콘 -->
<link rel="shortcut icon" type="image/x-icon" href="/semi-img/favicon.ico" />
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
                          <button type="button" class="sideBanner">자유게시판</button>
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
                <p id="pagereload">예약</p>
              </div>
              <div class="col-2 community bannerIn">
                <p id = "community">커뮤니티</p>
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
		<!-- 내용물 -->
        <form action ="/write.article" method="get">
        	<div class = "container">
        	<div class = "row title">
        		<div class = "col title" style = "text-align:center;">
        			<br>
        			<br>
        			<label>제목 : </label>
        			<input type = "text" id = "postTitle" name = "postTitle" style = "width: 70%;" placeholder = "제목을 입력하세요">
        		</div>
        	</div>
        	<br>
        	<div class = "row content">
        		<div class = "col content" style = "text-align:center;">
        			<textarea rows = "20" cols = "90" id = "postContent" name = "postContent"></textarea>
        		</div>
        	</div>
        	<div class = "row button">
        		<div class = "col button" style = "text-align:right;">
        			<input type = reset values = "초기화" style = "width : 60px;">
        			<input type = submit values = "글 작성" style = "width : 60px;">
        		</div>
        	</div>
        </div>
        </form>
        
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
   // 검색하여 페이지 새로고침 될 시 더보기 없애기
      $(function () {
        let link = document.location.search;
        if (link != '') {
          readMore.style.display = "none";
        }
      });
      
      //예약으로 이동
      document.querySelector("#pagereload").addEventListener("click", function () {
          location.href = "/list.hotel";
        })

     // 홈으로
       document.querySelector("#goHome").addEventListener("click", function () {
          location.href = "/index.jsp";
        })
        
     // 페이지 새로고침
        document.querySelector("#community").addEventListener("click", function () {
          location.href = "/articleList.article";
        })
     
     //글자수 제한
     $("#postContent").keyup(function(){
    	 let content = $(this).val();
    	 if(content.length > 1000){
    		 alert("최대 1000자 입력가능합니다.")
    		 $(this).val(content.substring(0,1000));
    	 }
     });
     
     $("#postTitle").keyup(function(){
    	 let title = $(this).val();
     	if(title.length > 100){
     		alert("최대 100자 입력가능합니다.")
     		$(this).val(content.substring(0,100));
     	 }
     });
     
       
      </script>

    </body>

    </html>