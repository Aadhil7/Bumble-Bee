package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDtls;
import com.entity.Cart;
import com.entity.User;
import com.mysql.cj.protocol.Resultset;

public class CartDAOimpl implements CartDAO {

	private Connection conn;

	public CartDAOimpl(Connection conn) {
		this.conn = conn;
	}

	public boolean addCart(Cart c) {
		boolean f = false;
		try {

			String sql = "insert into cart (cid,bid,uid,productName,seller,price,total_price) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, c.getCid());
			ps.setInt(2, c.getBid());
			ps.setInt(3, c.getUid());
			ps.setString(4, c.getProductName());
			ps.setString(5, c.getSeller());
			ps.setDouble(6, c.getPrice());
			ps.setDouble(7, c.getTotal_price());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Cart> getBookByUser(int userId) {
		List<Cart> list = new ArrayList<Cart>();
		Cart c = null;
		double totalPrice = 0;

		try {

			String sql = "select * from cart where uid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);

			ResultSet rs = ps.executeQuery();// this resultset used here to list something in database

			while (rs.next())// while loop using fr resultset
			{
				c = new Cart();
				c.setCid(rs.getInt(1));
				c.setBid(rs.getInt(2));
				c.setUid(rs.getInt(3));
				c.setProductName(rs.getString(4));
				c.setSeller(rs.getString(5));
				c.setPrice(rs.getDouble(6));

				totalPrice = totalPrice + rs.getDouble(7);
				c.setTotal_price(totalPrice);

				list.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public boolean deleteBook(int bid, int uid, int cid) {
		boolean f = false;

		try {

			String sql = "delete from cart where bid=? and uid=? and cid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, bid);
			ps.setInt(2, uid);
			ps.setInt(3, cid);

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Cart> getTotalPayment() {
		List<Cart> list = new ArrayList<Cart>();
		Cart c = null;

		try {
			String sql = "select *from cart";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				c = new Cart();
				c.setCid(rs.getInt(1));
				c.setBid(rs.getInt(2));
				c.setUid(rs.getInt(3));
				c.setProductName(rs.getString(4));
				c.setSeller(rs.getString(5));
				c.setPrice(rs.getDouble(6));
				c.setTotal_price(rs.getDouble(7));
				list.add(c);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public boolean makePaymentByUser(int bid, int uid, int cid) {
		boolean f = false;
		Cart c = null;

		try {

			String sql = "select * from cart ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, bid);
			ps.setInt(2, uid);
			ps.setInt(3, cid);

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

}
