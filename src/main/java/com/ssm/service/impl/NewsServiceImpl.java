/**
 * 
 */
package com.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.dao.NewsDao;
import com.ssm.po.News;
import com.ssm.po.PageBean;
import com.ssm.service.NewsService;

/**
 * @author chenzhi
 *
 */
@Service("newsService")
public class NewsServiceImpl implements NewsService {

	/* (non-Javadoc)
	 * @see com.ssm.service.NewsService#findNewsByPage(java.lang.String, java.lang.Integer, java.lang.Integer, java.lang.Integer)
	 */
	@Autowired
	public NewsDao newsDao;
	@Override
	public PageBean<News> findNewsByPage(String keywords, Integer newsListCategoryId, Integer currentPage,
			Integer pageSize) {
		// TODO Auto-generated method stub
		int count=newsDao.getNewsCount(keywords, newsListCategoryId);
		int totalPage=(int) Math.ceil(count*1.0/pageSize);
		List<News> newsList=
				newsDao.findNewsList(keywords, newsListCategoryId, (currentPage-1)*pageSize, pageSize);
		PageBean<News> pb=new PageBean<>();
		pb.setCount(count);
		if(currentPage==0)currentPage=1;
		pb.setCurrentPage(currentPage);
		pb.setList(newsList);
		pb.setPageSize(pageSize);
		pb.setTotalPage(totalPage);
		return pb;
	}

	/* (non-Javadoc)
	 * @see com.ssm.service.NewsService#getNewsByNewsId(java.lang.Integer)
	 */
	@Override
	public News getNewsByNewsId(Integer newsId) {
		// TODO Auto-generated method stub
		return newsDao.getNewsByNewsId(newsId);
	}

	/* (non-Javadoc)
	 * @see com.ssm.service.NewsService#setNewsPublishStatus(com.ssm.po.News)
	 */
	@Override
	public int setNewsPublishStatus(News news) {
		// TODO Auto-generated method stub
		return newsDao.setNewsPublishStatus(news);
	}

	/* (non-Javadoc)
	 * @see com.ssm.service.NewsService#addNews(com.ssm.po.News)
	 */
	@Override
	public int addNews(News news) {
		// TODO Auto-generated method stub
		return newsDao.addNews(news);
	}

	/* (non-Javadoc)
	 * @see com.ssm.service.NewsService#editNews(com.ssm.po.News)
	 */
	@Override
	public int editNews(News news) {
		// TODO Auto-generated method stub
		return newsDao.updateNews(news);
	}

	/* (non-Javadoc)
	 * @see com.ssm.service.NewsService#deleteNews(java.lang.Integer)
	 */
	@Override
	public int deleteNews(Integer newsId) {
		// TODO Auto-generated method stub
		return newsDao.deleteNews(newsId);
	}

}
