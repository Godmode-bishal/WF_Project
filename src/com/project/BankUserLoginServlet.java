package com.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BankUserLoginServlet extends HttpServlet{
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		PrintWriter out=response.getWriter();
		//System.out.println(username+" "+password);
		try
		{
		Class.forName("oracle.jdbc.OracleDriver");
		
		
		//get the connection
		Connection conn= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "ON_BK_SYS","wellsfargo");
		Statement stmt=conn.createStatement();
		ResultSet rs=stmt.executeQuery("select employee_id,emp_password from bank_user");
		while(rs.next()){
			if((username.equals(rs.getString("employee_id")))&&(password.equals(rs.getString("emp_password"))))
			{
				response.sendRedirect("options.html");
				break;
			}
			rs.close();
			stmt.close();
			conn.close();
		}
	}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		}
}
