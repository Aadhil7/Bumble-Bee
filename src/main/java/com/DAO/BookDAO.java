package com.DAO;

import java.util.ArrayList;
import java.util.List;

import com.entity.BookDtls;

public interface BookDAO {
	
	public boolean addBooks(BookDtls b);
	
	public List<BookDtls> getAllBook();
	
	public BookDtls getBookById(int id);
	
	public boolean UpdateEditBooks(BookDtls b);
	
	public boolean deleteBooks(int id);
	
	public List<BookDtls> getNewBook();// ITS ADDING 4 BOOKS ONLY INTO THE NEW PRODUCT SIDE
	
	public List<BookDtls> getRecentBook();// ITS ADDING 4 BOOKS ONLY INTO THE RECENT SIDE
	
	public List<BookDtls> getOldBooks();// '' '' '' '' 
	
	public List<BookDtls> getAllRecentBook();
	
	public List<BookDtls> getAllNewBook();
	
	public List<BookDtls> getAllOldBook();
	
	public List<BookDtls> getBookByOld(String email, String cate);//this is for old book only
	
	public boolean oldBookDelete(String email, String cate, int id);
	
	public List<BookDtls> getBookBySearch(String ch);
	

}
