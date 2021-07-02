/**
 * 
 */
package com.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.dao.UserDao;
import com.ssm.po.User;
import com.ssm.service.UserService;
import com.ssm.utils.MD5Utils;

/**
 * @author chenzhi
 *
 */
@Service("UserService")
public class UserServiceImpl implements UserService{

	/* (non-Javadoc)
	 * @see com.ssm.service.UserService#findUserList(java.lang.String, java.lang.Integer)
	 */
	@Autowired
	private UserDao userDao;
	
	@Override
	public List<User> findUserList(String keywords, Integer userListRoleId) {
		// TODO Auto-generated method stub
		List<User> userList=this.userDao.selectUserList(keywords, userListRoleId);
		return userList;
	}

	/* (non-Javadoc)
	 * @see com.ssm.service.UserService#findUser(java.lang.String, java.lang.String)
	 */
	@Override
	public User findUser(String loginName, String password) {
		// TODO Auto-generated method stub
		return userDao.findUser(loginName, password);
	}

	/* (non-Javadoc)
	 * @see com.ssm.service.UserService#getUserByUserId(java.lang.Integer)
	 */
	@Override
	public User getUserByUserId(Integer userId) {
		// TODO Auto-generated method stub
		return userDao.getUserByUserId(userId);
	}

	/* (non-Javadoc)
	 * @see com.ssm.service.UserService#getUserByLoginName(java.lang.String)
	 */
	@Override
	public User getUserByLoginName(String loginName) {
		// TODO Auto-generated method stub
		return userDao.getUserByLoginName(loginName);
	}

	/* (non-Javadoc)
	 * @see com.ssm.service.UserService#editUser(com.ssm.po.User)
	 */
	@Override
	public int editUser(User user) {
		// TODO Auto-generated method stub
		return userDao.updateUser(user);
	}

	/* (non-Javadoc)
	 * @see com.ssm.service.UserService#addUser(com.ssm.po.User)
	 */
	@Override
	public int addUser(User user) {
		// TODO Auto-generated method stub
		user.setPassword(MD5Utils.code(user.getPassword()));
		return userDao.addUser(user);
	}

	/* (non-Javadoc)
	 * @see com.ssm.service.UserService#deleteUser(java.lang.Integer)
	 */
	@Override
	public int deleteUser(Integer userId) {
		// TODO Auto-generated method stub
		return userDao.deleteUser(userId);
	}

	/* (non-Javadoc)
	 * @see com.ssm.service.UserService#setUserStatus(com.ssm.po.User)
	 */
	@Override
	public int setUserStatus(User user) {
		// TODO Auto-generated method stub
		return userDao.setUserStatus(user);
	}

	/* (non-Javadoc)
	 * @see com.ssm.service.UserService#modifyPassword(com.ssm.po.User)
	 */
	@Override
	public int modifyPassword(User user) {
		// TODO Auto-generated method stub
		return userDao.modifyPassword(user);
	}
	
}
