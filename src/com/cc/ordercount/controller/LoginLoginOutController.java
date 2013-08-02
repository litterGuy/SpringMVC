package com.cc.ordercount.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cc.ordercount.model.UserModel;
import com.cc.ordercount.service.imp.UserServiceImp;

@Controller
@RequestMapping(value="/account")
public class LoginLoginOutController {

	private Logger log = Logger.getLogger(LoginLoginOutController.class);
	
	@Autowired
	private UserServiceImp userService;
	
	@RequestMapping(value="/triggerLogin")
	public String triggerLogin(){
		//TODO:valid the user is or not logined!
		return "login";
	}
	/**
	 * 登陆
	 * @param loginName
	 * @param password
	 * @return
	 */
	@RequestMapping(value="/login",method=RequestMethod.POST)
	@ResponseBody
	public String login(@RequestBody UserModel user){
		String loginName = user.getLoginName();
		String passWord = user.getPassWord();
		String msg = userService.getUserByLoginName(loginName, passWord);
		return msg;
	}
	/**
	 * 退出
	 * @return
	 */
	@RequestMapping(value="loginOut")
	public String loginOut(){
		//TODO:也许应该记录用户登录退出的时间
		return "index";
	}
}
