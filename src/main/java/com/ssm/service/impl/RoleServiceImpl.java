/**
 * 
 */
package com.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.dao.RoleDao;
import com.ssm.po.Role;
import com.ssm.service.RoleService;

/**
 * @author chenzhi
 *
 */
@Service("roleService")
public class RoleServiceImpl implements RoleService {

	/* (non-Javadoc)
	 * @see com.ssm.service.RoleService#findRoleList()
	 */
	@Autowired
	private RoleDao roleDao;
	
	@Override
	public List<Role> findRoleList() {
		// TODO Auto-generated method stub
		List<Role> roleList= roleDao.selectRoleList();
		return roleList;
	}

}
