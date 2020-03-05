package com.itson.service;

import com.itson.bean.Book;
import com.itson.bean.Page;

import java.util.List;

/**
 * 图书相关业务的Service
 */
public interface BookService {
	
	/**
	 * 插入一本图书
	 * @param book
	 * @return
	 */
	int saveBook(Book book);
	
	/**
	 * 删除一本图书
	 * @param bookId
	 * @return
	 */
	int delBook(String bookId);
	
	/**
	 * 更新一本图书
	 * @param book
	 * @return
	 */
	int updateBook(Book book);
	
	/**
	 * 查找所有图书
	 * @return
	 */
	List<Book> getBookList();

	/**
	 * 根据id查找图书
	 * @param bookId
	 * @return
	 */
	Book getBookById(String bookId);
	
	/**
	 * 查找图书的分页信息
	 * @param pageNumber
	 * @param pageSize
	 * @return
	 */
	Page<Book> findBook(String pageNumber, int pageSize);

	/**
	 * 根据价格查找图书
	 * @param pageNumber
	 * @param pageSize
	 * @param min
	 * @param max
	 * @return
	 */
	Page<Book> findBookByPrice(String pageNumber, int pageSize, String min, String max);

}
