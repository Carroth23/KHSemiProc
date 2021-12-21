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

      <link rel="stylesheet" href="/semi-css/serviceCenter.css">
    </head>

    <body>

      <div class="container">
        <div class="containerIn">
          <div class="container">

            <div class="row header">
              <div class="col-3 align-self-center">
                <a href="/index.jsp"><img src="/semi-img/logos.png" id="logo"></a>
              </div>
              <div class="col-8 align-self-center">
                <input type="text" placeholder="Search" id="topSearch">
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

			<div class="title">
				<p id="title1">PlACE HOLDER</p><br>
				<p id="title2">고객센터<p><br>				
			</div>

            <div class="row" id="banner">
              <div class="col-1 goHome bannerIn">
                <p id="goHome">메인으로</p>
              </div>
              <div class="col-3 reservation bannerIn">
                <p id="pagereload">예약</p>
              </div>
              <div class="col-3 community bannerIn">
                <p id = "community">커뮤니티</p>
              </div>
              <div class="col-3 qna bannerIn">
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
                  <option>제목</option>
                  <option>유저ID</option>
                </select>
              </div>
              <div class="col-8">
                <input type="text" placeholder="상세검색어를 입력해주세요." class="detailSearch" id = "">
              </div>
              <div class="col-2 align-self-start">
                <button class="detailSearchBtn">
                  검색
                </button>
              </div>
            </div>
            <hr class="bannerHr">
            
              	<!-- 글쓰기 버튼 -->
        <div class = "row write">
        	<div class = "col" style="text-align: right; margin-right:60px;">
        		<button class="detailSearchBtn" id = "write">
                  		글 쓰기
                </button>
        	</div>
        </div>
        <hr class="bannerHr">
            </div>          
        
        <!-- 보드 나오기 -->
        <br>
            <div class = "container" id = "articlecontainer">
            	<div class = "row top" style = "text-align:center" id="writeTitle">         		
            		<div class = "col-2 num writeTitle">글 번호</div>
            		<div class = "col-5 title writeTitle">제목</div>
            		<div class = "col-3 writer writeTitle">작성자</div>
            		<div class = "col-2 date writeTitle">작성일</div>
            	</div>
            	<br>
            	<div class = "row middle" style = text-align:center; id="writeContents">
					<c:forEach var = "list" items = "${list }">                
            		<div class = "col-2 num writeContents">${list.postId}</div>
            		<div class = "col-5 title writeContents"><a href = "detail.article?postId=${list.postId}" style = "text-decoration-line : none;">${list.postTitle}</a></div>
            		<div class = "col-3 writer writeContents">${list.userId}</div>
            		<div class = "col-2 date writeContents">${list.postCreated}</div>            	
                <hr class="bannerHr">
            		</c:forEach>
            		<span id = "inner" style = "margin:0px;"></span>
				</div>
         	</div>
        <br>             
        
			<!-- 더보기 버튼 -->
            <div class="row" id="readMoreUp">
              <div class="col-5">
                <!-- 더보기 버튼 위치지정용 col -->
              </div>
              <div class="col-2">
                <button id="readMore" style = "background-color: rgb(180, 213, 240)">+</button>
              </div>
              <div class="col-5">
                <!-- 더보기 버튼 위치지정용 col -->
              </div>
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
        
     //검색어 입력했을 때
     	let searchBtn = document.querySelector(".detailSearchBtn");
        searchBtn.addEventListener("click", function () { // 검색버튼을 누를때 option의 값을 빼냄

        let searchTxt = document.querySelector(".detailSearch").value; // 검색창 value값 추출
		console.log(searchTxt);
        let searchBox = document.querySelector("#searchOption");
        let searchOption = searchBox.options[searchBox.selectedIndex].value; // 검색 옵션값 추출
        location.href = "/search.article?option=" + searchOption + "&Keyword=" + searchTxt; // get으로 검색값 전달
        })
	
     // 더보기 버튼 ajax 
        let readMore = document.getElementById("readMore");
        let btn = 1;
        let inner = document.getElementById("inner");
        let ContentPlus = document.getElementById("readMoreUp");
        let div = '';

        readMore.addEventListener("click", function () {
          btn += 10;
          $.ajax({
            url: "/listPlus.article",
            data: { "btn": btn }
          }).done(function (res) {
            let result = JSON.parse(res);
            for (let i = 0; i < result.length; i++) {
            	div += `<div class = "row middle" style = "text-align : center; background-color: whitesmoke">
            		<div class = "col-2 num">\${result[i].postId}</div>
            		<div class = "col-5 title"><a href = "/detail.article?postId=\${result[i].postId}">\${result[i].postTitle}</a></div>
            		<div class = "col-3 writer">\${result[i].userId}</div>
            		<div class = "col-2 date">\${result[i].postCreated}</div>
            		<hr class="bannerHr">
				</div>`
			inner.innerHTML = div;
            }
            if (result.length < 10) { // 넘어올 호텔 목록이 10보다 작다면 더보기 삭제
              readMore.style.display = "none";
            }
          })
        });
	
     // 페이지 새로고침
        document.querySelector("#community").addEventListener("click", function () {
          location.href = "/articleList.article";
        })
        
    //글 쓰기 비회원 막기
        document.getElementById("write").addEventListener("click", () => {
          if ('${loginId}' == '') {
            alert("로그인을 해주세요");
            return
          } else {
            location.href = "/writeForm.article";
          }
        })
      </script>

    </body>

    </html>