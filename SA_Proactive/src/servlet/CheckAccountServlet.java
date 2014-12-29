package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.MemberDB;

public class CheckAccountServlet extends HttpServlet{
	//��post��function��
	
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp)
				throws ServletException, IOException {
			// TODO Auto-generated method stub
			req.setCharacterEncoding("UTF-8"); //設定UTF-8 才不會有亂碼
			MemberDB memberDB = new MemberDB();
			String memberAccount = req.getParameter("memberAccount");
			boolean flag=false;
			try {
				flag=memberDB.checkAccount(memberAccount); //新增輸入的物件
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			resp.setContentType("text/html;charset=UTF-8"); 
			resp.setHeader("Cache-Control","no-cache"); 
			PrintWriter out = resp.getWriter();
			out.print(flag);
		}
			
		
		

	}

