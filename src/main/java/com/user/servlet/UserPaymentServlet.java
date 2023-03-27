package com.user.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOimpl;
import com.DB.DBConnect;

@WebServlet("/user_payment")
public class UserPaymentServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int bid = Integer.parseInt(req.getParameter("bid"));
		int uid = Integer.parseInt(req.getParameter("uid"));
		int cid = Integer.parseInt(req.getParameter("cid"));

		CartDAOimpl dao = new CartDAOimpl(DBConnect.getConn());
		boolean f = dao.makePaymentByUser(bid, uid, cid);

		HttpSession session = req.getSession();

		if (f) {
			session.setAttribute("succMsg", "Book Removed From Cart");
			resp.sendRedirect("payment.jsp");
		} else {
			session.setAttribute("failedMsg", "Something Went On server");
			resp.sendRedirect("payment.jsp");
		}

	}

}