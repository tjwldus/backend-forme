<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Pretendard', 'Noto Sans KR', sans-serif;
}

body {
	background: linear-gradient(180deg, #ffffff 0%, #fff9f4 100%);
	color: #333;
	min-height: 100vh;
	overflow-x: hidden;
	position: relative;
	display: flex;
	flex-direction: column;
    padding-top: 70px;
}


.emotion-ball {
	position: absolute;
	width: 140px; height: 140px;
	border-radius: 50%;
	filter: drop-shadow(0 10px 22px rgba(180,180,180,0.25));
	opacity: 1;
	z-index: -1;
	transition: opacity 1.2s ease-out, transform 0.35s ease-out, box-shadow 0.35s ease-out, filter 0.35s ease-out;
}

.emotion-ball.joy    { background: radial-gradient(circle,#fff6c8,#ffe08d); box-shadow:0 0 25px rgba(255,220,100,0.55); left:15vw; top:25vh; }
.emotion-ball.sad    { background: radial-gradient(circle,#d9efff,#a3d4ff); box-shadow:0 0 25px rgba(130,190,255,0.55); left:70vw; top:35vh; }
.emotion-ball.angry  { background: radial-gradient(circle,#ffd1d1,#ff9494); box-shadow:0 0 25px rgba(255,140,140,0.55); left:45vw; top:15vh; }
.emotion-ball.fear   { background: radial-gradient(circle,#e8ffe9,#b9f2c7); box-shadow:0 0 25px rgba(150,240,190,0.55); left:25vw; top:60vh; }
.emotion-ball.bored  { background: radial-gradient(circle,#f3e6ff,#d8c0ff); box-shadow:0 0 25px rgba(200,170,255,0.55); left:80vw; top:55vh; }


.mypage-wrapper {
	width: 100%;
	min-height: calc(100vh - 120px - 80px);
	display: flex;
	justify-content: center;
	align-items: center;
	padding-top: 120px;
	padding-bottom: 80px; 
}

.mypage-box {
	width: 90%;
	max-width: 1200px;
	min-height: 600px;
	background: rgba(255, 255, 255, 0.75);
	padding: 80px 90px;
	border-radius: 30px;
	backdrop-filter: blur(16px);
	box-shadow:
    0 18px 40px rgba(180,200,220,0.35),
    0 0 50px rgba(255,255,255,0.7);
	border: 1px solid rgba(255, 255, 255, 0.6);

	display: flex;
	justify-content: space-between;
	align-items: center;
	
	opacity: 0;
    transform: scale(0.97);
    animation: fadeScale 0.7s ease-out forwards;
	
}


@keyframes fadeScale {
  to {
    opacity: 1;
    transform: scale(1);
  }
}



.left-section { width: 55%; display: flex; flex-direction: column; gap: 25px; }
.left-section h2 { font-size: 32px; font-weight: 800; color: #2F3B52; }
.user-name { font-size: 18px; font-weight: 600; opacity: .85; }
.menu-container { display: flex; flex-direction: column; gap: 18px; }
.menu-card { padding: 18px 22px; border-radius: 16px; background: rgba(255,255,255,0.6); backdrop-filter: blur(10px); border: 1px solid rgba(220,220,220,0.45); box-shadow: 0 10px 20px rgba(180,180,180,0.25); display: flex; justify-content: space-between; align-items: center; font-size: 17px; font-weight: 600; color: #333; cursor: pointer; transition: .25s ease; text-decoration: none; }
.menu-card:hover { background: rgba(255,255,255,0.9); transform: translateX(6px); box-shadow:0 14px 28px rgba(180,180,180,0.3); }

.character-section { width: 35%; display: flex; flex-direction: column; align-items: center; gap: 8px; }
.character-card { width: 260px; height: 330px; background: rgba(255, 255, 255, 0.55); border: 1px solid rgba(240, 240, 240, 0.6); backdrop-filter: blur(12px); border-radius: 22px; display: flex; justify-content: center; align-items: center; box-shadow: 0 10px 25px rgba(180,180,180,0.2), 0 0 25px rgba(220,220,220,0.35); transition: .25s; }
.character-card:hover { transform: translateY(-4px); box-shadow:0 16px 30px rgba(180,180,180,0.35); }
.character-card img { width: 180px; height: auto; }
.character-label { font-size: 17px; font-weight: 600; color: #2F3B52; opacity: .85; }




@media(max-width:480px){
	.mypage-box{ width:90%; padding:40px 35px; }
}



</style>
</head>
<body>

<%@ include file="header.jsp"%>

<div class="mypage-wrapper">
	<div class="mypage-box">

		<div class="left-section">
			<h2>마이 페이지</h2>
			<div class="user-name">${loginUser.name}님 환영합니다 👋</div>

			<div class="menu-container">
				<a href="profileEdit.jsp" class="menu-card"> <span>프로필 수정</span> ➜ </a>
				<a href="diaryList.do" class="menu-card"> <span>내가 쓴 글 목록</span> ➜ </a>
			</div>
		</div>

		<div class="character-section">
			<div class="character-card">
				<img src="" alt="캐릭터 이미지">
			</div>
			<div class="character-label">나의 대표 캐릭터</div>
		</div>

	</div>
</div>

<div class="emotion-ball joy"></div>
<div class="emotion-ball sad"></div>
<div class="emotion-ball angry"></div>
<div class="emotion-ball fear"></div>
<div class="emotion-ball bored"></div>

<%@ include file="footer.jsp"%>

</body>
</html>
