package com.cc.ordercount.dao.imp;


import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.cc.ordercount.dao.UserDao;
import com.cc.ordercount.model.UserModel;

@Repository
public class UserDaoImp implements UserDao {
	
	@Resource(name="sessionFactory")
	private SessionFactory sessionFactory;

	@Override
	public UserModel getUserByLoginName(String loginName) {
		String sql = "from UserModel u where u.loginName = ?";
		Query query = sessionFactory.getCurrentSession().createQuery(sql);
		query.setString(0, loginName);
		return (UserModel) query.uniqueResult();
	}

}
