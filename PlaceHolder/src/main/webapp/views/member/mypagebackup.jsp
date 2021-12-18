<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Insert title here</title>
            <link rel="shortcut icon" type="image/x-icon" href="/semi-img/favicon.png" />
            <!-- 제이쿼리CDN -->
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <!-- 부트스트랩CDN -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
                crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
                crossorigin="anonymous"></script>
            <!-- 폰트어썸CDN -->
            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
                integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
                crossorigin="anonymous">
            <!-- 구글 폰트CDN -->
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap"
                rel="stylesheet">

            <link rel="stylesheet" href="/semi-css/mypage.css">
        </head>

        <body>

            <!-- 전체를 사용하기위해 fluid -->
            <div class="container-fluid">
                <div class="container">
                    <div class="row header">
                        <div class="col-3 align-self-center">
                            <a href="index.jsp"><img src="/semi-img/logos.png" id="logo"></a>
                        </div>
                        <div class="col-8 align-self-center" id="head2">
                            <form class="d-flex">
                                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                                <button class="top-search">
                                    <i class="fas fa-search"></i>
                                </button>
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
                                                            <div class="col-4"><a href="/logout.user"><button
                                                                        class="logOut">로그아웃</button></a></div>
                                                        </div>
                                                        <div class="row loginAccBannerH">
                                                            <div class="col-3">
                                                                <a href="/list.hotel"><button
                                                                        class="loginAccBanner">예약</button></a>
                                                            </div>
                                                            <div class="col-3">
                                                                <a href=""><button
                                                                        class="loginAccBanner">후기</button></a>
                                                            </div>
                                                            <div class="col-3">
                                                                <a href=""><button
                                                                        class="loginAccBanner">찜목록</button></a>
                                                            </div>
                                                            <div class="col-3">
                                                                <a href="/userInfo.user"><button
                                                                        class="loginAccBanner">MyPage</button></a>
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
                                                                    <input type="text" placeholder="Input ID"
                                                                        class="inputId" name="id"> <input
                                                                        type="password" placeholder="Input PW"
                                                                        class="inputPw" name="pw">
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-6 sign">
                                                                        <button class="signBtns">로그인</button>
                                                                    </div>
                                                                    <div class="col-6 sign">
                                                                        <button type="button"
                                                                            class="signBtns signUp">회원가입</button>
                                                                    </div>
                                                                </div>
                                                            </form>
                                                        </div>


                                                    </li>
                                                </c:otherwise>
                                            </c:choose>
                                            <li class="nav-item">
                                                <a href="/main.user"><button type="button"
                                                        class="sideBanner">메인으로</button></a>
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
                </div>
                <!-- nav 바 첫번째 -->
                <div class="container">
                    <div class="nav">
                        <div class="nav1">
                            <a href="">
                                <button type="button" class="navBtn">예약</button>
                            </a>
                        </div>
                        <div class="nav1">
                            <a href="">
                                <button type="button" class="navBtn">커뮤니티</button>
                            </a>
                        </div>
                        <div class="nav1">
                            <a href="">
                                <button type="button" class="navBtn">고객센터</button>
                            </a>
                        </div>
                        <div class="nav1">
                            <a href="">
                                <button type="button" class="navBtn">MY PAGE</button>
                            </a>
                        </div>

                    </div>
                </div>
                <br>

                <!-- My page -->
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <i class="fas fa-house-user fa-7x"></i>
                        </div>
                    </div>
                    <br>

                    <div class="row">
                        <div class="col-12">
                            <div>
                                <h5>${loginId}님안녕하세요.</h3>
                            </div>
                        </div>
                    </div>
                </div>


                <!-- nav 바 두번째 -->
                <div class="container id=nav2">
                    <div class="nav">
                        <div class="nav2">
                            <a href="/update.user">
                                <button type="button" class="nav2Btn">정보수정</button>
                            </a>
                        </div>
                        <div class="nav2">                            
                                <button type="button" class="nav2Btn" id="myReview">내 리뷰</button>                            
                        </div>
                        <div class="nav2">                            
                                <button type="button" class="nav2Btn" id="myWrite">내가 쓴 글</button>                            
                        </div>
                        <div class="nav2">                            
                                <button type="button" class="nav2Btn" id="qna">내 Q&A</button>                            
                        </div>
                        <div class="nav2">                            
                                <button type="button" class="nav2Btn" id="reserve">내 예약</button>                            
                        </div>
                    </div>
                </div>

                <!--  nav2 아래페이지 -->
                <div class="container" id="page">
                    <div class="nav2Page" id="reviewPage">
                        <div class=col-3>
							<img src="" id="reviewImage">                        
                        </div>
                        <div class=col-9>
                        </div>
                    </div>
                    <div class="nav2Page" id="writePage" style="display: none;">
                        내가 쓴 글 페이지입니다.
                    </div>
                    <div class="nav2Page" id="qnaPage" style="display: none;">
                        Q&A 페이지 입니다.
                    </div>
                    <div class="nav2Page" id="reservePage" style="display: none;">
                        내가 예약을 알아볼수 있는 페이지입니다.
                    </div>
                </div>

                <script>
                    $("#myReview").on("click", function () {
                        $("#reviewPage").css("display", "inline");
                        $("#writePage").css("display", "none");
                        $("#qnaPage").css("display", "none");
                        $("#reservePage").css("display", "none");
                    })
                    $("#myWrite").on("click", function () {
                        $("#writePage").css("display", "inline");
                        $("#reviewPage").css("display", "none");
                        $("#qnaPage").css("display", "none");
                        $("#reservePage").css("display", "none");
                    })
                    $("#qna").on("click", function () {
                        $("#qnaPage").css("display", "inline");
                        $("#reviewPage").css("display", "none");
                        $("#writePage").css("display", "none");
                        $("#reservePage").css("display", "none");
                    })
                    $("#reserve").on("click", function () {
                        $("#reservePage").css("display", "inline");
                        $("#reviewPage").css("display", "none");
                        $("#writePage").css("display", "none");
                        $("#qnaPage").css("display", "none");
                        // ***** 현우 ajax 수정 *****// 
                        $.ajax({
                        	url:"/viewReservationList.book",
                        	type: "get",
                        }).done(function (resp){
                        	// forEach문 돌려서 div로 리스트 뽑아내기
                        	let result = JSON.parse(resp);
                        	
                        	for(let i = 0; i < result.length; i++){
                        		console.log(result[i].revId + " : " + result[i].userId + " : " + result[i].hotelId
                        				+ " : " + result[i].hotelName + " : " + result[i].hotelRoadAddress + " : " +
                        				" : " + result[i].hotelPhone + " : " + result[i].checkIn + " : " + result[i].checkOut +
                        				" : " + result[i].revDay + " : " + result[i].revRoomtype + " : " + result[i].revQuantity +
                        				" : " + result[i].revRoomInfo + " : " + result[i].revStat + " : " + result[i].revPrice);
                        	}
                        	
                        });
                    })
                    
                </script>


                <!-- Today's Hot! -->
                <div class="container" id="today">
                    <div class="thTitle">
                        <h1>Today's Hot</h1>
                        <br>
                    </div>
                    <div class="thPicture">
                        <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <div class="row">
                                        <div class="col-4">
                                            <div class="card text-dark mb-3"
                                                style="max-width: 18rem; background-color: rgba(0, 255, 255, 0.24);">
                                                <a href="">
                                                    <div class="card-body" id="cardlist1">
                                                    </div>
                                                </a>
                                                <div class="card-header">
                                                    <h5>현우님한테 드리는 호텔</h5>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="card text-dark mb-3"
                                                style="max-width: 18rem; background-color: rgba(0, 255, 255, 0.24);">
                                                <a href="">
                                                    <div class="card-body" id="cardlist2">
                                                    </div>
                                                </a>
                                                <div class="card-header">
                                                    <h5>진규선물</h5>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="card text-dark mb-3"
                                                style="max-width: 18rem; background-color: rgba(0, 255, 255, 0.24);">
                                                <a href="">
                                                    <div class="card-body" id="cardlist3">
                                                    </div>
                                                </a>
                                                <div class="card-header">
                                                    <h5>소현선물</h5>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <div class="row">
                                        <div class="col-4">
                                            <div class="card text-dark mb-3"
                                                style="max-width: 18rem; background-color: rgba(0, 255, 255, 0.24);">
                                                <a href="">
                                                    <div class="card-body" id="cardlist4">
                                                    </div>
                                                </a>
                                                <div class="card-header">
                                                    <h5>병주야 받으렴</h5>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="card text-dark mb-3"
                                                style="max-width: 18rem; background-color: rgba(0, 255, 255, 0.24);">
                                                <a href="">
                                                    <div class="card-body" id="cardlist5">
                                                    </div>
                                                </a>
                                                <div class="card-header">
                                                    <h5>강사님 선물</h5>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="card text-dark mb-3"
                                                style="max-width: 18rem; background-color: rgba(0, 255, 255, 0.24);">
                                                <a href="">
                                                    <div class="card-body" id="cardlist6">
                                                    </div>
                                                </a>
                                                <div class="card-header">
                                                    <h5>나에게 주는 선물</h5>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <button class="carousel-control-prev" type="button"
                                data-bs-target="#carouselExampleControls" data-bs-slide="prev">

                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button"
                                data-bs-target="#carouselExampleControls" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>

                    </div>
                </div>
                <hr>
                <br><br>
                <!-- Review Zone  -->
                <div class="container" id="review">
                    <div class="rzTitle">
                        <h1>- Review Zone -</h1>
                        <br>
                    </div>
                    <div class="rzPicture">
                        <div class="row row-cols-1 row-cols-md-3 g-4">
                            <div class="col">
                                <div class="card h-100">
                                    <a href="">
                                        <p class=card-img id="card-img-1"></p>
                                        <div class="card-body">
                                            <h5 class="card-title">천현우 호텔</h5>
                                            <p class="card-text">조장이여 영원하라</p>
                                        </div>
                                    </a>
                                    <div class="card-footer">
                                        <small class="text-muted">Last updated 3 mins ago</small>
                                    </div>

                                </div>
                            </div>
                            <div class="col">
                                <div class="card h-100">
                                    <a href="">
                                        <p class=card-img id="card-img-2"></p>
                                        <div class="card-body">
                                            <h5 class="card-title">진규의 따듯한 호텔</h5>
                                            <p class="card-text">찜질방보단 진규호텔으로</p>
                                        </div>
                                    </a>
                                    <div class="card-footer">
                                        <small class="text-muted">Last updated 3 mins ago</small>
                                    </div>
                                </div>
                            </div>
                            <div class="col">
                                <div class="card h-100">
                                    <a href="">
                                        <p class=card-img id="card-img-3"></p>
                                        <div class="card-body">
                                            <h5 class="card-title">소현의 니노막시무스 호텔</h5>
                                            <p class="card-text">아샷추 Let's get it!</p>
                                    </a>
                                </div>
                                <div class="card-footer">
                                    <small class="text-muted">Last updated 3 mins ago</small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br>
                    <!-- ------------------------------------------------------------------------------------------------------ -->
                    <div class="row row-cols-1 row-cols-md-3 g-4">
                        <div class="col">
                            <div class="card h-100">
                                <a href="">
                                    <p class=card-img id="card-img-4"></p>
                                    <div class="card-body">
                                        <h5 class="card-title">병주의 병주고 약주고</h5>
                                        <p class="card-text">데이터베이스 세계로 들어호텔</p>
                                </a>
                            </div>
                            <div class="card-footer">
                                <small class="text-muted">Last updated 3 mins ago</small>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card h-100">
                            <a href="">
                                <p class=card-img id="card-img-5"></p>
                                <div class="card-body">
                                    <h5 class="card-title">김동현92호텔</h5>
                                    <p class="card-text">킹받을 때 들릴수 있는 호텔입니다.</p>
                                </div>
                            </a>
                            <div class="card-footer">
                                <small class="text-muted">Last updated 3 mins ago</small>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card h-100">
                            <a href="">
                                <p class=card-img id="card-img-6"></p>
                                <div class="card-body">
                                    <h5 class="card-title">조성태 강사님 이용호텔</h5>
                                    <p class="card-text">인생이 코딩할 수있는 호텔</p>
                            </a>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted">Last updated 3 mins ago</small>
                        </div>
                    </div>
                </div>
            </div>
            <br><br>

            <!-- 추가 버튼 -->
            <div class="container">
                <button type="button" class="btn btn-warning"><i class="fas fa-plus"></i></button>
            </div>
            <br>


            <!-- 푸터 -->
            <div class="container-fluid footBack">
                <div class="container">
                    <div id="footer">
                        <div id="footerIn">
                            <div class="row">
                                <div class="col-3 footer-left">

                                    <a href="index.jsp" class="fot_logo"></a>

                                </div>
                                <div class="col-3 footer-center"></div>
                                <div class="col-6 footer-right">
                                    <ul class="foot-ul-blog">
                                        <li><a href="https://section.blog.naver.com/BlogHome.naver?directoryNo=0&currentPage=1&groupId=0"
                                                target='_blank'>블로그</a></li>
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

                                        <li><a href="https://section.blog.naver.com/BlogHome.naver?directoryNo=0&currentPage=1&groupId=0"
                                                target='_blank' class="nblog"></a></li>
                                        <li><a href="https://twitter.com/" target='_blank' class="twitter"></a></li>
                                        <li><a href="https://www.instagram.com/" target='_blank' class="instargram"></a>
                                        </li>
                                        <li><a href="https://www.facebook.com/" target='_blank' class="facebook"></a>
                                        </li>

                                    </ul>
                                </div>

                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-9">
                                    <p class="foot_caution">PlaceHolder는 통신판매중개자이자 통신판매 당사자 입니다.
                                        따라서 PlaceHolder는 공간 거래정보 및 거래내역을 소유할 수 있습니다.</p>
                                </div>
                                <div class="col-3">
                                    <p class="foot_caution">Copyright PLACEHOLDER Corp. All
                                        Rights Reserved.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            </div>
            <script>
            $("signUp").on("click", function(){
                location.href = "/signupPage.user";
              })
            </script>

        </body>

        </html>