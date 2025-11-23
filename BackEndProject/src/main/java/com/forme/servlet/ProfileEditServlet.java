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

@WebServlet("/edit.do")
public class ProfileEditServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String oldPw = request.getParameter("oldPw");
		String newPw = request.getParameter("newPw");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		
		
		HttpSession session = request.getSession();
		MemberDTO loginUser = (MemberDTO)session.getAttribute("loginUser");

		if(loginUser.getPw() != null && loginUser.getPw().equals(oldPw)) {
			//현재 사용자의 비밀번호와 입력한 기존 비밀번호가 같을 때에만 변경할 수 있도록
			MemberDTO mdto = new MemberDTO();
			mdto.setId(loginUser.getId());
			mdto.setName(name);
			mdto.setPhone(phone);
			mdto.setEmail(email);
			if(newPw.equals("")) { //패스워드 입력 x시에는 기존 pw들어가도록
				mdto.setPw(oldPw);
			}else {
				mdto.setPw(newPw);
			}
			
			MemberDAO mdao = new MemberDAO();
			MemberDTO editUser = new MemberDTO();
			editUser = mdao.editProfile(mdto);
			
			session.setAttribute("loginUser", editUser);
			System.out.println("정보변경 완료");
			response.sendRedirect("profileEditSuccess.jsp");
			
			
		}else {
			//기존 비밀번호 입력 틀렸을 때는 에러메세지 출력
			request.setAttribute("error", "비밀번호를 다시 확인해주세요.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("profileEdit.jsp");
			dispatcher.forward(request, response);
		}
	}

}
