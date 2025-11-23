<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Pretendard', 'Noto Sans KR', sans-serif;
}


body {
  background: linear-gradient(180deg, #ffffff 0%, #fff9f4 100%);
  color:#444;
  min-height:100vh;
  overflow-x:hidden;
  position:relative;
}


.emotion-ball {
  position: absolute;
  width:140px; height:140px;
  border-radius:50%;
  filter: drop-shadow(0 10px 22px rgba(180,180,180,0.25));
  opacity: 1;
  z-index: 5;
  transition: opacity 1.2s ease-out, transform 0.35s ease-out, 
             box-shadow 0.35s ease-out, filter 0.35s ease-out;
}

.emotion-ball.joy    { background: radial-gradient(circle,#fff6c8,#ffe08d); box-shadow:0 0 25px rgba(255,220,100,0.55); left:15vw; top:25vh; }
.emotion-ball.sad    { background: radial-gradient(circle,#d9efff,#a3d4ff); box-shadow:0 0 25px rgba(130,190,255,0.55); left:70vw; top:35vh; }
.emotion-ball.angry  { background: radial-gradient(circle,#ffd1d1,#ff9494); box-shadow:0 0 25px rgba(255,140,140,0.55); left:45vw; top:15vh; }
.emotion-ball.fear   { background: radial-gradient(circle,#e8ffe9,#b9f2c7); box-shadow:0 0 25px rgba(150,240,190,0.55); left:25vw; top:60vh; }
.emotion-ball.bored  { background: radial-gradient(circle,#f3e6ff,#d8c0ff); box-shadow:0 0 25px rgba(200,170,255,0.55); left:80vw; top:55vh; }


.find-wrapper{
  position:relative;
  width:100%;
  height:100vh;
  display:flex;
  justify-content:center;
  align-items:center;
  z-index:10;
  padding-top:70px;
}

.find-box{
  width:420px;
  padding:48px 55px;
  background:rgba(255,255,255,0.75);
  border:1px solid rgba(255,255,255,0.8);
  backdrop-filter:blur(25px);
  border-radius:28px;
  color:#444;
  box-shadow:
    0 18px 40px rgba(180,200,220,0.35),
    0 0 50px rgba(255,255,255,0.7);
  animation:fadeUp .8s ease-out;
}

.find-box h2{
  text-align:center;
  font-size:26px;
  font-weight:700;
  margin-bottom:26px;
  color:#4a4a4a;
}

form{
  display:flex;
  flex-direction:column;
}

label{
  font-size:14px;
  margin-bottom:8px;
  color:#666;
}

input[type="text"]{
  width:100%;
  padding:13px;
  border-radius:12px;
  border:1.3px solid #e5e5e5;
  background:rgba(255,255,255,0.8);
  color:#444;
  transition:border .25s ease, box-shadow .25s ease, background .25s ease;
  margin-bottom:20px;
}

input:focus{
  outline:none;
  border-color:#ffb8d9;
  background:#ffffff;
  box-shadow:0 0 8px rgba(255,180,220,0.35);
}

.actions{
  display:flex;
  justify-content:space-between;
  margin-top:12px;
}

.submit-btn{
  width:48%;
  border:none;
  border-radius:12px;
  padding:13px 0;
  background:linear-gradient(135deg, #ffb8d9, #a8d8ff);
  color:#fff;
  font-size:15px;
  font-weight:700;
  cursor:pointer;
  box-shadow:0 4px 18px rgba(255,180,220,0.4);
  transition:.25s ease;
}
.submit-btn:hover{ transform:translateY(-3px); }

.cancel-btn{
  width:48%;
  text-align:center;
  padding:13px 0;
  background:rgba(255,255,255,0.65);
  border-radius:12px;
  color:#444;
  text-decoration:none;
  border:none;
  font-weight:600;
  transition:all 0.25s ease;
}
.cancel-btn:hover{
  background:#ffffff;
  border-color:#a8d8ff;
  transform:translateY(-3px);
  box-shadow:0 4px 18px rgba(180,220,255,0.4);
}


.result-box, .error-box{
  margin-top:25px;
  padding:15px;
  border-radius:12px;
  font-size:15px;
  text-align:center;
}

.result-box{
  background:#e8f3ff;
  color:#2F3B52;
}

.error-box{
  color:#ff4e4e;
}


@media(max-width:480px){
  .find-box{
    width:90%;
    padding:40px 35px;
  }
}


@keyframes fadeUp {
  0%   { opacity:.44; transform:translateY(35px); }
  100% { opacity:1; transform:translateY(0); }
}
</style>
</head>
<body>

<%@ include file="header.jsp" %>

<div class="find-wrapper">
  <div class="find-box">
    <h2>비밀번호 찾기</h2>

    <form action="<%=request.getContextPath()%>/findPassword.do" method="post">
      <label>아이디</label>
      <input type="text" name="userid" placeholder="아이디를 입력하세요">

      <div class="actions">
        <button type="submit" class="submit-btn">비밀번호 찾기</button>
        <a href="login.jsp" class="cancel-btn">취소</a>
      </div>
    </form>

    <c:if test="${not empty pw}">
      <div class="result-box">
        비밀번호는 <strong>${pw}</strong> 입니다.
      </div>
      <div class="actions" style="justify-content:center; margin-top:18px;">
        <a href="login.jsp" class="cancel-btn" style="width:60%;">로그인</a>
      </div>
    </c:if>

    <c:if test="${not empty error}">
      <div class="error-box">${error}</div>
    </c:if>
  </div>
</div>


<div class="emotion-ball joy"></div>
<div class="emotion-ball sad"></div>
<div class="emotion-ball angry"></div>
<div class="emotion-ball fear"></div>
<div class="emotion-ball bored"></div>

<%@ include file="footer.jsp" %>

</body>
</html>
