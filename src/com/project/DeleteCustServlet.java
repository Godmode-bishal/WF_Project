package com.project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DeleteCustServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		HttpSession session=req.getSession(false);  
		if(session!=null){
		
		String custId = req.getParameter("custid");
		System.out.println("Deleting customer: " + custId);

		try {
			Class.forName("oracle.jdbc.OracleDriver");

			// get the connection
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "ON_BK_SYS", "wellsfargo");
			Statement stmt = conn.createStatement();
			//stmt.executeUpdate("INSERT INTO deleted_customer values(,"","",,,,,sysdate);");
			stmt.executeUpdate("INSERT INTO deleted_customer(customer_id,title,first_name,middle_name,last_name,father_name,permanent_address,mailing_address,email,dob,mob_no,gender,ssn,date_of_deletion) SELECT customer_id,title,first_name,middle_name,last_name,father_name,permanent_address,mailing_address,email,dob,mob_no,gender,ssn,sysdate FROM customer where customer_id="+custId);
			stmt.executeUpdate("INSERT INTO deleted_accounts(account_no,customer_id,account_type,balance,date_of_deletion) SELECT account_no,customer_id,account_type,balance,date_of_creation FROM accounts where customer_id="+custId);
			stmt.executeUpdate("delete from accounts where customer_id="+custId);
			stmt.executeUpdate("DELETE FROM customer WHERE customer_id="+custId);
			out.println("<h1>Customer profile successfully deleted.</h1><form action=\"options.jsp\"><input type=\"submit\" value=\"Back\"/></form>");
			
			conn.commit();
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		}
		else
		{
			resp.sendRedirect("index.jsp");
		}
	}
}
