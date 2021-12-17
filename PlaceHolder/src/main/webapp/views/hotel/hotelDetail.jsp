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
      <!-- 슬라이드CDN -->
      <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
      <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
      <link rel="stylesheet" href="/semi-css/hotelDetail.css">
    </head>

    <body>
      <div class="container">
        <div class="row header">
          <div class="col-3 align-self-center">
            <a href="index.jsp"><img src="/semi-img/logos.png" id="logo"></a>
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
              <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar">
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
                              <a href="/userInfo.user"><button class="loginAccBanner">MyPage</button></a>
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
                      <a href="/main.user"><button type="button" class="sideBanner">메인으로</button></a>
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

        <!-- 위 배너 -->
        <div class="row" id="banner">
          <div class="col-2 goHome bannerIn">
            <p id="goHome">메인으로</p>
          </div>
          <div class="col-3 reservation bannerIn">
            <p id="listGoBar">호텔 리스트</p>
          </div>
          <div class="col-3 community bannerIn">
            <p id="commuGobar">커뮤니티</p>
          </div>
          <div class="col-3 qna bannerIn">
            <p id="gogakGobar">고객센터</p>
          </div>
          <div class="col-3 mypage bannerIn">
            <p id="mypageGobar">마이페이지</p>
          </div>
        </div>

        <!-- 호텔설명칸 -->
        <div class="row">
          <div class="col-6 mainPhoto">
            <img src="/semi-img/hotel-list2.jpg">
          </div>
          <div class="col-6 mainInfo">
            <div class="row">
              <div class="col-6">
                <p class="hotelName">${hotelList.hotelName}</p> <!-- 호텔 이름 -->
              </div>
              <div class="col-6">
                <div class="star">
                  <img src="/semi-img/star.png">
                  <p>${hotelList.hotelScore}</p>
                  <c:choose>
                    <c:when test="${likeCheck == false}">
                      <div id="heart"><img src="/semi-img/heart.png" id="heartAjax"></div>
                    </c:when>
                    <c:when test="${likeCheck == true}">
                      <div id="heart"><img src="/semi-img/heartOn.png" id="heartAjax"></div>
                    </c:when>
                  </c:choose>
                  <div id="share"></div>
                </div>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-12 options">
                <span>위치 : </span><span>${hotelList.hotelRoadAddress}</span><br> <!-- 호텔 주소 -->
                <span>룸 옵션 : </span>
                <select>
                  <option>스탠다드룸</option>
                  <option>더블룸</option>
                  <option>디럭스룸</option>
                  <option>패밀리룸</option>
                  <option>스위트룸</option>
                </select>
                <br>
                <span>전화 번호 : </span><span>${hotelList.hotelPhone}</span><br><br>
                <span>1박당 가격 : </span><span>${RoomList[0].roomPrice}~</span>
                <a href="#banner1"><button class="reservationGo">룸 선택</button></a>
              </div>
            </div>
          </div>
        </div>

        <!-- 중간배너 -->
        <div class="row stickyBanner">
          <div class="col-3 detailBanner banner">
            <a href="#banner1" class="middleBanner">룸 타입</a>
          </div>
          <div class="col-3 reviewBanner banner">
            <a href="#banner2" class="middleBanner">리뷰</a>
          </div>
          <div class="col-3 qnaBanner banner">
            <a href="#banner3" class="middleBanner">QnA</a>
          </div>
          <div class="col-3 infoBanner banner">
            <a href="#banner4" class="middleBanner">정보</a>
          </div>
        </div>



        <!-- 각각의 배너에 해당하는 html -->
        <div class="row" id="banner1">
          <div class="col-12 detail">

            <!-- 각 방의 form -->
            <c:forEach var="room" items="${RoomList}">
              <form action="/confirm.book" method="get">
                <div class="row roomInfoBox">
                  <div class="col-3 roomImg">
                    <img src="/semi-img/detailRoom1.jpg" alt="룸1입니다">
                  </div>
                  <div class="col-5 roomInfo">
                    <input type="text" name="hotelId" class="throwRun" value=${hotelList.hotelId}>
                    <input type="text" name="hotelName" class="throwRun" value=${hotelList.hotelName}>
                    <input type="text" name="revRoomType" class="throwRun" value=${room.roomType}>
                    <input type="text" name="hotelPhone" class="throwRun" value=${hotelList.hotelPhone}>
                    <input type="text" name="hotelRoadAddress" class="throwRun" value=${hotelList.hotelRoadAddress}>
                    <p>${room.roomType}</p>
                    <p>옵션: 드라이, 샤워가운, 조식, 룸서비스 등등..</p>
                    <p>1박당 가격 : ${room.roomPrice}원</p>
                    <p>1인 추가시 +${room.addPrice}원</p>
                  </div>
                  <div class="col-4 roomDate">
                    <p>예약 날짜 입력</p>
                    <input type="date" name="checkIn"> 부터<br>
                    <input type="date" class="roomDateEnd" name="checkOutDate"> 까지<br>
                    <button class="roomSubmit justify-content-end">예약</button>
                  </div>
                </div>
              </form>
            </c:forEach>

          </div>
        </div>

        <hr class="bannerCutLine">


        <!-- 리뷰칸 -->
        <div class="row" id="banner2">
          <div class="col-12 review">
            <c:forEach var="review" items="${ReviewList}">
              <div class="row reviewBox">
                <div class="col-3 reviewImg">
                  <img src="/semi-img/reviewImg1.jpg">
                </div>
                <div class="col-9 reviewInfo">
                  <span>${review.userId} 님의 리뷰 </span>
                  <img src="/semi-img/star.png">
                  <span>${review.reviewScore}</span>
                  <span class="reviewWriteDate">작성 날짜 : ${review.reviewCreated}</span>
                  <p class="choiceOption">선택옵션 : 디럭스(이건 빼야될수도)</p>
                  <div class="row">
                    <div class="col-12 reviewContentBox">
                      <p class="reviewContent">
                        ${review.reviewContent}
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </c:forEach>

          </div>
        </div>

        <hr class="bannerCutLine">

        <!-- QnA칸 병주 작성 -->
        <div class="row" id="banner3">
          <div class="col-12 qna-middle">
            <table border=1 align=center id="table1">
              <tr>
                <th colspan=2 align=left id=qna>Q&A
              </tr>
              <tr>
                <td colspan=2 id="body"><textarea placeholder="내용을 입력하세요." id="contents1"
                    name="inquiryContent"></textarea>
              </tr>
              <tr>
                <td colspan=2 align=right><a href="/write.qna"><button>작성완료</button></a>

              </tr>
            </table>
            <br>
            <br>
            <br>
            <table border=1 align=center id="table2">
              <tr>
                <th colspan=5 align=center id=top>Q&A
              </tr>
              <tr align=center>
                <td id="space">
                <td id="title" name=inquiryContent>내용
                <td id="writer" name=userId>작성자
                <td id="date" name=inquiryCreated>날짜
                <td id="view" name=inquiryStat>상태
              </tr>
              <tr>
                <td colspan=5 align=center id="contents2">
                  <c:forEach var="qna_List" items="${qna_List }">
              <tr align="center">
                <td>${qna_List.inquiry_seq }
                <td>${qna_List.inquiryContent }
                <td>${qna_List.userId }
                <td>${qna_List.inquiryCreated }
                <td>${qna_List.inquiryStat }
              </tr>
              </c:forEach>
              </tr>
              <tr>
                <td colspan=5 align=right id=bottom>
                </td>
              </tr>
            </table>
          </div>
        </div>

        <div class="row" id="banner4">
          <div class="col-12 hotelInfo">
            <h3>${hotelList.hotelName}</h3>
            <p>${hotelList.hotelDetail}</p>
            <br>
            <p>주소 : ${hotelList.hotelRoadAddress}</p>
            <p>전화번호 : ${hotelList.hotelPhone}</p>
            <br>
            <p>제휴 문의는 아래의 전화번호로 연락 바랍니다.</p>
            <p>:${hotelList.hotelPhone}</p>
          </div>
        </div>

        <!-- 비슷한 상품 -->
        <div class="row">
          <div class="col-12 slideBox">

            <c:forEach var="cardHotel" items="${hotelListAll}">
              <div class="card">
                <img src="/semi-img/silde_h1.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">${cardHotel.hotelName}</h5>
                  <p class="card-text">${cardHotel.hotelDetail}</p>
                  <a href="#" class="cardbtn justify-content-center">보러가기</a>
                </div>
              </div>
            </c:forEach>

          </div>
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
                      <!-- url복사할 input 가져다놓기 -->
                      <li><input type="text" id="shareUrl"></li>
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
                      <li><a href="https://www.instagram.com/" target='_blank' class="instargram"></a></li>
                      <li><a href="https://www.facebook.com/" target='_blank' class="facebook"></a></li>

                    </ul>
                  </div>

                </div>
                <hr>
                <div class="row">
                  <div class="col-9">
                    <p class="foot_caution">PlaceHolder는 통신판매중개자이자 통신판매 당사자 입니다. 따라서 PlaceHolder는 공간 거래정보 및 거래내역을 소유할 수
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

        <script>
          window.onload = function () {
            $(function () {
              $('.slideBox').slick({
                slide: 'div',		//슬라이드 되어야 할 태그 ex) div, li 
                infinite: true, 	//무한 반복 옵션	 
                slidesToShow: 4,		// 한 화면에 보여질 컨텐츠 개수
                slidesToScroll: 1,		//스크롤 한번에 움직일 컨텐츠 개수
                speed: 100,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
                arrows: true, 		// 옆으로 이동하는 화살표 표시 여부
                dots: false, 		// 스크롤바 아래 점으로 페이지네이션 여부
                autoplay: true,			// 자동 스크롤 사용 여부
                autoplaySpeed: 10000, 		// 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
                pauseOnHover: true,		// 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
                vertical: false,		// 세로 방향 슬라이드 옵션
                prevArrow: "<button type='button' class='slick-prev'>></button>",		// 이전 화살표 모양 설정
                nextArrow: "<button type='button' class='slick-next'><</button>",		// 다음 화살표 모양 설정
                dotsClass: "slick-dots", 	//아래 나오는 페이지네이션(점) css class 지정
                draggable: true, 	//드래그 가능 여부 

                responsive: [ // 반응형 웹 구현 옵션
                  {
                    breakpoint: 960, //화면 사이즈 960px
                    settings: {
                      //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
                      slidesToShow: 3
                    }
                  },
                  {
                    breakpoint: 768, //화면 사이즈 768px
                    settings: {
                      //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
                      slidesToShow: 2
                    }
                  }
                ]

              });
            })

            // 상단배너 바로가기 버튼
            document.getElementById("goHome").addEventListener("click", () => {
              location.href = "/index.jsp";
            })
            document.getElementById("listGoBar").addEventListener("click", () => {
              location.href = "/list.hotel";
            })
            // document.getElementById("commuGobar").addEventListener("click", () => {
            //   location.href="/";
            // })
            // document.getElementById("gogakGobar").addEventListener("click", () => {
            //   location.href="/";
            // })
            document.getElementById("mypageGobar").addEventListener("click", () => {
              location.href = "/userInfo.user";
            })


            // 공유하기 누르면 url 복사시키기. 모바일에선 shareAPI사용하면 됨
            $("#share").on("click", function () {
              let url = document.location.href;
              let shareUrl = document.getElementById("shareUrl");
              shareUrl.value = url;
              shareUrl.select();
              document.execCommand('copy');
              alert("url이 복사되었습니다.");
            })


            let heart = document.getElementById("heart");

            heart.addEventListener("click", () => {
              if ('${loginId}' == '') {
                alert("로그인을 해주세요");
                return
              } else {
                $.ajax({
                  url: "/detailClick.like",
                  data: {
                    "loginId": '${loginId}',
                    "hotelId": '${hotelList.hotelId}'
                  }
                }).done(function (res) {
                  if(res == 'add'){ // 추가가 오면 하트 빨간색
                    document.getElementById("heartAjax").src="/semi-img/heartOn.png";
                    console.log("빨강으로 변경");
                  } else if(res == 'del'){ // 삭제가 오면 하트 검정색
                    document.getElementById("heartAjax").src="/semi-img/heart.png";
                    console.log("검정으로 변경");
                  }
                })
              }
            })


          }
        </script>


    </body>

    </html>