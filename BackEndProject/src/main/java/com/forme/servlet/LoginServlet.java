package com.forme.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import com.forme.model.MemberDAO;
import com.forme.model.MemberDTO;


@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("userid");
		String pw = request.getParameter("password");
		
		MemberDTO mdto = new MemberDTO();
		mdto.setId(id);
		mdto.setPw(pw);
		
		MemberDAO mdao = new MemberDAO();
		MemberDTO person= mdao.loginCheck(mdto);
		
		if(person != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", person);
			response.sendRedirect("index.jsp");
			System.out.println("로그인 성공");
			if(person.getId().equals("manager01")) {
				session.setAttribute("role","admin");
			}
		}else {
			request.setAttribute("error", "아이디와 비밀번호를 확인해주세요.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
			System.out.println("로그인 실패");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
