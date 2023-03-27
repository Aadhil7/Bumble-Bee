package com.user.servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String dob = req.getParameter("dob");
			String password = req.getParameter("password");
			String check = req.getParameter("check");
			//Date dob = java.sql.Date.valueOf("dob");

			// System.out.println(name+" "+email+" "+phno+" "+password+" "+check);

			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setDob(dob);
			us.setPassword(password);

			HttpSession session = req.getSession();
			
			// Check if the user is above 18 years old
		
			
			if (check != null ) {

				UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
				
				boolean f2=dao.checkUser(email);
				if(f2)
				{
					
					boolean f = dao.userRegister(us);

					if (f) {
						// System.out.println("User Register Success...");

						session.setAttribute("succMsg", "Registration Successfully...");
						resp.sendRedirect("register.jsp");
					} else {
						// System.out.println("Something wrong on server...");
						session.setAttribute("failedMsg", "Something wrong on server...");
						resp.sendRedirect("register.jsp");
					}
					
				}else {
					session.setAttribute("failedMsg", "User Already Exist Try Another Email");
					resp.sendRedirect("register.jsp");
				}

			} else {
				// System.out.println("Please Check Agree & Terms Condition");
				session.setAttribute("failedMsg", "Please Check Agree & Terms Condition");
				resp.sendRedirect("register.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
