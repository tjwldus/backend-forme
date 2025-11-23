package com.forme.servlet;

import java.io.IOException;

import com.forme.model.MemberDAO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/deleteMember.do")
public class DeleteMemberServlet extends HttpServlet {
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		
		if(id!=null) {
			if(id.equals("manager01")) {
				request.setAttribute("error", "관리자는 삭제할 수 없습니다.");
				RequestDispatcher dispatcher = request.getRequestDispatcher("memberlist.do");
				dispatcher.forward(request, response);
				return;
			}
		}
		
		MemberDAO mdao = new MemberDAO();
		boolean result = mdao.deleteMember(id);
		
		if(result) {
			response.sendRedirect("memberlist.do");
		}else {
			response.sendRedirect("error.jsp");
		}
	}

}
