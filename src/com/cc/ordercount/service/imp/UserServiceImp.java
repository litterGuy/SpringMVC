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
			builder.append("{\"status\":\"false\",\"error_msg\":\"�û������ܴ�������������\"}");
			return builder.toString();
		}
		try {
			UserModel user = dao.getUserByLoginName(loginName); 
			if (user == null) {
				builder.append("{\"status\":\"false\",\"error_msg\":\"�û��������ڣ�����������\"}");
			}else if(!user.getPassWord().equalsIgnoreCase(passWord)){
				builder.append("{\"status\":\"false\",\"error_msg\":\"���벻ƥ�䣬����������\"}");
			}else{
				builder.append("{\"status\":\"true\",\"userID\":"+user.getUserID()+",\"userName\":\""+user.getName()+"\"}");
			}
		} catch (Exception e) {
			log.error(e.getMessage(),e);
			builder.append("{\"status\":\"false\",\"error_msg\":\"��ǰ���񲻿��ã����Ժ�����\"}");
		}
		return builder.toString();
	}

}
