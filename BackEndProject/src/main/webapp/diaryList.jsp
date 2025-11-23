<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>내 일기 목록</title>

<style>
* {
  margin:0; padding:0; box-sizing:border-box;
  font-family: 'Pretendard', 'Noto Sans KR', sans-serif;
}

body{
  background: linear-gradient(180deg, #ffffff 0%, #fff9f4 100%);
  min-height:100vh;
  overflow-x:hidden;
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


.page-wrapper{
  min-height: calc(100vh - 80px - 140px); 
  display:flex;
  align-items:center;
  justify-content:center;
}

.diary-box{
  width: 85%;
  max-width: 1100px; 
  height: 700px;
  padding: 50px 60px;
  background: rgba(255,255,255,0.75);
  backdrop-filter: blur(15px);
  border-radius: 28px;
  box-shadow:
    0 18px 40px rgba(180,200,220,0.3),
    0 0 40px rgba(255,255,255,0.8);
  display:flex;
  flex-direction:column;
  z-index:5;
  justify-content: flex-start;  
  align-items: stretch;
  animation: fadeIn 0.8s ease-out both;

}

@keyframes fadeIn {
  from { opacity: 0; }
  to { opacity: 1; }
}


.diary-title{
  text-align:center;
  font-size:26px;
  font-weight:800;
  margin-top: 30px;
  margin-bottom:25px;
  color:#2F3B52;
}


.write-btn{
  width: 200px;
  margin: 0 auto 25px;
  padding: 14px;
  border-radius: 50px;
  background: linear-gradient(90deg,#ffc9d9,#c9dfff);
  color:white;
  text-decoration:none;
  font-weight:600;
  text-align:center;
  box-shadow: 0 8px 15px rgba(150,150,200,0.4);
  transition:.3s;
}

.write-btn:hover{
  transform: translateY(-3px);
}


.diary-list{
  width: 100%;
  padding: 0 10px;
  flex:1;
  overflow-y:auto;
}

.diary-list::-webkit-scrollbar {
  width: 6px;
}
.diary-list::-webkit-scrollbar-thumb {
  background: #dbe8ff;
  border-radius: 10px;
}


.diary-item{
  display:flex;
  justify-content:space-between;
  align-items:center;
  padding:18px 0;
  border-bottom:1px solid #eee;
}

.diary-item:last-child{border-bottom:none;}

.title{
  font-size:16px;
  font-weight:700;
}

.meta{
  font-size:13px;
  color:#777;
  margin-top:4px;
}


.actions a{
  margin-left:6px;
  padding:6px 14px;
  border-radius:30px;
  background:#f4f7ff;
  font-size:13px;
  text-decoration:none;
  color:#5a87ff;
  transition:.2s;
}

.actions a:hover{
  background:#76c5ff;
  color:#fff;
}


.empty{
  text-align:center;
  margin-top:80px;
  color:#aaa;
}


</style>

</head>
<body>

<div class="page-wrapper">

  <div class="diary-box">

    <div class="diary-title">내가 작성한 일기</div>

    <a href="diaryWrite.do" class="write-btn">새 일기 작성</a>

    <div class="diary-list">

      <c:if test="${empty diaryList}">
        <div class="empty">아직 작성된 일기가 없습니다 🌱</div>
      </c:if>

      <c:forEach var="d" items="${diaryList}">
        <div class="diary-item">
          <div>
            <div class="title">${d.title}</div>
            <div class="meta">${d.created_at}</div>
          </div>
          <div class="actions">
            <a href="diaryDetail.do?id=${d.diary_id}">보기</a>
            <a href="diaryEdit.do?id=${d.diary_id}">수정</a>
            <a href="diaryDelete.do?id=${d.diary_id}" onclick="return confirm('삭제하시겠습니까?')">삭제</a>
          </div>
        </div>
      </c:forEach>

    </div>

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
