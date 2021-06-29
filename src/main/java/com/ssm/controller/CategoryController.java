/**
 * 
 */
package com.ssm.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssm.po.Category;
import com.ssm.po.News;
import com.ssm.po.PageBean;
import com.ssm.po.Role;
import com.ssm.service.CategoryService;

/**
 * @author chenzhi
 *
 */
@Controller
public class CategoryController {
	@Autowired
	public CategoryService categoryService;

	// findCategory
	@RequestMapping(value = "/getCategoryList.action")
	public String getCategoryList(@RequestParam(defaultValue = "1") Integer currentPage,
			@RequestParam(defaultValue = "10") Integer pageSize, Model model) {
		List<Category> categoryList = categoryService.findCategoryList();
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("pageSize", pageSize);
		return "category/category_list";
	}

	// to addCategory
	@RequestMapping(value = "/toAddCategory.action")
	public String toAddCategory(Model model) {
		List<Category> categoryList = categoryService.findCategoryList();
		model.addAttribute("categoryList", categoryList);
		return "category/add_category";
	}

	// add
	@RequestMapping(value = "/addCategory.action", method = RequestMethod.POST)
	public String addCategory(Category category, Model model) {

		int rows = categoryService.addCategory(category);

		if (rows > 0) {
			return "redirect:getCategoryList.action";
		} else {
			return "news/add_category";
		}
	}

	// edit
	@RequestMapping(value = "/editCategory.action", method = RequestMethod.POST)
	public String editCategory(Category category, Model model) {

		int rows = categoryService.updateCategory(category);
		if (rows > 0) {
			return "redirect:getCategoryList.action";
		} else {

			return "news/edit_category";
		}

	}

	// to edit page
	@RequestMapping(value = "/toEditCategory.action")
	public String toEditCategory(Integer categoryId, Model model) {
		Category category = categoryService.findCategoryById(categoryId);
		if (category != null) {
			model.addAttribute("category", category);
			List<Category> categoryList = categoryService.findCategoryList();
			model.addAttribute("categoryList", categoryList);
		}
		return "news/edit_category";
	}

	// delete
	@RequestMapping(value = "/deleteCategory.action")
	@ResponseBody
	public Category deleteCategory(@RequestBody Category category, Model model) {
		int rows = categoryService.deleteCategory(category.getCategoryId());
		if (rows > 0) {
			return category;
		} else {
			return category;
		}
	}

}
