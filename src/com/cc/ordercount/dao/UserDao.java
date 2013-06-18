package com.cc.ordercount.dao;

import com.cc.ordercount.model.UserModel;

public interface UserDao {
	public UserModel getUserByLoginName(String loginName);
}
