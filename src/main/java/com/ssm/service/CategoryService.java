/**
 * 
 */
package com.ssm.service;

import java.util.List;

import com.ssm.po.Category;

/**
 * @author chenzhi
 *
 */
public interface CategoryService {
	public List<Category> findCategoryList();
	public Category findCategoryById(Integer categoryId);
	
	//add category
	int addCategory(Category category);
	//update category
	int updateCategory(Category category);
	//delete category
	int deleteCategory(Integer categoryId);
}
