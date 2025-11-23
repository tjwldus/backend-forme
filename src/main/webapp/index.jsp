<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>ForMe 메인</title>

<style>

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Pretendard', 'Noto Sans KR', sans-serif;
}


body { 
  background: linear-gradient(180deg, #ffffff 0%, #fff9f4 100%);
  color:#4a4a4a; 
  overflow-x:hidden; 
}


.hero {
  height: 100vh;
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  overflow: hidden;
}


.hero-bg-light {
  position: absolute;
  width: 160%;
  height: 160%;
  background: radial-gradient(circle at center, rgba(255,255,255,0.9), rgba(255,245,220,0.3));
  filter: blur(90px);
  animation: breathe 8s ease-in-out infinite;
}
@keyframes breathe {
  0% { transform: scale(1); opacity: .55; }
  50% { transform: scale(1.15); opacity: .9; }
  100% { transform: scale(1); opacity: .55; }
}

.ball {
  position:absolute;
  width:140px; height:140px;
  border-radius:50%;
  opacity:0;
  transition:
    opacity 1.2s ease-out,
    transform .35s ease-out,
    box-shadow .35s ease-out,
    filter .35s ease-out;
  filter:drop-shadow(0 10px 22px rgba(180,180,180,0.25));
}


.ball.joy    { background:radial-gradient(circle,#fff6c8,#ffe08d); box-shadow:0 0 25px rgba(255,220,100,0.55); }
.ball.sad    { background:radial-gradient(circle,#d9efff,#a3d4ff); box-shadow:0 0 25px rgba(130,190,255,0.55); }
.ball.angry  { background:radial-gradient(circle,#ffd1d1,#ff9494); box-shadow:0 0 25px rgba(255,140,140,0.55); }
.ball.fear   { background:radial-gradient(circle,#e8ffe9,#b9f2c7); box-shadow:0 0 25px rgba(150,240,190,0.55); }
.ball.bored  { background:radial-gradient(circle,#f3e6ff,#d8c0ff); box-shadow:0 0 25px rgba(200,170,255,0.55); }


.ball:hover {
  transform: translateY(-8px) scale(3.08);
}

.entry-left { animation: rollLeft 1.4s ease-out forwards; }
.entry-right { animation: rollRight 1.4s ease-out forwards; }
.entry-bottom { animation: popUp 1.3s ease-out forwards; }

@keyframes rollLeft {
  0% { opacity:0; transform:translateX(-180%) rotate(-140deg); }
  60% { opacity:1; transform:translateX(20%) rotate(-20deg); }
 100% { opacity:1; transform:translateX(0) rotate(0); }
}
@keyframes rollRight {
  0% { opacity:0; transform:translateX(180%) rotate(140deg); }
  60% { opacity:1; transform:translateX(-20%) rotate(20deg); }
 100% { opacity:1; transform:translateX(0) rotate(0); }
}
@keyframes popUp {
 0% { opacity:0; transform:translateY(200%) scale(.8); }
 70% { opacity:1; transform:translateY(-25%) scale(1.05); }
100% { opacity:1; transform:translateY(0) scale(1); }
}


.hero-title {
  position:relative;
  z-index:5;
  text-align:center;
  opacity:0;
  transform: translateY(40px);
  transition:opacity 1.5s ease-out, transform 1.5s ease-out;
}
.hero-title img {
  width: 280px;
  filter: drop-shadow(0 6px 10px rgba(180,180,180,0.35));
}
.hero-title p { margin-top:20px;font-size:20px;opacity:.8; color:#555; }

.character-popup {
    position: fixed;
    inset: 0;
    background: rgba(0,0,0,0.25); 
    backdrop-filter: blur(4px); 
    visibility: hidden;
    opacity: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    transition: opacity .35s ease-out, visibility 0s linear .35s;
    z-index: 200;
}

.character-popup.show {
    visibility: visible;
    opacity: 1;
    transition-delay: 0s;
}

.character-center {
    position: relative;
    text-align: center;
    opacity: 0;
    transform: translateY(30px);
    transition: opacity .45s ease, transform .45s ease;
}

.character-center.show {
    opacity: 1;
    transform: translateY(0);
}


.character-glow {
    position: absolute;
    top: 50%;
    left: 50%;
    width: 360px;
    height: 360px;
    transform: translate(-50%, -55%);
    border-radius: 50%;
    background: radial-gradient(circle,
        rgba(255,255,255,0.8) 0%,
        rgba(255,240,220,0.4) 45%,
        rgba(255,255,255,0) 100%
    );
    filter: blur(50px);
    z-index: -1;
}

#characterImage {
    width: 200px;
    opacity: 0;
    transform: scale(.82);
    transition: opacity .45s, transform .45s;
}

#characterImage.show {
    opacity: 1;
    transform: scale(1);
}


#characterDesc {
    margin-top: 25px;
    font-size: 17px;
    line-height: 1.65;
    color: #444;
    opacity: 0.9;
}


</style>
</head>

<body>

<%@ include file="header.jsp" %>


<div class="hero">
  <div class="hero-bg-light"></div>

  <div class="ball joy entry-left"></div>
  <div class="ball sad entry-right"></div>
  <div class="ball angry entry-bottom"></div>
  <div class="ball fear entry-left"></div>
  <div class="ball bored entry-right"></div>

  <div class="hero-title" id="heroTitle">
    <img src="<%=request.getContextPath()%>/images/forme.png">
    <p>감정을 기록하고 나를 이해하는 공간</p>
  </div>
</div>





<div class="character-popup" id="characterPopup">

  <div class="character-center" id="characterCenter">

      <div class="character-glow"></div>

      <img id="characterImage" src="" alt="emotion character">

      <p id="characterDesc"></p>

  </div>
</div>


<script>
const ballsDom = document.querySelectorAll('.ball');
const title = document.getElementById('heroTitle');

const ballData = [
  {el:ballsDom[0],x:15,y:25,s:.6,cls:'joy'},
  {el:ballsDom[1],x:70,y:35,s:.8,cls:'sad'},
  {el:ballsDom[2],x:45,y:15,s:.5,cls:'angry'},
  {el:ballsDom[3],x:25,y:60,s:1.0,cls:'fear'},
  {el:ballsDom[4],x:80,y:55,s:.7,cls:'bored'}
];

window.addEventListener("load",()=>{
  ballData.forEach(b=>{
    b.el.style.left = b.x+"vw";
    b.el.style.top  = b.y+"vh";
    b.el.style.opacity = 1;
    b.el.style.cursor = "pointer";
  });

  setTimeout(()=>{
    title.style.opacity=1;
    title.style.transform="translateY(0)";
  },600);
});

window.addEventListener("scroll",()=>{
  let s = window.scrollY;
  ballData.forEach(b=>{
    const x = Math.sin(s*0.002*b.s)*60;
    const y = Math.cos(s*0.0017*b.s)*40;
    b.el.style.transform = `translate(${x}px,${y}px)`;
  });
});


const popup = document.getElementById("characterPopup");
const popupCenter = document.getElementById("characterCenter");
const popupImg = document.getElementById("characterImage");
const popupDesc = document.getElementById("characterDesc");

const emotionImages = {
  joy: "<%=request.getContextPath()%>/images/joy.png",
  sad: "<%=request.getContextPath()%>/images/sad.png",
  angry: "<%=request.getContextPath()%>/images/angry.png",
  fear: "<%=request.getContextPath()%>/images/fear.png",
  bored: "<%=request.getContextPath()%>/images/bored.png"
};

const emotionTexts = {
  joy: "오늘 너의 마음은 햇살처럼 따뜻해. 작은 순간들도 소중히 반짝이는 하루였구나.",
  sad: "괜찮아, 슬픈 날도 있어. 너의 감정은 결코 약함이 아니라 깊이야.",
  angry: "화가 난 너도 충분히 이해돼. 그 감정은 네가 상처받았다는 신호야.",
  fear: "불안함은 너를 지키기 위한 마음의 경고등이야. 지금 아주 잘 버티고 있어.",
  bored: "아무것도 하기 싫은 날도 있어. 잠시 쉬어가는 것도 너에게 필요한 시간이야."
};


ballData.forEach(b=>{
  b.el.addEventListener("click",()=>{
    popup.classList.add("show");

    popupImg.src = emotionImages[b.cls];
    popupDesc.textContent = emotionTexts[b.cls];

    setTimeout(()=>{
      popupCenter.classList.add("show");
      popupImg.classList.add("show");
    }, 50);
  });
});


popup.addEventListener("click",()=>{
  popupCenter.classList.remove("show");
  popupImg.classList.remove("show");

  setTimeout(() => popup.classList.remove("show"), 300);
});

</script>

<%@ include file="footer.jsp" %>

</body>
</html>
