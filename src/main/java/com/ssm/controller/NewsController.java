/**
 * 
 */
package com.ssm.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.ssm.service.CategoryService;
import com.ssm.service.NewsService;

/**
 * @author chenzhi
 *
 */
@Controller
public class NewsController {
	@Autowired
	private NewsService newsService;
	@Autowired
	private CategoryService categoryService;
	//find page
	@RequestMapping(value="/findNewsByPage.action")
	public String findNewsByPage(String keywords,Integer newsListCategoryId,
								@RequestParam(defaultValue="1") Integer currentPage,
								@RequestParam(defaultValue="8") Integer pageSize,
								Model model	){
	List<Category> categoryList = categoryService.findCategoryList();
	model.addAttribute("categoryList",categoryList);
	
	PageBean<News> pb=newsService.findNewsByPage(keywords, newsListCategoryId, currentPage, pageSize);
	
	model.addAttribute("pb",pb);
	model.addAttribute("keywords",keywords);
	model.addAttribute("newsListCategoryId",newsListCategoryId);
	model.addAttribute("currentPage",currentPage);
	model.addAttribute("pageSize",pageSize);
	return "news/news_list";
	}
	//set status
	@RequestMapping(value="/setNewsPublishStatus.action")
	@ResponseBody
	public News setNewsPublishStatus(@RequestBody News news,Model model){
		int rows = newsService.setNewsPublishStatus(news);
		if(rows>0){
			return news;
		}else{
			news.setNewsId(0);
			return news;
		}
	}
	//to add
	@RequestMapping(value="/toAddNews.action")
	public String toAddNews(Model model){
		List<Category> categoryList = categoryService.findCategoryList();
		model.addAttribute("categoryList",categoryList);
		return "news/add_news";
	}
	//add
	@RequestMapping(value="/addNews.action",method=RequestMethod.POST)
	public String addNews(News news,Model model){
		Date date = new Date();
		news.setPublishTime(date);
		news.setPublishStatus("1");
		int rows = newsService.addNews(news);
		
		if(rows>0){
			return "redirect:findNewsByPage.action";
		}else{
			List<Category> categoryList=categoryService.findCategoryList();
			model.addAttribute("categoryList",categoryList);
			model.addAttribute("news",news);
			return "news/add_news";
		}
	}
	//edit
	@RequestMapping(value="editNews.action",method=RequestMethod.POST)
	public String editNews(News news,Model model){
		Date date = new Date();
		news.setPublishTime(date);
		news.setPublishStatus("1");
		int rows=newsService.editNews(news);
		if(rows>0){
			return "redirect:findNewsByPage.action";
		}else{
			List<Category> categoryList = categoryService.findCategoryList();
			model.addAttribute("categoryList",categoryList);
			model.addAttribute("news",news);
			return "news/edit_news";
		}
				
	}
	//to edit page
	@RequestMapping(value="/toEditNews.action")
	public String toEditNews(Integer newsId,Model model){
		News news = newsService.getNewsByNewsId(newsId);
		if(news!=null){
			model.addAttribute("news",news);
			List<Category> categoryList=categoryService.findCategoryList();
			model.addAttribute("categoryList",categoryList);
		}
		return "news/edit_news";
	}
	//delete 
	@RequestMapping(value="/deleteNews.action")
	@ResponseBody
	public News deleteNews(@RequestBody News news,Model model){
		int rows=newsService.deleteNews(news.getNewsId());
		if(rows>0){
			return news;
		}else{
			news.setNewsId(0);
			return news;
		}
	}
	//page by categoryId
	@RequestMapping(value="/index.action")
	public String index(HttpServletRequest request,HttpServletResponse response,
			String keywords,Integer newsListCategoryId,
			@RequestParam(defaultValue="1") Integer currentPage,
			@RequestParam(defaultValue="10") Integer pageSize,
			Model model	) throws ServletException,IOException{
		PageBean<News> pb1=newsService.findNewsByPage(keywords, 1, currentPage, pageSize);
		model.addAttribute("pb1",pb1);
		PageBean<News> pb2=newsService.findNewsByPage(keywords, 2, currentPage, pageSize);
		model.addAttribute("pb2",pb2);
		return "../../first";
	}
	//page by categoryId
	@RequestMapping(value="/findNewsByCategoryIdPage.action")
	public String findNewsByCategoryIdPage(HttpServletRequest request,
			HttpServletResponse response,
			String keywords,
			Integer newsListCategoryId,
			@RequestParam(defaultValue="1") Integer currentPage,
			@RequestParam(defaultValue="1") Integer pageSize,
			Model model	){
		Category category=categoryService.findCategoryById(newsListCategoryId);
		model.addAttribute("category",category);
		
		PageBean<News> pb=newsService.findNewsByPage(keywords, newsListCategoryId, currentPage, pageSize);
		model.addAttribute("pb",pb);
		model.addAttribute("newsListCategoryId",newsListCategoryId);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("pageSize",pageSize);
		return "../../list";
	}
	//find page --front
	@RequestMapping(value="/findFrontNewsByNewsId.action")
	public String findFrontNewsByNewsId(Integer newsId,Model model){
		News news=newsService.getNewsByNewsId(newsId);
		if(news!=null){
			model.addAttribute("news",news);
		}
		return "../../detail";
	}
}
