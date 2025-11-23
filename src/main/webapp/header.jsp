<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Pretendard', 'Noto Sans KR', sans-serif;
	list-style-type: none;
}


a {
	text-decoration: none;
}

header {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 80px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0 60px;
	background: rgba(255, 255, 255, 0.55);
	backdrop-filter: blur(14px);
	border-bottom: 1px solid rgba(200, 200, 200, 0.35);
	box-shadow: 0 4px 18px rgba(200, 200, 200, 0.25);
	z-index: 9999;
	transition: background 0.35s ease, backdrop-filter 0.35s ease,
		box-shadow 0.35s ease;
}

header.scrolled {
	background: rgba(255, 255, 255, 0.75);
	backdrop-filter: blur(18px);
	box-shadow: 0 4px 25px rgba(180, 180, 180, 0.35);
}

header .logo {
	display: flex;
	align-items: center;
}

header .logo img {
	height: clamp(40px, 5vw, 70px);
	width: auto;
	filter: drop-shadow(0 3px 8px rgba(180, 180, 180, 0.45));
}

header nav {
	flex: 1;
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 38px;
}

header nav a {
	color: #4a4a4a;
	font-size: 17px;
	font-weight: 500;
	opacity: 0.9;
	transition: color 0.25s ease, opacity 0.25s ease;
}

header nav a:hover {
	color: #76c5ff;
	opacity: 1;
}


header .auth-buttons {
	display: flex !important;
	align-items: center !important;
	gap: 10px;
	height: 70px;
}

header .auth-buttons a, header .auth-buttons button {
	all: initial;
	display: inline-flex !important;
	align-items: center !important;
	justify-content: center !important;
	height: 40px !important;
	padding: 0 18px !important;
	border-radius: 999px !important;
	border: 1.5px solid rgba(180, 180, 180, 0.45) !important;
	background: rgba(255, 255, 255, 0.65) !important;
	color: #4a4a4a !important;
	font-size: 15px !important;
	font-weight: 600 !important;
	backdrop-filter: blur(10px) !important;
	box-shadow: 0 3px 10px rgba(200, 200, 200, 0.35) !important;
	cursor: pointer;
	transition: background 0.25s ease, border-color 0.25s ease, transform
		0.25s ease;
	display: inline-flex !important;
}

header .auth-buttons a:hover, header .auth-buttons button:hover {
	background: rgba(255, 255, 255, 0.9);
	border-color: rgba(140, 200, 255, 0.75);
	transform: translateY(-2px);
	background: rgba(255, 255, 255, 0.9);
}

@media ( max-width : 768px) {
	header {
		padding: 0 24px;
	}
	header nav {
		display: none;
	}
}


.main_menu {
  list-style: none;
  padding: 0;
  margin: 0;
}

.main_menu > li {
  position: relative;
}

.main_menu > li > a {
  color: #4a4a4a;
  font-size: 17px;
  font-weight: 500;
  padding: 8px 4px;
  display: inline-block;
}



header nav ul.main_menu li.has_sub > a:hover, 
header nav ul.main_menu li.has_sub:hover > a {
    color: #76c5ff; /* 메인 메뉴 호버 색상과 동일하게 적용 */
    opacity: 1;
}


.sub_menu {
  position: absolute;
  top: 42px;
  left: -10px;
  background: rgba(255, 255, 255, 0.95);
  backdrop-filter: blur(12px);
  border-radius: 14px;
  padding: 10px 8px;
  min-width: 120px;
  

  box-shadow: 0 6px 15px rgba(0, 0, 0, 0.04); 
  border: 1px solid rgba(230, 230, 230, 0.6); 

  opacity: 0;
  visibility: hidden;
  transform: translateY(10px);
  transition: all 0.25s ease;
}


.sub_menu li a {
  display: block;
  padding: 8px 14px;
  border-radius: 8px; 
  font-size: 14px;
  color: #4a4a4a; 
  transition: all 0.2s ease;
}


.sub_menu li a:hover {
  background: rgba(160, 220, 255, 0.15); 
  color: #55aaff; 
}

.has_sub:hover .sub_menu {
  opacity: 1;
  visibility: visible;
  transform: translateY(0);
}




</style>
</head>
<body>
	<c:set var="loginUser" value="${sessionScope.loginUser}" />
	<c:set var="role" value="${sessionScope.role}" />

	<header id="header">
		<div class="logo">
			<a href="index.jsp"> 
			<img src="${pageContext.request.contextPath}/images/forme_logo.png" alt="logo">
			</a>
		</div>

		<c:choose>
			<c:when test="${not empty role}">
				<nav>
					<a href="memberlist.do">회원관리</a> 
					<a href="#">커뮤니티 관리</a> 
					<a href="#">통계 및 보고서</a>
				</nav>
			</c:when>
			<c:otherwise>
				<nav>
					<ul class = "main_menu">
						<li class="has_sub"><a href="#">일기관리</a>
							<ul class="sub_menu">
								<li><a href="diaryList.do">일기목록</a></li>
								<li><a href="diaryWrite.jsp">일기쓰기</a></li>
							</ul>
						</li>
					</ul>
					<a href="#">감정분석</a> 
					<a href="#">과거의 나와 대화</a>
					<a href="#">정신건강 관련 기관</a> 
					<a href="#">커뮤니티</a>
				</nav>
			</c:otherwise>
		</c:choose>

		<c:choose>
			<c:when test="${empty loginUser}">
				
				<div class="auth-buttons">
					<a href="login.jsp" class="login-btn">로그인</a> 
					<a href="join.jsp" class="join-btn">회원가입</a>
				</div>
			</c:when>
			<c:otherwise>
				<div class="auth-buttons">
					<a href="myPage.jsp" class="login-btn">${loginUser.name}님</a>
					<form action="logout.do" method="get">
						<button type="submit" class="login-btn">로그아웃</button>
					</form>
				</div>
			</c:otherwise>
		</c:choose>
	</header>

	<script>
  	const headerEl = document.getElementById("header");
  	window.addEventListener("scroll", () => {
    if (window.scrollY > 10) headerEl.classList.add("scrolled");
    else headerEl.classList.remove("scrolled");
  	});
  	

</script>

</body>
</html>
