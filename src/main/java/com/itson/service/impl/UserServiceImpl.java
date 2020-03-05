package com.itson.service.impl;

import com.itson.bean.User;
import com.itson.dao.UserDao;
import com.itson.dao.impl.UserDaoImpl;
import com.itson.service.UserService;

/**
 * UserService的实现类
 */
public class UserServiceImpl implements UserService {
	
	//创建一个UserDao对象
	private UserDao userDao = new UserDaoImpl();

	@Override
	public User login(User user) {
		return userDao.getUserByUsernameAndPassword(user);
	}

	@Override
	public boolean regist(User user) {
		
		int count = userDao.saveUser(user);
		
		return count > 0;
	}

	@Override
	public boolean checkUsername(String username) {
		
		User user = userDao.getUserByUsername(username);
		
		return user==null;
	}

}
