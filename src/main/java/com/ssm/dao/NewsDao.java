/**
 * 
 */
package com.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssm.po.News;

/**
 * @author chenzhi
 *
 */
public interface NewsDao {
	//get news count at one category
	int getNewsCount(@Param("keywords") String keywords,
					@Param("newsListCategoryId") Integer newsListCategoryId);
	//get news list at one category
	List<News> findNewsList(@Param("keywords") String keywords,
					@Param("newsListCategoryId") Integer newsListCategoryId,
					@Param("startRows") Integer startRows,
					@Param("pageSize") Integer pageSize	);
	//get news by id
	News getNewsByNewsId(Integer newsId);
	//add news
	int addNews(News news);
	//update news
	int updateNews(News news);
	//set status
	int setNewsPublishStatus(News news);
	//delete news
	int deleteNews(Integer newsId);
}
