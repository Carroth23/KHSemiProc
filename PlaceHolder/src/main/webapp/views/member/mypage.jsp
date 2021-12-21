<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PlaceHolder</title>
<link rel="shortcut icon" type="image/x-icon"
	href="/semi-img/favicon.png" />
<!-- 제이쿼리CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 부트스트랩CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<!-- 폰트어썸CDN -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">
<!-- 구글 폰트CDN -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="/semi-css/mypage.css">
</head>
<body>
	<div class="container">
		<div class="containerIn">
			<div class="container">

				<!-- 사이드바 코드 시작 -->
          <div class="row header">
            <div class="col-3 align-self-center">
              <a href="index.jsp"><img src="/semi-img/logos.png" id="logo"></a>
            </div>
            <div class="col-8 align-self-center">

              <input type="text" placeholder="HotelName" id="topSearch">
              <button type="button" class="top-search" id="topSearchBtn">
                <i class="fas fa-search"></i>
              </button>

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
                                <a href="/list.hotel"><button class="loginAccBanner">Hotels</button></a>
                              </div>
                              <div class="col-3">
                                <a href=""><button class="loginAccBanner">후기</button></a>
                              </div>
                              <div class="col-3">
                                <a href="/likeList.like?loginId=${loginId}"><button
                                    class="loginAccBanner">찜목록</button></a>
                              </div>
                              <div class="col-3">
                                <a href="/mypage.home"><button class="loginAccBanner">MyPage</button></a>
                              </div>
                            </div>
                          </li>

                          <c:if test="${loginId == 'admin00'}">
                            <button id="adminBtn">관리자 창으로</button>
                          </c:if>

                          <!-- 빠른예약 -->
                          <li class="nav-item" id="speedRevMargin">
                            <form action="/confirm.book" method="get" id="form">
                              <div class="row">
                                <hr>
                                <p class="sidetxt">빠른 예약</p>
                                <div class="nav3 col-12">
                                  <select id="sideHotelSelect" onchange="selectBoxChange(this.value);">
                                    <c:forEach var="list" items="${hotelListS }">
                                      <option value=${list.hotelId}>${list.hotelName}</option>
                                    </c:forEach>
                                  </select>
                                  <input type="text" name="hotelId" id="sideHotelId">
                                </div>
                                <div class="nav3 row">
                                  <div class="col-6 speedRevIn">
                                    CheckIn
                                    <input type=date name="checkIn" id="speedRevIn" min="2021-12-25" max="2022-12-30">
                                  </div>
                                  <div class="col-6 speedRevOut">
                                    CheckOut
                                    <input type=date name="checkOut" id="speedRevOut" min="2021-12-26" max="2022-12-31">
                                  </div>
                                </div>

                                <div class="row sideRoomTypeBox">
                                  <div calss="col-8" id="sideRoomTypeBox">
                                    <select id="selectRoomType" onchange="selectRoomChange(this.value);">
                                      <option value="스탠다드룸">스탠다드룸</option>
                                      <option value="더블룸">더블룸</option>
                                      <option value="디럭스룸">디럭스룸</option>
                                      <option value="스위트룸">스위트룸</option>
                                      <option value="이그제큐티브룸">이그제큐티브룸</option>
                                    </select>
                                    <input type="text" name="revRoomType" id="revRoomType" display="none">
                                  </div>
                                  <div class="col-2">
                                    <select name="revQuantity" id="revQuantity">
                                      <option value="1">1 개</option>
                                      <option value="2">2 개</option>
                                      <option value="3">3 개</option>
                                      <option value="4">4 개</option>
                                      <option value="5">5 개</option>
                                    </select>
                                  </div>
                                  <div class="col-2 align-self-right">
                                    <select name="addPrice" id="addPrice">
                                      <option value="1">1 명</option>
                                      <option value="2">2 명</option>
                                      <option value="3">3 명</option>
                                      <option value="4">4 명</option>
                                      <option value="5">5 명</option>
                                      <option value="6">6 명</option>
                                    </select>
                                  </div>
                                </div>

                                <button type="button" class="nav-2" id="sideReserveBtn">
                                  Reservation
                                </button>
                              </div>
                            </form>
                          </li>
                          <!-- 빠른예약 끝 -->

                        </c:when>
                        <c:otherwise>
                          <!-- 로그인 폼 -->
                          <li class="nav-item">
                            <div class="row signBox">
                              <form action="/login.user" method="post">
                                <div class="col-12 signInput">
                                  <input type="text" placeholder="Input ID" class="inputId" name="id" id="inputId">
                                  <input type="password" placeholder="Input PW" class="inputPw" name="pw" id="inputPw">
                                </div>
                                <div class="row">
                                  <div class="col-6 sign">
                                    <button type="button" class="signBtns" id="loginBtn">로그인</button>
                                  </div>
                                  <div class="col-6 sign">
                                    <a href="/signupPage.user"><button type="button"
                                        class="signBtns signUp">회원가입</button></a>
                                  </div>
                                </div>
                              </form>
                            </div>
                          </li>

                          <!-- 로그인 밑 캐러셀 -->

                          <li class="nav-item" id="sideC">
                            <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
                              <div class="carousel-inner sideCBackBox">
                                <div class="sideCBack">PlaceHolder</div>
                                <div class="carousel-item active">
                                  <img src="/semi-img/sideC1.jpg" class="d-block w-100" alt="여행을 해보세요">
                                </div>
                                <div class="carousel-item">
                                  <img src="/semi-img/sideC2.jpg" class="d-block w-100" alt="나만의 공간">
                                </div>
                                <div class="carousel-item">
                                  <img src="/semi-img/sideC3.jpg" class="d-block w-100" alt="PlaceHolder">
                                </div>
                              </div>
                            </div>
                          </li>

                        </c:otherwise>
                      </c:choose>
                      <li class="nav-item nav-banner">
                        <a href="/main.home"><button type="button" class="sideBanner">처음으로</button></a>
                      </li>
                      <li class="nav-item nav-banner">
                        <a href="/articleList.article"><button type="button" class="sideBanner">자유게시판</button></a>
                      </li>
                    </ul>
                  </div>
                </div>
              </nav>
            </div>
          </div>
          <!-- 사이드바 코드 끝 -->

				<div class="row" id="banner">
					<div class="col-2 goHome bannerIn">
						<p id="goHome">메인으로</p>
					</div>
					<div class="col-2 reservation bannerIn">
						<p id="pagereload">예약</p>
					</div>
					<div class="col-2 community bannerIn">
						<p class="boardGo">커뮤니티</p>
					</div>
					<div class="col-2 mypage bannerIn">
						<p id="mypage">마이페이지</p>
						</a>
					</div>
				</div>
				<!-- 마진, 패딩값 조정할 필요성 있음! -->
				<!-- 회원 환영 메시지 공간 -->
				<div class="row">
					<div class="col-10 contentAll" id="content1">
						<div class="conBack"></div>

						<div class="conInBox conInBox1">
							<p>${loginId}님환영합니다.</p>
							<p>이미지 + 아이콘 추가 예정</p>
							<br> <br> <br> <br> <br> <br> <br>
						</div>

					</div>
				</div>

				<!-- CSS 수정 필요함 -->
				<div class="row" id="banner">
					<div class="col-2 goHome bannerIn">
						<p id="myInfo">정보수정</p>
					</div>
					<div class="col-2 reservation bannerIn">
						<p id="myReservation">예약목록</p>
					</div>
					<div class="col-2 community bannerIn">
						<p id="myBoard">내가 쓴 글</p>
					</div>
					<div class="col-2 mypage bannerIn">
						<p id="myInquiry">고객센터</p>
					</div>
				</div>
				<!-- list 추가하는 곳   -->
				<!-- 예약 리스트 추가 -->
				<c:forEach var="reserv" items="${reserveList}" varStatus="status">
					<div class="row" id="banner1">
						<div class="col-12 detail">
							<!-- 각 방의 form -->
							<form action="/reservation.pay" method="get"
								id="form${status.index }">
								<div class="row roomInfoBox">
									<div class="col-3 roomDate">예약한 호텔 이미지</div>
									<div class="col-4 roomInfo">
										<input type="text" id="hotelId${status.index }" name="hotelId"
											class="throwRun" value=${reserv.hotelId } display="none">
										<input type="text" id="revId${status.index }" name="revId"
											class="throwRun" value=${reserv.revId } display="none">
										<input type="text" id="revPrice${status.index }"
											name="revPrice" class="throwRun" value=${reserv.revPrice
											} display="none"> <input type="text"
											id="hotelName${status.index }" name="revPrice"
											class="throwRun" value=${reserv.hotelName } display="none">
										<input type="hidden" name="revId" id="${reserv.revId }"
											value="${reserv.revId }" />
										<p class="showReservation">예약 번호 : ${reserv.revId}</p>
										<p class="showReservation">${reserv.hotelName}</p>
										<p class="showReservation">${reserv.checkIn}~${reserv.checkOut}</p>
										<p class="showReservation">${reserv.revRoomType}
											₩${reserv.revPrice}</p>
										<!--<c:choose>
											<c:when test="new Date(${reserv.checkOut}) < new Date() }">
												<p class="showReservation">예약 상태 : 완료</p>
												<button class="roomSubmit justify-content-end">리뷰
													작성</button>
											</c:when>
											<c:otherwise> -->
										<p class="showReservation">예약 상태 : ${reserv.revStat}</p>
										<input type="button" value="예약취소"
											onclick="deleteRev(${reserv.revId })">
										<c:choose>
											<c:when test="${reserv.revStat != '확정'}">
												<input type=button class="payReservation" value="결제하기"
													onclick="payRev(${status.index })">
											</c:when>
											<c:otherwise>
											</c:otherwise>
										</c:choose>
										<!--</c:otherwise>
										</c:choose>-->
									</div>
									<div class="col-5 roomDate">
										<p>예약 변경
										<p>
											체크인 : <input type="date" id="checkIn${status.index }"
												name="checkIn" min="2021-12-25" max="2022-12-30"><br>
											체크아웃 : <input type="date" id="checkOut${status.index }"
												class="roomDateEnd" name="checkOut" min="2021-12-26"
												max="2022-12-31"><br> 방 타입 :
											<!-- <div class="col-3"> -->
											<select class="revRoomType" id="revRoomType${status.index }">
												<option value="스탠다드룸" selected>스탠다드룸</option>
												<option value="더블룸">더블룸</option>
												<option value="디럭스룸">디럭스룸</option>
												<option value="스위트룸">스위트룸</option>
												<option value="이그제큐티브룸">이그제큐티브룸</option>
											</select>
											<!-- onchange="selectRoomChange(this.value);" <input type="text" name="revRoomType" id="revRoomType${status.index }" style="display: none"> -->
											<!--</div>-->
											방 개수 :
											<!-- <input type="text" id="revQuantity" class="revQuantity">개<br> -->
											<select name="revQuantity" id="revQuantity${status.index }">
												<option value="1">1 개</option>
												<option value="2">2 개</option>
												<option value="3">3 개</option>
												<option value="4">4 개</option>
												<option value="5">5 개</option>
											</select> 방 1개 당 인원 :
											<!-- <input type="text" id="addPrice" class="addPrice" name="addPrice">명<br>-->
											<!-- <div class="nav3">-->
											<select name="addPrice" id="addPrice${status.index }">
												<option value="1">1 명</option>
												<option value="2">2 명</option>
												<option value="3">3 명</option>
												<option value="4">4 명</option>
												<option value="5">5 명</option>
												<option value="6">6 명</option>
											</select>
											<!--</div>-->
											<br> <input type="button" value="예약수정"
												class="modifyReservation"
												onclick="modifyRev(${status.index })">
									</div>
								</div>
							</form>
						</div>
					</div>
				</c:forEach>
				<!-- 내가 쓴 글 : article에서 끌어오기 -->
				<c:forEach var="article" items="${articleList}">
					<div class="row" id="banner2">
						<div class="col-12 review">
							<div class="row reviewBox">
								<form action="/modify.article" method="get">
									<div class="col-3 reviewImg">리뷰 이미지 공간</div>
									<div class="col-6 reviewInfo">
										<span>${article.postId} 님의 리뷰 </span>
										<!-- <img src="/semi-img/star.png">  -->
										<span>${article.postTitle}</span> <br> <span>${article.postContent}</span><br>
										<span class="reviewWriteDate">작성 날짜 :
											${article.postCreated}</span> <span class="reviewWriteDate">수정
											날짜 : ${article.postModified}</span>
									</div>
									<div class="col-3 reviewImg">
										<input type=text name="postId" value="${article.postId}"
											style="display: none"> <input type=text
											name="postTitle" value="${article.postTitle}"
											style="display: none"> <input type=text
											name="postContent" value="${article.postContent}"
											style="display: none"> <input type=submit
											value="내 글 수정하기" id="modifyMyArticle">
									</div>
								</form>
							</div>
				</c:forEach>
			</div>
		</div>
		<!-- 내 Q & A -->
		<div class="row" id="banner2">
			<div class="col-12 review">
				<c:forEach var="inquiry" items="${myInquiry}">
					<div class="row reviewBox">
						<div class="col-9 reviewInfo">
							<span>${inquiry.userId} 님의 문의 </span> <span>문의 내용 :
								${inquiry.inquiryContent}</span> <span class="reviewWriteDate">작성
								날짜 : ${inquiry.inquiryCreated}</span> <span>답변 현황 :
								${inquiry.inquiryStat}</span>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<!-- 오늘의 추천 상품 -->
		<div class="row">
			<div class="col-12 slideBox">
				<c:forEach var="cardHotel" items="${hotelListAll}">
					<div class="card">
						<form action="/goods.room" method="get">
							<img src="/semi-img/silde_h1.jpg" class="card-img-top" alt="...">
							<div id="card-body">
								<h5 class="card-title">${cardHotel.hotelName}</h5>
								<p class="card-text">${cardHotel.hotelDetail}</p>
								<input type="text" name="hotelId" class="throwRun"
									value=${cardHotel.hotelId}>
								<button class="cardbtn justify-content-center">보러가기</button>
							</div>
						</form>
					</div>
				</c:forEach>
			</div>
		</div>
		<!-- 리뷰 존 -->
		<div class="row">
			<div class="row">
				<p class="myInquiry">오늘의 추천 상품</p>
			</div>
			<c:forEach var="cardHotel" items="${hotelList}">
				<div class="col-12 slideBox">
					<form action="/goods.room" method="get">
						<div class="card" id="card">
							<img src="/semi-img/silde_h1.jpg" class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title">${cardHotel.hotelName}</h5>
								<p class="card-text">${cardHotel.hotelDetail}</p>
								<button type=submit>보러가기</button>
								<input type=text name=hotelId value="${cardHotel.hotelId }"
									style="display: none"}>
							</div>
						</div>
					</form>
				</div>
			</c:forEach>
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
							<div class="col-3 footer-center"></div>
							<div class="col-6 footer-right">
								<ul class="foot-ul-blog">
									<li><a
										href="https://section.blog.naver.com/BlogHome.naver?directoryNo=0&currentPage=1&groupId=0">블로그</a>
									</li>
									<li><a href="footer.jsp">이용약관</a></li>
									<li><a href="footer2.jsp">개인정보처리방침</a></li>
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
									<li><a href="https://twitter.com/" target='_blank'
										class="twitter"></a></li>
									<li><a href="https://www.instagram.com/" target='_blank'
										class="instargram"></a></li>
									<li><a href="https://www.facebook.com/" target='_blank'
										class="facebook"></a></li>
								</ul>
							</div>
						</div>
						<hr class="bottomHr">
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
	</div>
	<script>
		// 사이드바 관련 스크립트 시작
        $("#loginBtn").on("click", () => {
          let logId = $("#inputId").val();
          let logPw = $("#inputPw").val();
          $.ajax({
            type: "POST",
            url: "/login.user",
            data: {
              "id": logId,
              "pw": logPw
            }
          }).done(function (res) {
            if (res == 'true') {
              if (logId == 'admin00') {
                console.log("어드민 로그인");
                location.href = "/user.admin";
              } else {
                alert(`\${logId}님 환영합니다.`);
                location.reload();
              }
            } else if (res == 'false') {
              alert("아이디와 비밀번호를 확인해주세요.");
            }
          })
        })

        $(".signUp").on("click", function () {
          location.href = "/signupPage.user";
        })

        // 빠른 예약 select box 함수 ***** 현우 : 호텔 select box
        let selectBoxChange = function (value) {
          console.log(value);
          $("#sideHotelId").val(value);
        }
        // 룸 타입 selectbox 함수
        let selectRoomChange = function (value) {
          console.log(value);
          $("#revRoomType").val(value);
        }

        $(".logOut").on("click", () => {
          alert("로그아웃 되었습니다.");
        })

        // 사이드 바 예약 확인
        $("#sideReserveBtn").on("click", function () {
          let hotelId = document.getElementById("sideHotelId").value;
          let checkIn = document.getElementById("speedRevIn").value;
          let checkOut = document.getElementById("speedRevOut").value;
          let revRoomType = document.getElementById("revRoomType").value;
          let revQuantity = document.getElementById("revQuantity").value;
          let addPrice = document.getElementById("addPrice").value;

          console.log(checkIn + checkOut + revRoomType + revQuantity + addPrice);

          if (checkIn == '' || checkOut == '') {
            alert("체크인, 체크아웃 날짜를 입력해주세요");
            return false;
          } else if (checkIn >= checkOut) {
            alert("체크아웃 날짜는 체크인 다음날부터 가능합니다.");
            return false;
          } else if (revRoomType == '') {
            alert("방 타입을 선택해주세요.");
            return false;
          } else if (revQuantity == '') {
            alert("방 개수를 선택해주세요.");
            return false;
          } else if (addPrice == '') {
            alert("방 1개 당 인원을 선택해주세요.");
            return false;
          } else {
            if (confirm("예약 하시겠습니까?")) {
              alert("예약이 완료되었습니다.");
              $("#form").submit();
            }
          }
        })

        // 관리자 이동버튼
        $("#adminBtn").on("click", () => {
          location.href = "/user.admin";
        })

        // 사이드바 관련 스크립트 끝

		// 홈으로
		document.querySelector("#goHome").addEventListener("click", function() {
			location.href = "/index.jsp";
		})

		// 예약으로 이동
		document.querySelector("#pagereload").addEventListener("click",
				function() {
					location.href = "/list.hotel";
				})

		// 커뮤니티로
		document.querySelector(".boardGo").addEventListener("click",
				function() {
					location.href = "/articleList.article";
				})

		// 마이페이지로
		document.querySelector("#mypage").addEventListener("click", function() {
			location.href = "/mypage.home";
		})

		// 내 정보 수정
		document.querySelector("#myInfo").addEventListener("click", function() {
			location.href = "/update.user";
		})

		// 예약 목록 출력
		document.querySelector("#myReservation").addEventListener("click",
				function() {
					location.href = "/viewReservationList.book";
				})
		// 예약 결제하기 기능
		function payRev(index){
			let result = confirm("결제하시겠습니까?");
			
			if(result){
				document.getElementById("form"+index).submit();
			}
		}
		
		// 예약 수정하기 기능		
		function modifyRev(index){
			console.log(index);
			const now = new Date();
			let revId = document.getElementById("revId"+index).value;
			let hotelId = document.getElementById("hotelId"+index).value;
			let checkIn = document.getElementById("checkIn"+index).value;
			let checkOut = document.getElementById("checkOut"+index).value;
			let revRoomType = document.getElementById("revRoomType"+index).value;
			let revQuantity = document.getElementById("revQuantity"+index).value;
			let addPrice = document.getElementById("addPrice"+index).value;		
			
			console.log(checkIn + checkOut + revRoomType + revQuantity + addPrice);
			
			if (checkIn == '' || checkOut == '') {
				alert("체크인, 체크아웃 날짜를 입력해주세요");
				return false;
			} else if (checkIn >= checkOut) {
				alert("체크아웃 날짜는 체크인 다음날부터 가능합니다.");
				return false;
			} else if (revRoomType == '') {
				alert("방 타입을 선택해주세요.");
				return false;
			} else if (revQuantity == '') {
				alert("방 개수를 선택해주세요.");
				return false;
			} else if (addPrice == '') {
				alert("방 1개 당 인원을 선택해주세요.");
				return false;
			} else {
				let response = confirm("예약을 변경하시겠습니까?");
				if (response) {
					$.ajax({
						url:"/modifyReservation.book",
						data: {
							"revId":revId,
							"hotelId":hotelId,
							"checkIn":checkIn,
							"checkOut":checkOut,
							"revRoomType":revRoomType,
							"revQuantity":revQuantity,
							"addPrice": addPrice
						}
					}).done(function(){
						alert("변경이 완료되었습니다.");
						location.href="/viewReservationList.book";
					})
				} else {
					return false;
				}
			}
		}
		// 예약 삭제
		function deleteRev(reservationId){
			
			if(confirm("예약 취소 후에는 복구가 불가능합니다.\n정말 예약을 취소하시겠습니까?")){
	               $.ajax({
	                  url: "/deleteReservation.book",
	                  data: {"revId" : reservationId}
	               }).done(function(){
	            	  alert("예약이 취소되었습니다. 감사합니다.");
	                  location.href = "/viewReservationList.book";
	               })
	            }
		}
		// 내가 쓴 글 출력
		document.querySelector("#myBoard").addEventListener("click",
				function() {
					location.href = "/viewMyArticle.article";
				})
		
		// 내 글 수정
		//$("#modifyMyArticle").on("click",
		//	function(){
		//location.href = "/articleList.article";
		//})
		
		// 내 Q & A 출력
		document.querySelector("#myInquiry").addEventListener("click",
				function() {
					location.href = "/viewMyInquiry.qna";
				})
				
	</script>
</body>
</html>