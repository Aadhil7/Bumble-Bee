package com.DAO;

import java.util.List;

import com.entity.BookDtls;
import com.entity.Cart;
import com.entity.User;

public interface CartDAO {
	
	public boolean addCart(Cart c);
	
	public List<Cart> getBookByUser(int userId);
	
	public boolean deleteBook(int bid, int uid, int cid);
	
	public List<Cart> getTotalPayment();
	
	public boolean makePaymentByUser(int bid, int uid, int cid);

}
