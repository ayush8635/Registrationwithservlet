package com.user;

import java.io.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.sql.*;

public class Register extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		PrintWriter out = res.getWriter();

		String name = req.getParameter("user_name");
		String password = req.getParameter("user_password");
		String email = req.getParameter("user_email");

		out.println(name); 
		out.println(password);
		out.println(email);

		try {
			
			Thread.sleep(2000);

			Class.forName("com.mysql.jdbc.Driver");

			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/servletandjsp", "root", "ayush");

			String q = "insert into user(name,password,email) values(?,?,?)";

			PreparedStatement pst = con.prepareStatement(q);
			pst.setString(1, name);
			pst.setString(2, password);
			pst.setString(3, email);

			pst.executeUpdate();

			out.println("done");

		} catch (Exception e) {
			e.printStackTrace();
			out.println("error");
		}

	}

}
