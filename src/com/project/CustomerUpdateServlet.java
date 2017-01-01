package com.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CustomerUpdateServlet extends HttpServlet{

	//final long customerId = 10000000L;
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
			HttpSession session=request.getSession(false);  
			if(session!=null){
				//String name=(String)session.getAttribute("UID"); 
				String custId = request.getParameter("custid");
				String title = request.getParameter("title");
				String firstName = request.getParameter("firstName");
				String middleName = request.getParameter("middleName");
				String lastName = request.getParameter("lastName");
				String relation = request.getParameter("relation");
				String perAddress = request.getParameter("permanentAddress");
				//out.println("The permanent address is: " +perAddress);
				String mailAddress = request.getParameter("mailingAddress");
				String email = request.getParameter("email");
				String dob = request.getParameter("dob");
				
				String mobNo = request.getParameter("mobileNo");
				String gender = request.getParameter("gender");
				String ssn = request.getParameter("ssn");
				//System.out.println("Hello");
				try
				{
					SimpleDateFormat df = new SimpleDateFormat("YYYY-MM-DD");
				    java.util.Date d = df.parse(dob);
					Date date = new Date(d.getTime());
					//System.out.println("hi");
					Class.forName("oracle.jdbc.OracleDriver");
					Connection conn= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "ON_BK_SYS","wellsfargo");
					conn.commit();
					Statement stmt = null;
					out.println("\n Updating records into table...");
					stmt = conn.createStatement();
					String sql = "UPDATE CUSTOMER SET CUSTOMER_ID="+custId+", TITLE=?, FIRST_NAME=?, MIDDLE_NAME=?, LAST_NAME=?, FATHER_NAME=?, PERMANENT_ADDRESS=?, MAILING_ADDRESS=?, EMAIL=?, DOB=?, MOB_NO=?, GENDER=?, SSN=? where ssn="+ssn;
					//System.out.println("hi2");
					PreparedStatement preparedStatement = conn.prepareStatement(sql);
					preparedStatement.setString(1, title);
					preparedStatement.setString(2, firstName);
					preparedStatement.setString(3, middleName);
					preparedStatement.setString(4, lastName);
					preparedStatement.setString(5, relation);
					preparedStatement.setString(6, perAddress);
					preparedStatement.setString(7, mailAddress);
					preparedStatement.setString(8, email);
					preparedStatement.setDate(9, date);
					preparedStatement.setLong(10, Long.parseLong(mobNo));
					preparedStatement.setString(11, gender);
					preparedStatement.setLong(12, Long.parseLong(ssn));
					conn.commit();
					preparedStatement.executeUpdate();
					//System.out.println("yo");
					conn.commit();
					preparedStatement.close();
					stmt.close();
					conn.close();
					
					response.sendRedirect("options.jsp");
				}

				catch(Exception e)
				{
					e.printStackTrace();
				}
			}
			else
			{
				out.println("\n Error! Could not modify customer profile.");
				response.sendRedirect("modify.jsp");
			}
	
}
}
