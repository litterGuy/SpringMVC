package com.cc.ordercount.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/ordercount")
public class UserInforController {

	private Logger logger = Logger.getLogger(UserInforController.class);
	
	@RequestMapping(value="/welcome")
	public String aftLogin(){
		logger.info("just do this for temp");
		return "welcome";
	}
}
