package com.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Login extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		 PrintWriter out = res.getWriter();
		 
		 try {
			 
			 Thread.sleep(2000);
			 
			 Class.forName("com.mysql.jdbc.Driver");
			 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/servletandjsp", "root", "ayush");
			 String email = req.getParameter("user_email");
			 String password = req.getParameter("user_password");
			 
			 PreparedStatement ps = con.prepareStatement("select email from user where email=? and password=?");
			 ps.setString(1, email);
			 ps.setString(2, password);
			 
			 ResultSet rs = ps.executeQuery();
			 
			 if(rs.next()) {
				 out.println("done");
			 }
			 else {
				 out.println("error");
			 }
			 
			 
		 }catch(Exception e) {
			 e.printStackTrace();
		 }
		 
		 
	}
}
