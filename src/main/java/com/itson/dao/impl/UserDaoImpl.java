package com.itson.dao.impl;

import com.itson.bean.User;
import com.itson.dao.BaseDao;
import com.itson.dao.UserDao;

/**
 * UserDao的实现类
 */
public class UserDaoImpl extends BaseDao<User> implements UserDao {

	@Override
	public User getUserByUsernameAndPassword(User user) {
		
		String sql = "SELECT id , username , password , email FROM bs_user WHERE username=? AND password=?";
		
		return this.getBean(sql, user.getUsername() , user.getPassword());
	}

	@Override
	public int saveUser(User user) {
		
		String sql = "INSERT INTO bs_user (username , password , email) VALUES(?,?,?)";
		try{
			return this.update(sql, user.getUsername() , user.getPassword() , user.getEmail());
		}catch(Exception e){
			return 0;
		}
	}

	@Override
	public User getUserByUsername(String username) {
		
		String sql = "SELECT id , username , password , email FROM bs_user WHERE username=?";
		
		return this.getBean(sql, username);
	}

}
