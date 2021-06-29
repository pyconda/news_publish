/**
 * 
 */
package com.ssm.service;

import com.ssm.po.News;
import com.ssm.po.PageBean;

/**
 * @author chenzhi
 *
 */
public interface NewsService {
	PageBean<News> findNewsByPage(String keywords,Integer newsListCategoryId,
				Integer currentPage,Integer pageSize);
	News getNewsByNewsId(Integer newsId);
	int setNewsPublishStatus(News news);
	int addNews(News news);
	int editNews(News news);
	int deleteNews(Integer newsId);
}
