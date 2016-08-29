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

public class AddConfirmServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		HttpSession session=req.getSession(false);  
		if(session!=null){
		String custid = req.getParameter("custid");
		String accType = req.getParameter("account");
		int amount = Integer.parseInt(req.getParameter("balance"));
		System.out.println("Customer ID: "+custid+ "	"+accType +"	"+ amount);
		
		
		try
		{
		Class.forName("oracle.jdbc.OracleDriver");
		
		
		//get the connection
		Connection conn= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "ON_BK_SYS","wellsfargo");
		Statement stmt=conn.createStatement();
		stmt.executeUpdate("INSERT INTO accounts values(accno_seq.nextval,'"+accType+"',"+amount+","+custid+",sysdate)");
						
		RequestDispatcher rd = req.getRequestDispatcher("options.jsp");
		rd.forward(req, resp);
		conn.commit();
		stmt.close();
		conn.close();
	}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		}
		else
		{
			resp.sendRedirect("index.jsp");
		}
	}
}
