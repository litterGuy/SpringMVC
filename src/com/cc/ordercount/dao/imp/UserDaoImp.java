package com.cc.ordercount.dao.imp;

import java.util.List;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.cc.ordercount.dao.UserDao;
import com.cc.ordercount.model.UserModel;

@Repository
@SuppressWarnings("deprecation")
public class UserDaoImp implements UserDao {

	private SimpleJdbcTemplate jdbcTemplate;
	
	@Resource
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new SimpleJdbcTemplate(dataSource);
	}
	
	@Override
	public UserModel getUserByLoginName(String loginName) {
		String sql = "select * from user_tab where loginName = ?";
		List<UserModel> list = jdbcTemplate.query(sql, 
				new BeanPropertyRowMapper<UserModel>(UserModel.class),new Object[]{loginName});
		if(list.size() == 0)
			return null;
		return list.get(0);
	}

}
