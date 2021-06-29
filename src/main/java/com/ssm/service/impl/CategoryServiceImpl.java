/**
 * 
 */
package com.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.dao.CategoryDao;
import com.ssm.po.Category;
import com.ssm.service.CategoryService;

/**
 * @author chenzhi
 *
 */
@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {

	/* (non-Javadoc)
	 * @see com.ssm.service.CategoryService#findCategoryList()
	 */
	@Autowired
	public CategoryDao  categoryDao;
	@Override
	public List<Category> findCategoryList() {
		// TODO Auto-generated method stub
		return this.categoryDao.selectCategoryList();
	}

	/* (non-Javadoc)
	 * @see com.ssm.service.CategoryService#findCategoryById(java.lang.Integer)
	 */
	@Override
	public Category findCategoryById(Integer categoryId) {
		// TODO Auto-generated method stub
		return this.categoryDao.getCategoryById(categoryId);
	}

	/* (non-Javadoc)
	 * @see com.ssm.service.CategoryService#addCategory(com.ssm.po.Category)
	 */
	@Override
	public int addCategory(Category category) {
		// TODO Auto-generated method stub
		return categoryDao.addCategory(category);
	}

	/* (non-Javadoc)
	 * @see com.ssm.service.CategoryService#updateCategory(com.ssm.po.Category)
	 */
	@Override
	public int updateCategory(Category category) {
		// TODO Auto-generated method stub
		return categoryDao.updateCategory(category);
	}

	/* (non-Javadoc)
	 * @see com.ssm.service.CategoryService#deleteNews(java.lang.Integer)
	 */
	@Override
	public int deleteCategory(Integer categoryId) {
		// TODO Auto-generated method stub
		return categoryDao.deleteCategory(categoryId);
	}

}
