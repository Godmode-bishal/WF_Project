package com.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BankUserLoginServlet extends HttpServlet{
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		 //request.getRequestDispatcher("bank_user.html").include(request, response); 
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
		String message = "";
		request.getSession().setAttribute("message", message);
		while(rs.next()){
			if((username.equals(rs.getString("employee_id")))&&(password.equals(rs.getString("emp_password"))))
			{
				HttpSession session=request.getSession();  
		        session.setAttribute("UID",username);  
				response.sendRedirect("options.jsp");
			}
			else
			{
				if(username=="" && password==""){
					message = "";
					request.getSession().setAttribute("message", message);
					response.sendRedirect("index.jsp");
				}else{
				message = "Invalid Employee ID or password";
				request.getSession().setAttribute("message", message);
				response.sendRedirect("index.jsp");
				
				}
				
				//String message = "Invalid Employee ID or password";
				//response.sendRedirect("index.html?message=" + URLEncoder.encode(message, "UTF-8"));
				//response.sendRedirect("bank_user.html");
				//request.getHeader("Invalid Employee ID or password");
				
				//out.println("\n\n\n\nInvalid Employee ID or password");
				
			}
		}
		conn.commit();
		rs.close();
		stmt.close();
		conn.close();
	}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		}
}
