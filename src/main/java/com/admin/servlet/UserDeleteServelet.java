package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;

@WebServlet("/deletee")
public class UserDeleteServelet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			
			UserDAOImpl dao =new UserDAOImpl(DBConnect.getConn());
			boolean f=dao.deleteCustomers(id);
			
			HttpSession session=req.getSession();
			
			if(f)
			{
				session.setAttribute("succMsg", "User Deleted Successfully");
				resp.sendRedirect("admin/all_customers.jsp");
			}else {
				session.setAttribute("succMsg", "Something Went on Server");
				resp.sendRedirect("admin/all_customers.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
