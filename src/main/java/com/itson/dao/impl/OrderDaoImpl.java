package com.itson.dao.impl;

import com.itson.bean.Order;
import com.itson.dao.BaseDao;
import com.itson.dao.OrderDao;

import java.util.List;

/**
 * OrderDao的实现类
 */
public class OrderDaoImpl extends BaseDao<Order> implements OrderDao {

	@Override
	public int saveOrder(Order order) {

		String sql = "INSERT INTO bs_order (id, order_time, total_count, total_amount, state, user_id) "
				+ "VALUES(?,?,?,?,?,?)";

		return this.update(sql, order.getId(), order.getOrderTime(),
				order.getTotalCount(), order.getTotalAmount(),
				order.getState(), order.getUserId());
	}

	@Override
	public int updateState(String orderId, int state) {

		String sql = "UPDATE bs_order SET state=? WHERE id=?";

		return this.update(sql, state, orderId);
	}

	@Override
	public List<Order> getOrderList() {

		String sql = "SELECT id, order_time orderTime, total_count totalCount, total_amount totalAmount, "
				+ "state, user_id userId FROM bs_order ORDER BY order_time DESC";

		return this.getBeanList(sql);
	}

	@Override
	public List<Order> getOrderListByUserId(String userId) {
		String sql = "SELECT id, order_time orderTime, total_count totalCount, total_amount totalAmount, "
				+ "state, user_id userId FROM bs_order WHERE user_id=? ORDER BY order_time DESC";

		return this.getBeanList(sql, userId);
	}

}
