package com.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AddAccServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out=resp.getWriter();
		HttpSession session=req.getSession(false);  
		if(session!=null){
		String custid=req.getParameter("custid");
		System.out.println("Customer ID: "+custid);
		RequestDispatcher rd = req.getRequestDispatcher("addAcc.jsp");
		rd.forward(req, resp);
		/*try
		{
		Class.forName("oracle.jdbc.OracleDriver");
		
		
		//get the connection
		Connection conn= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "hr","hr");
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery("select * from customer where custId='"+custid+"'");
						
		while(rs.next()){
			out.println("<table><tr><td>" + rs.getString("custId")
			+ "</td><td>" + rs.getString("fname") + "</td><td>"
			+ rs.getString("paddress") + "</td><td>"
			+ rs.getString("mobile") + "</td></tr></table>");
		
		}
		rs.close();
		stmt.close();
		conn.close();
	}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	*/
	}
		else
		{
			resp.sendRedirect("index.jsp");
		}
		}
	
}
