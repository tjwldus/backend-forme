<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>일기 작성</title>

<style>
* {
  margin:0;
  padding:0;
  box-sizing:border-box;
  font-family: 'Pretendard','Noto Sans KR',sans-serif;
}

body{
  background: linear-gradient(180deg, #ffffff 0%, #fff9f4 100%);
  min-height:100vh;
}

.emotion-ball {
  position: absolute;
  width:140px; height:140px;
  border-radius:50%;
  filter: drop-shadow(0 10px 22px rgba(180,180,180,0.25));
  opacity: 1;
  z-index: -1;
  transition: opacity 1.2s ease-out, transform 0.35s ease-out, box-shadow 0.35s ease-out, filter 0.35s ease-out;
  cursor: default;
}

.emotion-ball.joy    { background: radial-gradient(circle,#fff6c8,#ffe08d); box-shadow:0 0 25px rgba(255,220,100,0.55); left:15vw; top:25vh; }
.emotion-ball.sad    { background: radial-gradient(circle,#d9efff,#a3d4ff); box-shadow:0 0 25px rgba(130,190,255,0.55); left:70vw; top:35vh; }
.emotion-ball.angry  { background: radial-gradient(circle,#ffd1d1,#ff9494); box-shadow:0 0 25px rgba(255,140,140,0.55); left:45vw; top:15vh; }
.emotion-ball.fear   { background: radial-gradient(circle,#e8ffe9,#b9f2c7); box-shadow:0 0 25px rgba(150,240,190,0.55); left:25vw; top:60vh; }
.emotion-ball.bored  { background: radial-gradient(circle,#f3e6ff,#d8c0ff); box-shadow:0 0 25px rgba(200,170,255,0.55); left:80vw; top:55vh; }


.page-wrapper {
  min-height: calc(100vh - 140px);
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 200px 0 200px; 
}


.container {
  width: 85%;
  max-width: 700px;
  min-height: 800px;
  padding: 50px;
  background: rgba(255,255,255,0.85);
  backdrop-filter: blur(15px);
  border-radius: 30px;
  box-shadow: 0 15px 35px rgba(180,180,200,0.25);
  animation: fadeUp .8s ease-out forwards;
}

.container h2{ 
  text-align:center;
  font-size:26px;
  font-weight:800;
  margin-top: 30px;
  margin-bottom:25px;
  color:#2F3B52;
}


label {
  display:block;
  margin:18px 0 6px;
  font-weight:600;
}

input, textarea {
  width:100%;
  padding:14px;
  border-radius:12px;
  border:1px solid #eee;
}

input:focus{
  outline:none;
  border-color:#ffb8d9;
  background:#ffffff;
  box-shadow:0 0 8px rgba(255,180,220,0.35);
}

textarea{ height:35vh; }

textarea:focus{
  outline:none;
  border-color:#ffb8d9;
  background:#ffffff;
  box-shadow:0 0 8px rgba(255,180,220,0.35);
}

.buttons{
  display:flex;
  justify-content:space-between;
  margin-top:12px;
}

.buttons button,
.buttons a{
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

.btn-primary {
  background: linear-gradient(90deg,#ffc9d9,#c9dfff);
  color:white;
}

.btn-primary:hover{
  transform:translateY(-3px);
  box-shadow:0 6px 24px rgba(255,180,220,0.55);
}

.btn-cancel{
  background:rgba(255,255,255,0.65);
  color:#444;
  border:none;
  border-radius:12px;
}
.btn-cancel:hover{
  background:#ffffff;
  transform:translateY(-3px);
  box-shadow:0 4px 18px rgba(180,220,255,0.4);
}

@keyframes fadeUp {
  0%   { opacity:.44; transform:translateY(35px); }
  100% { opacity:1; transform:translateY(0); }
}

</style>
</head>

<body>

<div class="page-wrapper">

  <div class="container">

    <h2>새 일기 작성</h2>

    <form action="diaryWrite.do" method="post">

      <label>제목</label>
      <input type="text" name="title" required>

      <label>내용</label>
      <textarea name="content" required></textarea>

      <div class="buttons">
        <button type="submit" class="btn-primary">저장</button>
        <a href="diaryList.do" class="btn-cancel">목록으로</a>
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
</body>
</html>
