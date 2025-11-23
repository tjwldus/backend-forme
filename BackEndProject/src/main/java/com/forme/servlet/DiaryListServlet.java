package com.forme.servlet;

import java.io.IOException;
import java.util.List;

import com.forme.model.DiaryDAO;
import com.forme.model.DiaryDTO;
import com.forme.model.MemberDTO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/diaryList.do")
public class DiaryListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 로그인 체크
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loginUser") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        MemberDTO loginUser = (MemberDTO) session.getAttribute("loginUser");

        DiaryDAO dao = new DiaryDAO();
        List<DiaryDTO> list = dao.getDiaryListByUser(loginUser.getId());

        request.setAttribute("diaryList", list);
        request.getRequestDispatcher("diaryList.jsp").forward(request, response);
    }
}
