/**
 * 
 */
package com.ssm.dao;

import java.util.List;

import com.ssm.po.Category;
import com.ssm.po.News;

/**
 * @author chenzhi
 *
 */
public interface CategoryDao {
	public List<Category> selectCategoryList();
	public Category getCategoryById(Integer categoryId);
	
		//add category
		int addCategory(Category category);
		//update category
		int updateCategory(Category category);
		//delete category
		int deleteCategory(Integer categoryId);
}
