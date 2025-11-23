<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>ForMe 회원가입</title>

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
  padding-top: 70px;
}


.emotion-ball {
  position: absolute;
  width:140px; height:140px;
  border-radius:50%;
  filter: drop-shadow(0 10px 22px rgba(180,180,180,0.25));
  opacity: 1;
  z-index: 5;
  transition: opacity 1.2s ease-out, transform 0.35s ease-out, box-shadow 0.35s ease-out, filter 0.35s ease-out;
  cursor: default;
}

.emotion-ball.joy    { background: radial-gradient(circle,#fff6c8,#ffe08d); box-shadow:0 0 25px rgba(255,220,100,0.55); left:15vw; top:25vh; }
.emotion-ball.sad    { background: radial-gradient(circle,#d9efff,#a3d4ff); box-shadow:0 0 25px rgba(130,190,255,0.55); left:70vw; top:35vh; }
.emotion-ball.angry  { background: radial-gradient(circle,#ffd1d1,#ff9494); box-shadow:0 0 25px rgba(255,140,140,0.55); left:45vw; top:15vh; }
.emotion-ball.fear   { background: radial-gradient(circle,#e8ffe9,#b9f2c7); box-shadow:0 0 25px rgba(150,240,190,0.55); left:25vw; top:60vh; }
.emotion-ball.bored  { background: radial-gradient(circle,#f3e6ff,#d8c0ff); box-shadow:0 0 25px rgba(200,170,255,0.55); left:80vw; top:55vh; }

.join-wrapper{
  position: relative;
  width: 100%;
  min-height: calc(100vh - 80px); 
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 10;
}

.join-box{
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

.join-box h2{
  text-align:center;
  font-size:26px;
  font-weight:700;
  margin-bottom:26px;
  color:#4a4a4a;
}

form{
  display:flex;
  flex-direction:column;
  margin-top:10px;
}

label{
  font-size:14px;
  margin-bottom:8px;
  color:#666;
}

input[type="text"],
input[type="password"],
input[type="email"],
input[type="tel"]{
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
  border-color:#a8d8ff;
  background:#ffffff;
  box-shadow:0 0 8px rgba(150,200,255,0.35);
}

.error-msg{
  color:#ff4d4d;
  font-size:13px;
  margin-top:-14px;
  margin-bottom:10px;
}

.join-actions{
  display:flex;
  justify-content:space-between;
  margin-top:12px;
}

.join-actions button,
.join-actions a{
  width:48%;
  border:none;
  border-radius:12px;
  padding:13px 0;
  font-size:15px;
  font-weight:700;
  cursor:pointer;
  text-align:center;
  text-decoration:none;
  transition:all .25s ease;
}

.submit-btn{
  background:linear-gradient(135deg, #ffb8d9, #a8d8ff);
  color: #fff;
  font-size:15px;
  font-weight:700;
  box-shadow:0 4px 18px rgba(255,180,220,0.4);
  transition:all .25s ease;
}
.submit-btn:hover{
  transform:translateY(-3px);
  box-shadow:0 6px 24px rgba(255,180,220,0.55);
}

.cancel-btn{
  background:rgba(255,255,255,0.65);
  color:#444;
  border:none;
  border-radius:12px;
}
.cancel-btn:hover{
  background:#ffffff;
  transform:translateY(-3px);
  box-shadow:0 4px 18px rgba(180,220,255,0.4);
}

@media(max-width:480px){
  .join-box{ width:90%; padding:40px 35px; }
}

@keyframes fadeUp {
  0%   { opacity:.44; transform:translateY(35px); }
  100% { opacity:1; transform:translateY(0); }
}
</style>
</head>

<body>

<%@ include file="header.jsp" %>

<div class="join-wrapper">
  <div class="join-box">

    <h2>회원가입</h2>

    <form action="join.do" method="post" onsubmit="return checkInput()">

      <label>아이디</label>
      <input type="text" name="userid" id="userid" placeholder="아이디를 입력하세요">

      <c:if test="${not empty error}">
        <div class="error-msg">${error}</div>
      </c:if>

      <label>비밀번호</label>
      <input type="password" name="password" id="pw" placeholder="비밀번호를 입력하세요">

      <label>비밀번호 확인</label>
      <input type="password" name="checkpw" placeholder="비밀번호 확인">

      <label>이름</label>
      <input type="text" name="name" placeholder="이름을 입력하세요">

      <label>전화번호</label>
      <input type="tel" name="phone" placeholder="전화번호를 입력하세요">

      <label>이메일</label>
      <input type="email" name="email" placeholder="이메일을 입력하세요">

      <div class="join-actions">
        <button type="submit" class="submit-btn">회원가입</button>
        <a href="login.jsp" class="cancel-btn">취소</a>
      </div>
    </form>

  </div>
</div>


<div class="emotion-ball joy"></div>
<div class="emotion-ball sad"></div>
<div class="emotion-ball angry"></div>
<div class="emotion-ball fear"></div>
<div class="emotion-ball bored"></div>

<%@ include file="footer.jsp" %>

<script>
function checkInput(){
    const id=document.getElementById("userid").value.trim();
    const pw=document.getElementById("pw").value.trim();

    if(id==="" || pw===""){
        alert("아이디와 비밀번호를 입력해주세요.");
        return false;
    }
    return true;
}
</script>

</body>
</html>
