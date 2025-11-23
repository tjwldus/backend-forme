package com.forme.servlet;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import com.forme.model.DiaryDAO;
import com.forme.model.DiaryDTO;
import com.forme.model.MemberDAO;
import com.forme.model.MemberDTO;


@WebServlet("/memberDetail")
public class MemberDetailServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");

		
		MemberDAO mdao = new MemberDAO();
		MemberDTO person = mdao.getMemberById(id);
		
		
		DiaryDAO ddao = new DiaryDAO();
		int diaryCount = ddao.getDiaryCount(id);
		Timestamp lastDate = ddao.getLastDate(id);
		
	//	String lastDateStr = (lastDate != null) ? lastDate.toString() : "기록 없음";
		
		System.out.println(person.getId());
		
		Map<String, Object> result = new HashMap<>();
        result.put("member", person); 
        result.put("diaryCount", diaryCount);
        result.put("lastDate", lastDate);
        // ------------------------------------------------------------------

        Gson gson = new Gson();
        String json = gson.toJson(result);
        
        response.setContentType("application/json; charset=UTF-8");
        response.getWriter().write(json);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
