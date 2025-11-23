<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.site-footer {
    width: 100%;
    padding: 70px 0 50px;
    background: linear-gradient(180deg, rgba(255,255,255,0) 0%, #f2f6ff 100%);
    border-top: 1px solid rgba(180,190,210,0.35);

    box-shadow: 0 -6px 16px rgba(150,180,255,0.12);
    color: #4a5f7d;
    font-family: 'Pretendard', 'Noto Sans KR', sans-serif;
}


.site-footer .wrap {
    width: 90%;
    max-width: 1300px;
    margin: 0 auto;

    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    gap: 40px;
}


.brand {
    display: flex;
    align-items: center;
    gap: 18px; 
}

.brand img {
    width: 90px;
    filter: drop-shadow(0 5px 10px rgba(180,200,255,0.3));
}

.brand h4 {
    font-size: 20px;
    font-weight: 700;
    color: #4a6fa3;
}

.brand p {
    margin-top: 6px;
    font-size: 14px;
    color: #6e7e9b;
}

.footer-col {
    min-width: 200px;
}

.footer-col h5 {
    font-size: 15px;
    font-weight: 700;
    margin-bottom: 12px;
    color: #4a6fa3;
}

.footer-col ul {
    margin: 0;
    padding: 0;
    list-style: none;
}

.footer-col li {
    margin-bottom: 9px;
    font-size: 14px;
    color: #6c7a96;
}

.footer-col a {
    color: #7ca8ff;
    text-decoration: none;
    transition: 0.25s ease;
}

.footer-col a:hover {
    color: #4c7cff;
    text-shadow: 0 0 8px rgba(120,160,255,0.4);
    transform: translateX(3px);
}


.footer-bottom {
    width: 90%;
    max-width: 1300px;
    margin: 40px auto 0;
    padding-top: 22px;

    border-top: 1px solid rgba(200,210,230,0.4);
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;

    gap: 20px;
    color: #7987a1;
    font-size: 13px;
}

.socials {
    display: flex;
    gap: 12px;
}

.socials a {
    padding: 8px 14px;
    border-radius: 8px;

    font-size: 13px;
    background: #e9f1ff;
    color: #4a6fa3;
    text-decoration: none;

    border: 1px solid rgba(160,190,255,0.4);
    transition: 0.25s ease;
}

.socials a:hover {
    background: #d8e7ff;
    color: #375b9e;
    transform: translateY(-3px);
    box-shadow: 0 4px 14px rgba(160,190,255,0.3);
}


@media (max-width: 860px) {
    .footer-bottom {
        flex-direction: column;
        align-items: flex-start;
        gap: 14px;
    }
}
</style>



<footer class="site-footer">
    <div class="wrap">
        <div class="brand">
            <img src="<%= request.getContextPath() %>/images/forme_logo.png" alt="ForMe logo">
            <div>
                <h4>ForMe</h4>
                <p>나의 감정을 기록하고, 이해하고, 돌보는 공간</p>
            </div>
        </div>

        <div class="footer-col">
            <h5>제작</h5>
            <ul>
                <li class="small-muted">동양미래대학교 — 백엔드실습 프로젝트</li>
                <li>서지연 · 황채린 · 홍다은</li>
                <li class="small-muted">담당 : Servlet / JSP · MySQL · OpenAI GPT</li>
            </ul>
        </div>

        <div class="footer-col">
            <h5>Tech Stack / Data</h5>
            <ul>
                <li>Java Servlet / JSP</li>
                <li>MySQL (RDB)</li>
                <li>HTML / CSS / JavaScript</li>
                <li>OpenAI GPT API</li>
                <li>감성 말뭉치 · 공공 정신건강 데이터</li>
            </ul>
        </div>

        <div class="footer-col">
            <h5>문의 & 리소스</h5>
            <ul>
                <li><a href="#">이용약관</a></li>
                <li><a href="#">개인정보처리방침</a></li>
                <li><a href="#">프로젝트 노션</a></li>
                <li><a href="#">깃허브</a></li>
            </ul>
        </div>
    </div>

    <div class="footer-bottom">
        <div class="left">
            © 2025 <strong>ForMe</strong> Project. For educational purposes only.  
            이 사이트는 학습용으로 제작되었습니다.
        </div>

        <div class="socials">
            <a href="#">Instagram</a>
            <a href="#">YouTube</a>
            <a href="#">LinkedIn</a>
        </div>
    </div>
</footer>
