package com.spring.digitel.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.spring.digitel.model.Login;

public class UserServiceImpl implements UserService {

	@Override
	@Autowired
	UserDao userDao;
	public User validateUser(Login login) {
		// TODO Auto-generated method stub
		return userDao.validateUser(login);
	}

}
