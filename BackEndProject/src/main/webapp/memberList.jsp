<%@page import="com.forme.model.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원 목록</title>

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
	padding-top: 120px;
	overflow-x: hidden;
	position: relative;
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

.admin-wrapper {
	width: 92%;
	max-width: 1350px;
	margin: 60px auto 120px auto;
	padding: 50px 60px;
	background: rgba(255, 255, 255, 0.75);
	backdrop-filter: blur(32px);
	-webkit-backdrop-filter: blur(32px);
	border-radius: 30px;
	border: 1px solid rgba(255, 255, 255, 0.5);
	box-shadow:0 20px 45px rgba(0,0,0,0.12), 0 8px 25px rgba(0,0,0,0.08);
	position: relative;
	z-index: 10;
}

.admin-wrapper h2 {
	font-size: 30px;
	font-weight: 800;
	color: #3d4c56;
	margin-bottom: 10px;
}

.admin-wrapper p {
	opacity: .6;
	margin-bottom: 30px;
	font-size: 15px;
}

.search-box form {
    display: flex;
    width: 100%;
    gap: 12px;
    margin-bottom:20px;
}

.search-box input {
    flex: 1;   
    padding: 15px 20px;
    background: rgba(255,255,255,0.9);
    border-radius: 16px;
    border: 1px solid rgba(220,220,220,0.6);
    font-size: 15px;
}


.search-box input:focus {
	border-color: #c7e8ff;
	background: #ffffff;
	box-shadow: 0 0 12px rgba(160, 215, 255, 0.6);
	outline: none;
}

.search-box button {
	padding: 15px 20px;
	border: none;
	border-radius: 15px;
	cursor: pointer;
	background: linear-gradient(135deg, #ffb8d9, #a8d8ff);
	color: #fff;
	font-weight: 700;
	box-shadow:0 4px 18px rgba(255,180,220,0.4);
	transition:all .25s ease;
}

.search-box button:hover {
	transform:translateY(-3px);
    box-shadow:0 6px 24px rgba(255,180,220,0.55);
}

.table-wrapper {
	border-radius: 22px;
	overflow: hidden;
	background: rgba(255, 255, 255, 0.55);
	backdrop-filter: blur(25px);
	-webkit-backdrop-filter: blur(25px);
	border: 1px solid rgba(255, 255, 255, 0.5);
	box-shadow: 0 10px 30px rgba(180, 180, 180, 0.18), 0 0 35px rgba(240, 240, 240, 0.35);
}

table {
	width: 100%;
	border-collapse: collapse;
}

thead {
	background: rgba(240, 248, 255, 0.55);
	backdrop-filter: blur(14px);
}

thead th {
	padding: 18px 12px;
	font-weight: 700;
	color: #6a7b8c;
	font-size: 15px;
	text-align: center;
}

tbody tr {
	background: rgba(255, 255, 255, 0.85);
	transition: .25s;
}

tbody tr:hover {
	background: #ffffff;
}

tbody td {
	padding: 16px 12px;
	font-size: 14px;
	color: #444;
	text-align: center;
	border-bottom: 1px solid rgba(0, 0, 0, 0.04);
}

.status-active {
	color: #41a676;
	font-weight: 700;
}

.status-stop {
	color: #d36868;
	font-weight: 700;
}

.btn-detail {
	padding: 8px 16px;
	border-radius: 14px;
	background: rgba(255, 255, 255, 0.8);
	border: 1px solid rgba(200, 200, 200, 0.5);
	cursor: pointer;
	transition: .25s;
}

.btn-detail:hover {
	background: #ffffff;
	transform: translateY(-2px);
}

.btn-delete {
	padding: 8px 16px;
	border-radius: 14px;
	background: rgba(255, 170, 170, 0.25);
	border: 1px solid rgba(255, 170, 170, 0.5);
	color: #d04e4e;
	font-weight: 700;
	cursor: pointer;
	transition: .25s;
}

.btn-delete:hover {
	background: rgba(255, 170, 170, 0.35);
	transform: translateY(-2px);
}

@media ( max-width :900px) {
	.admin-wrapper {
		padding: 30px;
	}
	thead th, tbody td {
		padding: 12px 8px;
	}
}

.error-msg{
	color:#d04e4e; 
	font-weight:bold; 
	margin-bottom:15px;
}

.modal {
    display: none;
    position: fixed;
    z-index: 9999;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.4);
    
    justify-content: center; 
    align-items: center;
    z-index: 9999;
}


.modal-content {
    background: #fff;
    margin: 20% auto;
    padding: 25px;
    border-radius: 15px;
    width: 400px; 
    box-shadow: 0 8px 20px rgba(0,0,0,0.25);
    position: relative;
}


.close-btn {
    position: absolute;
    top: 10px;
    right: 15px;
    font-size: 25px;
    font-weight: bold;
    cursor: pointer;
}

