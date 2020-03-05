package com.itson.dao;


import com.itson.bean.OrderItem;

import java.util.List;

/**
 * 定义订单项的数据库操作的接口
 */
public interface OrderItemDao {
	
	/**
	 * 向数据库中插入一个订单项
	 * @param orderItem
	 * @return
	 */
	int saveOrderItem(OrderItem orderItem);
	
	/**
	 * 根据订单号查找订单项
	 * @param orderId
	 * @return
	 */
	List<OrderItem> getOrderItemListByOrderId(String orderId);
	
	/**
	 * 批量向数据库中插入订单项
	 * @param params
	 */
	void batchSave(Object[][] params);

}
