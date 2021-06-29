/**
 * 
 */
package com.ssm.controller;


import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.ssm.po.Role;
import com.ssm.po.User;
import com.ssm.service.RoleService;
import com.ssm.service.UserService;
import com.ssm.utils.ResponseUtil;

import net.sf.json.JSONObject;

/**
 * @author chenzhi
 *
 */
@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	
	//get user list
	@RequestMapping(value="/findUserList.action")
	public String findUserList(String keywords,Integer userListRoleId,Model model){
		//role list
		List<Role> roleList=roleService.findRoleList();
		model.addAttribute("roleList",roleList);
		//users list
		List<User> userList=userService.findUserList(keywords, userListRoleId);
		model.addAttribute("userList",userList);
		model.addAttribute("keywords",keywords);
		model.addAttribute("userListRoleId",userListRoleId);
		
		return "user/user_list";
	}
	//go to add user page
	@RequestMapping(value="/toAddUser.action")
	public String toAddUser(Model model){
		List<Role> roleList=roleService.findRoleList();
		model.addAttribute("roleList",roleList);
		return "user/add_user";
	}
		// wether user exist?
	@RequestMapping(value="/checkLoginName.action")
	@ResponseBody
	public User checkLoginName(@RequestBody User user,Model model){
		User checkUser = userService.getUserByLoginName(user.getLoginName());
		if(checkUser!=null){
			return checkUser;
		}else{
			checkUser=new User();  
			checkUser.setUserId(0);
			return checkUser;
		}
	}
	//add user
	@RequestMapping(value="/addUser.action",method=RequestMethod.POST)
	public String addUser(User user,Model model){
		//get role list
		List<Role> roleList = roleService.findRoleList();
		model.addAttribute("roldeList",roleList);
		model.addAttribute("user",user);
		//check user wether exist
		User checkUser = userService.getUserByLoginName(user.getLoginName());
		if(checkUser!=null){
			model.addAttribute("checkUserLoginNameMsg","登录账号已存在，请重新输入");
			return "user/add_user";
		}else{
			Date date = new Date();
			user.setRegisterTime(date);
			user.setStatus("2");//on use
			int rows = userService.addUser(user);
			//sql add
			if(rows>0){
				//success
				return "redirect:findUserList.action";
			}else{
				return "user/add_user";
			}
		}
	}
	

	 
	//to update user page
	@RequestMapping(value="/toEditUser.action")
	public String toEditUser(Integer userId,Model model){
		User user=userService.getUserByUserId(userId);
		if(user!=null){
			model.addAttribute("user",user);
			List<Role> roleList = roleService.findRoleList();
			model.addAttribute("roleList",roleList);
			return "user/edit_user";
		}else{
			return "redirect:findUserList.action";
		}
	}
	//update user
	@RequestMapping(value="/editUser.action",method=RequestMethod.POST)
	public String editUser(User user,Model model){
		//get role list
		Date date = new Date();
		user.setRegisterTime(date);
		//set status
		user.setStatus("2");
		int rows = userService.editUser(user);
		if(rows>0){
			return "redirect:findUserList.action";
		}else{
			List<Role> roleList=roleService.findRoleList();
			model.addAttribute("roleList",roleList);
			model.addAttribute("user",user);
			return "user/edit_user";
		}		
	}
	//delete user
	@RequestMapping(value="/deleteUser.action")
	@ResponseBody
	public User deleteUser(@RequestBody User user,Model model){
		int rows = userService.deleteUser(user.getUserId());
		if(rows>0){
			return user;
		}else{
			user.setUserId(0);
			return user;
		}
	}
	//ban use
	@RequestMapping(value="/disableUser.action")
	@ResponseBody
	public User disableUser(@RequestBody User user,Model model){
		int rows = userService.setUserStatus(user);
		if(rows>0){
			return user;
			
		}else{
			user.setUserId(0);
			return user;
			
		}
	}
	//able user
	@RequestMapping(value="/enableUser.action")
	@ResponseBody
	public User enableUser(@RequestBody User user,Model model){
		int rows = userService.setUserStatus(user);
		if(rows>0){
			return user;
		}else{
			user.setUserId(0);
			return user;
		}
	}
	//login
	@RequestMapping(value="/login.action",method=RequestMethod.POST)
	public String login(String loginName,String password,Model model,HttpSession session){
		User user = userService.findUser(loginName, password);
		if(user!=null){
			if(user.getStatus().equals("2")){
				session.setAttribute("login_user", user);
				return "main";
			}else{
				model.addAttribute("msg","账号未启用或被禁用，请联系管理员");
				return "login";
			}
		}
		model.addAttribute("msg","账号或密码错误，请重新登录");
		return "login";
	}
	//logout
	@RequestMapping(value="/logout.action")
	public String logout(HttpSession session){
		session.invalidate();
		return "login";
	}
	//modifyPassword
	@RequestMapping(value="/modifyPassword.action")
	public String modifyPassword(User user,HttpServletResponse response)throws Exception{
		int resultTotal=userService.modifyPassword(user);
		JSONObject result=new JSONObject();
		if(resultTotal>0){ // ִ�гɹ�
			result.put("success", true);
		}else{
			result.put("success", false);
		}
		ResponseUtil.write(response, result);
		return null;
	}
}

