<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>프로필 수정</title>

<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Pretendard', 'Noto Sans KR', sans-serif;
}

body {
  background: linear-gradient(180deg, #ffffff 0%, #fff9f4 100%);
  min-height: 100vh;
  color: #2F3B52;
  position: relative;
  overflow-x: hidden;
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


.edit-container {
  display: flex;
  justify-content: center;
  padding-top: 160px;
  padding-bottom: 120px;
}

.edit-box {
  width: 700px;
  background: rgba(255,255,255,0.75);
  padding: 70px 80px;
  border-radius: 35px;
  box-shadow: 0 25px 60px rgba(0, 0, 0, 0.08), 0 12px 24px rgba(0, 0, 0, 0.05);
  backdrop-filter: blur(12px);
  box-shadow:
    0 18px 40px rgba(180,200,220,0.35),
    0 0 50px rgba(255,255,255,0.7);
  
  transform: translateY(25px);
  animation: fadeUp 0.8s ease-out forwards;
}


@keyframes fadeUp {
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
.edit-box h2 {
  text-align: center;
  font-size: 34px;
  font-weight: 800;
  margin-bottom: 50px;
  color: #2F3645;
}

label {
  display: block;
  font-size: 16px;
  font-weight: 600;
  margin-bottom: 8px;
  color: #444;
}

input[type="text"],
input[type="password"],
input[type="email"],
input[type="tel"] {
  width:100%;
  padding:13px;
  border-radius:12px;
  border:1.3px solid #e5e5e5;
  background:rgba(255,255,255,0.8);
  color:#444;
  transition:border .25s ease, box-shadow .25s ease, background .25s ease;
  margin-bottom:20px;
}

input:focus {
  outline:none;
  border-color:#a8d8ff;
  background:#ffffff;
  box-shadow:0 0 8px rgba(150,200,255,0.35);
}

.btn-area {
  display: flex;
  justify-content: space-between;
  margin-top: 10px;
}

.update-btn {
  width: 48%;
  height: 52px;
  border: none;
  border-radius: 12px;
  cursor: pointer;
  font-size: 17px;
  font-weight: 700;
  background: linear-gradient(135deg, #ffb8d9, #a8d8ff);
  color: #fff;
  transition:all .25s ease;
  box-shadow:0 4px 18px rgba(255,180,220,0.4);
}

.update-btn:hover {
  transform: translateY(-3px);
  box-shadow:0 6px 24px rgba(255,180,220,0.55);
}

a.cancel-btn {
  width: 48%;
  height: 52px;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 12px;
  border: none;
  background:rgba(255,255,255,0.65);
  color:#444;
  font-size: 17px;
  font-weight: 600;
  text-decoration: none;
  transition: 0.25s;
}

a.cancel-btn:hover {
  background: #ffffff;
  transform:translateY(-3px);
  box-shadow:0 4px 18px rgba(180,220,255,0.4);
}


.error_msg {
  color: #ff5c5c;
  font-size: 14px;
  margin-top: 10px;
  padding-left: 3px;
  text-align: center;
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

<div class="edit-container">
  <div class="edit-box">

    <h2>프로필 수정</h2>

    <form action="edit.do" method="post">

      <label>아이디</label>
      <input type="text" value="${loginUser.id}" readonly>

      <label>기존 비밀번호</label>
      <input type="password" name="oldPw" required placeholder="현재 비밀번호를 입력하세요">

      <label>새 비밀번호</label>
      <input type="password" name="newPw" placeholder="새 비밀번호 (변경 시 입력)">

      <label>이름</label>
      <input type="text" name="name" value="${loginUser.name}" required>

      <label>전화번호</label>
      <input type="tel" name="phone" value="${loginUser.phone}" required>

      <label>이메일</label>
      <input type="email" name="email" value="${loginUser.email}" required>

      <div class="btn-area">
        <button type="submit" class="update-btn">변경하기</button>
        <a href="myPage.jsp" class="cancel-btn">취소</a>
      </div>

    </form>

    <c:if test="${not empty error}">
      <p class="error_msg">${error}</p>
    </c:if>

  </div>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>
