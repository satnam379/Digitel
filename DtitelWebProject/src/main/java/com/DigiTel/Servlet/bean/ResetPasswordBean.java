package com.DigiTel.Servlet.bean;

public class ResetPasswordBean {
	private String email;
	private String telenum;
	public String getTelenum() {
		return telenum;
	}
	public void setTelenum(String telenum) {
		this.telenum = telenum;
	}
	private String password;
	private String newpassword;
	
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNewpassword() {
		return newpassword;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}
	

}
