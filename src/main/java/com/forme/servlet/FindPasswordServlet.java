package com.forme.servlet;

import java.io.IOException;

import com.forme.model.MemberDAO;
import com.forme.model.MemberDTO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/findPassword.do")
public class FindPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userid = request.getParameter("userid");

        MemberDAO mdao = new MemberDAO();
        
        String pw = mdao.findPassword(userid);   

        if (pw != null) {  
            request.setAttribute("pw", pw);
        } else { 
            request.setAttribute("error", "존재하지 않는 아이디입니다.");
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("findPassword.jsp");
        dispatcher.forward(request, response);
    }
}