</style>
</head>
<body>
 	<c:if test="${not empty error}">
		<script>
			alert("${error}");
		</script>
	</c:if>


<div class="emotion-ball joy"></div>
<div class="emotion-ball sad"></div>
<div class="emotion-ball angry"></div>
<div class="emotion-ball fear"></div>
<div class="emotion-ball bored"></div>

<%@ include file="header.jsp"%>

<div class="admin-wrapper">
	<h2>회원 목록</h2>
	<p>전체 사용자 목록을 확인합니다.</p>
	

	<div class="search-box">
		<form action="memberlist.do" method="post">
			<input type="text" name="id" placeholder="회원 아이디를 입력하세요">
			<button>검색</button>
		</form>
	</div>

	<div class="table-wrapper">
		<table>
			<thead>
				<tr>
					<th>회원 아이디</th>
					<th>가입일자</th>
					<th>현재 상태</th>
					<th>상세보기</th>
					<th>회원 삭제</th>
				</tr>
			</thead>

			<tbody>
				<c:if test="${empty vlist}">
					<tr>
						<td colspan="5">등록된 회원이 없습니다.</td>
					</tr>
				</c:if>

				<c:forEach var="dto" items="${vlist}">
					<tr>
						<td>${dto.id}</td>
						<td>${dto.regdate}</td>
						<td class="status-active">활동</td>

						<td>
							<button class="btn-detail">상세보기</button>
						</td>

						<td>
							<form action="deleteMember.do" method="post">
								<input type="hidden" name="id" value="${dto.id}">
								<button class="btn-delete">삭제</button>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<!-- 상세보기 모달 -->
<div id="detailModal" class="modal">
	<div class="modal-content">
		<span class="close-btn">&times;</span>
		
		<h3>회원 상세정보</h3>

		<p><strong>ID:</strong> <span id="modal-id"></span></p>
		<p><strong>이름:</strong> <span id="modal-name"></span></p>
		<p><strong>가입일:</strong> <span id="modal-regdate"></span></p>
		<p><strong>작성한 일기 수:</strong> <span id="modal-postcount"></span></p>
		<p><strong>마지막 작성일:</strong> <span id="modal-lastdate"></span></p> </div>
	</div>
</div>
<script>
const contextPath = '<%=request.getContextPath()%>';

document.addEventListener("DOMContentLoaded", function() {
    const modal = document.getElementById("detailModal");
    const closeBtn = document.querySelector(".close-btn");
    const detailButtons = document.querySelectorAll(".btn-detail");

    detailButtons.forEach(btn => {
    	btn.addEventListener("click", (e) => {
            e.preventDefault();
            const row = btn.closest("tr");
            const id = row.querySelector("td:first-child").textContent.trim(); 
            
            console.log("상세보기 버튼 클릭. ID:", id); 

            fetch(contextPath + "/memberDetail?id=" + id)
                .then(res => {
                    // 서버 응답 상태 코드 확인 (500 에러 등을 걸러냄)
                    if (!res.ok) {
                        throw new Error(`서버 응답 오류: ${res.status}`);
                    }
                    return res.json();
                })
                .then(data => {
                	console.log("수신된 데이터:", data);
                	
                    // Map 사용 시에도 'member' 키가 존재해야 DTO 객체가 넘어옵니다.
                	if(!data.member){
                        // ID가 존재하지 않는 경우 (404가 아닌 200으로 넘어왔을 때)
                        alert("회원 정보를 찾을 수 없습니다.");
                        return;
                    }
                    
                    // 데이터 매핑: Map 구조를 가정하고 memberDTO 필드 접근
                    document.getElementById("modal-id").textContent = data.member.id;
                    document.getElementById("modal-name").textContent = data.member.name;
                    document.getElementById("modal-regdate").textContent = data.member.regdate;
                    
                    // diaryCount와 lastDate는 Map의 최상위 키로 직접 접근
                    document.getElementById("modal-postcount").textContent = (data.diaryCount || 0)+" 개";
                    document.getElementById("modal-lastdate").textContent = data.lastDate || '기록 없음'; // Map 사용 시 String 값 그대로 사용
                    
                    // 모달 열기
                    modal.style.display = "flex";
                })
                .catch(err => {
                    // fetch 실패 또는 res.json() 파싱 실패 시
                    console.error("Fetch 또는 파싱 오류:", err);
                    alert(`데이터를 가져오는 중 오류가 발생했습니다: ${err.message}`);
                });
        });
    });

    // 닫기 버튼 클릭
    closeBtn.addEventListener("click", () => modal.style.display = "none");

    // 배경 클릭 시 닫기
    window.addEventListener("click", e => { 
        if(e.target === modal) modal.style.display = "none"; 
    });
});
</script>

<%@ include file="footer.jsp"%>

</body>
</html>
