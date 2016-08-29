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


public class ModifyServlet extends HttpServlet{
			
			
			@Override
			protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				resp.setContentType("text/html");
				PrintWriter out=resp.getWriter();
				HttpSession session=req.getSession(false);  
				if(session!=null){
				
				String custid=req.getParameter("custid");
				System.out.println("Customer ID: "+custid);
				RequestDispatcher rd = req.getRequestDispatcher("modifycust.jsp");
				rd.forward(req, resp);
				}
				else
				{
					resp.sendRedirect("index.jsp");
				}
			}
}
