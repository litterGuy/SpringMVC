package com.cc.ordercount.service.imp;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.cc.ordercount.dao.UserDao;
import com.cc.ordercount.model.UserModel;
import com.cc.ordercount.service.UserService;
@Service
public class UserServiceImp implements UserService{

	private static Logger log = Logger.getLogger(UserServiceImp.class);
	
	@Resource
	private UserDao dao;
	
	@Override
	public String getUserByLoginName(String loginName,String passWord) {
		StringBuilder builder = new StringBuilder();
		if(loginName == null){
			log.debug("the loginName is null and should try again!");
			builder.append("{\"status\":\"false\",\"error_msg\":\"用户名接受错误，请重新输入\"}");
			return builder.toString();
		}
		try {
			UserModel user = dao.getUserByLoginName(loginName); 
			if (user == null) {
				builder.append("{\"status\":\"false\",\"error_msg\":\"用户名不存在，请重新输入\"}");
			}else if(!user.getPassWord().equalsIgnoreCase(passWord)){
				builder.append("{\"status\":\"false\",\"error_msg\":\"密码不匹配，请重新输入\"}");
			}else{
				builder.append("{\"status\":\"true\",\"userID\":"+user.getUserID()+",\"userName\":\""+user.getName()+"\"}");
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
			builder.append("{\"status\":\"false\",\"error_msg\":\"当前服务不可用，请稍后重试\"}");
		}
		return builder.toString();
	}

}
