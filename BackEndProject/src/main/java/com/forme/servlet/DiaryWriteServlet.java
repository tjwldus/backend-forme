package com.forme.servlet;

import java.io.IOException;

import com.forme.model.DiaryDAO;
import com.forme.model.DiaryDTO;
import com.forme.model.MemberDTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/diaryWrite.do")
public class DiaryWriteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("diaryWrite.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loginUser") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");

        request.setCharacterEncoding("UTF-8");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
       // String emotion = request.getParameter("emotion");

        DiaryDTO dto = new DiaryDTO();
        dto.setUser_id(loginUser.getId());
        dto.setTitle(title);
        dto.setContent(content);
        //dto.setEmotion(emotion);

        DiaryDAO dao = new DiaryDAO();
        boolean ok = dao.insertDiary(dto);

        if (ok) {
            response.sendRedirect("diaryList.do");
        } else {
            request.setAttribute("error", "일기 저장에 실패했습니다.");
            request.getRequestDispatcher("diaryWrite.jsp").forward(request, response);
        }
    }
}
