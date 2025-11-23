package com.forme.servlet;

import java.io.IOException;
import java.util.ArrayList;

import com.forme.model.MemberDAO;
import com.forme.model.MemberDTO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/memberlist.do")
public class MemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO mdao = new MemberDAO();
		ArrayList<MemberDTO> mlist = mdao.selectAll();
		
		request.setAttribute("vlist", mlist);
		RequestDispatcher dispatcher=request.getRequestDispatcher("memberList.jsp");
		dispatcher.forward(request, response);
		
//		System.out.println("memberlist.do 실행됨.");
//		System.out.println("mlist size = "+mlist.size());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		
		
		MemberDAO mdao = new MemberDAO();
		ArrayList<MemberDTO> mlist = mdao.selectById(id);
		
		request.setAttribute("vlist", mlist);
		RequestDispatcher dispatcher=request.getRequestDispatcher("memberList.jsp");
		dispatcher.forward(request, response);
	}

}


