package com.spring.digitel.dao;

import com.spring.digitel.model.Login;

public class UserDaoimpl implements UserDao {

	@Override
	public void validateUser(Login login) {
		// TODO Auto-generated method stub
		String sql = "select * from users where username= '"+login.getUsename()"' and password = '"+login.getPassword()"'";

	}

}
