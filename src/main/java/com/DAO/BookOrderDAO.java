package com.DAO;

import java.util.List;

import com.entity.Book_Order;

public interface BookOrderDAO {
	
	public boolean saveOrder(List<Book_Order> blist);//it save order must import B.order frm entity
	
	public List<Book_Order> getBook(String email);
	
	public List<Book_Order> getAllOrder();//admin get all order

}
