package com.DigiTel.Servlet.bean;

public class AddUserBean {
	private String name;
	private String telenum;
	private String email;
	private String stage;
	private String password;
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTelenum() {
		return telenum;
	}
	public void setTelenum(String telenum) {
		this.telenum = telenum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getStage() {
		return stage;
	}
	public void setStage(String stage) {
		this.stage = stage;
	}

}
