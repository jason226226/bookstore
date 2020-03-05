package com.itson.dao.impl;


import com.itson.bean.OrderItem;
import com.itson.dao.BaseDao;
import com.itson.dao.OrderItemDao;

import java.util.List;

/**
 * OrderItemDao的实现类
 */
public class OrderItemDaoImpl extends BaseDao<OrderItem> implements
		OrderItemDao {

	@Override
	public int saveOrderItem(OrderItem orderItem) {

		String sql = "INSERT INTO bs_order_item (count , amount , title , author , price , img_path , order_id) "
				+ "VALUES(?,?,?,?,?,?,?)";

		return this.update(sql, orderItem.getCount(), orderItem.getAmount(),
				orderItem.getTitle(), orderItem.getAuthor(),
				orderItem.getPrice(), orderItem.getImgPath(),
				orderItem.getOrderId());
	}

	@Override
	public List<OrderItem> getOrderItemListByOrderId(String orderId) {
		
		String sql = "SELECT id , count , amount , title , author , price , img_path imgPath , order_id orderId "
				+ "FROM bs_order_item WHERE order_id=?";
		
		return this.getBeanList(sql, orderId);
	}

	@Override
	public void batchSave(Object[][] params) {
		
		String sql = "INSERT INTO bs_order_item (count , amount , title , author , price , img_path , order_id) "
				+ "VALUES(?,?,?,?,?,?,?)";
		
		this.batchUpdate(sql, params);
		
	}

}
