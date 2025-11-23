package com.forme.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;

import com.forme.model.MemberDAO;
import com.forme.model.MemberDTO;

@WebServlet("/join.do")
public class JoinServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("userid");
		String pw = request.getParameter("password");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");

		MemberDTO mdto = new MemberDTO();
		mdto.setId(id);
		mdto.setPw(pw);
		mdto.setName(name);
		mdto.setPhone(phone);
		mdto.setEmail(email);

		MemberDAO mdao = new MemberDAO();
		// int -> 성공/실패여부 표현하기 위해
		int result = mdao.join(mdto);

		//result가 0일 경우 회원가입 실패
		if (result == 0) {
			request.setAttribute("error", "이미 존재하는 아이디입니다.");
			request.getRequestDispatcher("join.jsp").forward(request, response);
			System.out.println("아이디 중복됨");
		} else {
			response.sendRedirect("login.jsp");
			System.out.println("회원가입 완료");
		}
	}

}
