package com.cc.ordercount.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * 用户实体
 * @author litterGuy
 *
 */
@Entity
@Table(name="user_tab")
public class UserModel implements Serializable{
	private static final long serialVersionUID = 541135290497201164L;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="userID",nullable=false)
	private int userID;
	
	private String loginName;
	
	private String passWord;
	
	private String email;
	
	private String name;
	
	private String cellPhone;
	
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Transient
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getCellPhone() {
		return cellPhone;
	}
	public void setCellPhone(String cellPhone) {
		this.cellPhone = cellPhone;
	}
}
