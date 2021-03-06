package com.itson.servlet.manager;

import com.itson.bean.Order;
import com.itson.bean.OrderItem;
import com.itson.service.OrderService;
import com.itson.service.impl.OrderServiceImpl;
import com.itson.servlet.BaseServlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * 处理后台订单管理请求的Servlet
 */
public class OrderManagerServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	
	//创建OrderService
	private OrderService orderService = new OrderServiceImpl();
	
	protected void sendBook(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//获取订单号
		String orderId = request.getParameter("orderId");
		//调用service做发货操作
		orderService.sendBook(orderId);
		
		//重定向去订单列表
		response.sendRedirect(request.getContextPath()+"/manager/OrderManagerServlet?method=orderList");
		
	}

	/**
	 * 获取当前订单详情
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void orderInfo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//获取订单号
		String orderId = request.getParameter("orderId");
		//调用service查询订单详情
		List<OrderItem> list = orderService.getOrderInfo(orderId);
		//将list放入request域中
		request.setAttribute("list", list);
		//转发到一个页面
		request.getRequestDispatcher("/pages/order/order-info.jsp").forward(request, response);

	}

	/**
	 * 查找所有的订单
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void orderList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//调用OrderService查询所有的订单
		List<Order> list = orderService.getOrderList();
		//将list放入request域中
		request.setAttribute("list", list);
		
		//转发到/pages/manager/order_manager.jsp
		request.getRequestDispatcher("/pages/manager/order_manager.jsp").forward(request, response);
		
	}

}
