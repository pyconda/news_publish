/**
 * 
 */
package com.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssm.po.User;

/**
 * @author chenzhi
 *
 */
public interface UserDao {
	//all list
	public List<User> selectUserList(@Param("keywords") String keywords,
			@Param("userListRoleId") Integer userListRoleId);
	//login
	public User findUser(@Param("loginName") String loginName,
			@Param("password") String password);
	//find by id
	public User getUserByUserId(Integer userId);
	//find by login name
	public User getUserByLoginName(String loginName);
	//add
	public int addUser(User user);
	//update
	public int updateUser(User user);
	//delete
	public int deleteUser(Integer userId);
	//set status
	public int setUserStatus(User user);
	//change password
	public int modifyPassword(User user);
	
}
