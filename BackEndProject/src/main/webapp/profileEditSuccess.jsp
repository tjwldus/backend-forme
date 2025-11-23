<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>프로필 변경 완료</title>
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Pretendard', 'Noto Sans KR', sans-serif;
}

body {

    background: linear-gradient(180deg, #ffffff 0%, #fff9f4 100%);
    color: #2F3B52;
    position: relative;
    min-height: 100vh;
    overflow-x: hidden;
    
    display: flex;
    flex-direction: column;
    align-items: center;

    padding-top: 100px;  

}


.emotion-ball {
  position: absolute;
  width: 140px;
  height: 140px;
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


.main-wrapper {
    width: 95%;
    max-width: 1200px;
    margin: 100px auto 180px auto;;
    padding: 70px 60px;
    background: rgba(255,255,255,0.75);
    border-radius: 30px;
    box-shadow: 0 20px 45px rgba(0,0,0,0.12), 0 8px 25px rgba(0,0,0,0.08);
    text-align: center;
    position: relative;
    backdrop-filter: blur(16px);
    transition: all 0.3s ease;
}

.main-wrapper:hover {
    transform: translateY(-2px);
    box-shadow: 0 25px 50px rgba(0,0,0,0.15), 0 10px 30px rgba(0,0,0,0.1);
}

.main-wrapper h2 {
    font-size: 32px;
    font-weight: 800;
    margin-bottom: 25px;
}

.main-wrapper p {
    font-size: 18px;
    margin-bottom: 40px;
}


.home-btn {
    display: inline-block;
    background:linear-gradient(135deg, #ffb8d9, #a8d8ff);
    color: #fff;
    padding: 16px 0;
    width: 240px;
    border-radius: 12px;
    font-size: 17px;
    font-weight: 700;
    text-decoration: none;
    transition:all .25s ease;
    box-shadow:0 4px 18px rgba(255,180,220,0.4);
}

.home-btn:hover {
    transform:translateY(-3px);
    box-shadow:0 6px 24px rgba(255,180,220,0.55);
}


@media (max-width: 768px) {
    .main-wrapper {
        width: 90%;
        padding: 50px 30px;
    }
    .home-btn {
        width: 100%;
    }
}
</style>
</head>
<body>

<%@ include file="header.jsp" %>


<div class="emotion-ball joy"></div>
<div class="emotion-ball sad"></div>
<div class="emotion-ball angry"></div>
<div class="emotion-ball fear"></div>
<div class="emotion-ball bored"></div>

<div class="main-wrapper">
    <h2>프로필 변경 완료</h2>
    <p>프로필 정보가 성공적으로 업데이트 되었습니다.</p>
    <a href="myPage.jsp" class="home-btn">마이페이지로 가기</a>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>
