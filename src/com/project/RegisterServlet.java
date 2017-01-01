package com.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;


import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RegisterServlet
 */
//@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

	//final long customerId = 10000000L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession(false);  
		if(session!=null){
			//String name=(String)session.getAttribute("UID"); 
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
			String S1 = dob.substring(0,2);
			String S2 = dob.substring(3,5);
			dob=S2+"/"+S1+dob.substring(5);
			String mobNo = request.getParameter("mobileNo");
			String gender = request.getParameter("gender");
			String ssn = request.getParameter("ssn");
			String balance=request.getParameter("balance");
			try
			{
				Class.forName("oracle.jdbc.OracleDriver");
				Connection conn= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "ON_BK_SYS","wellsfargo");
				Statement stmt = null;
				//out.println("\nInserting records into table...");
				stmt = conn.createStatement();
				String sql = "INSERT INTO CUSTOMER(CUSTOMER_ID, TITLE, FIRST_NAME, MIDDLE_NAME, LAST_NAME, FATHER_NAME, PERMANENT_ADDRESS, MAILING_ADDRESS, EMAIL, DOB, MOB_NO, GENDER, SSN) VALUES (cust_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
				String sq2="INSERT INTO ACCOUNTS(ACCOUNT_NO,ACCOUNT_TYPE,BALANCE,CUSTOMER_ID,DATE_OF_CREATION) VALUES(accno_seq.nextVal,?,?,cust_seq.currval,sysdate)";
				PreparedStatement preparedStatement = conn.prepareStatement(sql);
				PreparedStatement preparedStatement1 = conn.prepareStatement(sq2);
				preparedStatement.setString(1, title);
				preparedStatement.setString(2, firstName);
				preparedStatement.setString(3, middleName);
				preparedStatement.setString(4, lastName);
				preparedStatement.setString(5, relation);
				preparedStatement.setString(6, perAddress);
				preparedStatement.setString(7, mailAddress);
				preparedStatement.setString(8, email);
				preparedStatement.setString(9, dob);
				preparedStatement.setLong(10, Long.parseLong(mobNo));
				preparedStatement.setString(11, gender);
				preparedStatement.setLong(12, Long.parseLong(ssn));
				conn.commit();
				preparedStatement.executeUpdate();
				preparedStatement1.setString(1, "savings");
				preparedStatement1.setLong(2, Long.parseLong(balance));
				conn.commit();
				preparedStatement1.executeQuery();
				preparedStatement.close();
				preparedStatement1.close();
				conn.commit();
				ResultSet rs = stmt.executeQuery("Select customer_id from customer where ssn ="+ssn);
				while(rs.next()){
				out.print("<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js\"></script> <script src=\"http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script><style>h1 { border: 2px solid black; border-radius: 5px;} </style><h1>Registration Successful! Customer ID: "+ rs.getString(1)+"</h1><form action=\"options.jsp\"><input type=\"submit\" value=\"Back\" class=\"btn btn-success\"/></form>");
				}
			
				conn.commit();
				rs.close();
				stmt.close();
				conn.close();
				
				//response.sendRedirect("options.jsp");
			}

			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		else
		{
			response.sendRedirect("index.jsp");
		}
	}

}
