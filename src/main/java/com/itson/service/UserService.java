package com.itson.service;

import com.itson.bean.User;

/**
 * 定义用户相关业务的接口
 */
public interface UserService {
	
	/**
	 * 用户登录的方法
	 * @param user
	 * @return
	 */
	User login(User user);
	
	/**
	 * 用户注册的方法
	 * @param user
	 * @return
	 */
	boolean regist(User user);
	
	/**
	 * 检查用户名是否可用，如果可用返回true，否则返回false
	 * @param username
	 * @return
	 */
	boolean checkUsername(String username);

}
