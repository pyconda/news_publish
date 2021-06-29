/**
 * 
 */
package com.ssm.po;

import java.util.Date;

/**
 * @author chenzhi
 *
 */
public class News {
	private Integer newsId;
	private String title;
	private String contentTitle;
	private String content;
	private String contentAbstract;
	private String keywords;
	private String author;
	private Date publishTime;
	private Integer clicks;
	private String publishStatus;
	private Integer categoryId;
	private String categoryName;
	private Integer userId;
	/**
	 * @return the newsId
	 */
	public Integer getNewsId() {
		return newsId;
	}
	/**
	 * @param newsId the newsId to set
	 */
	public void setNewsId(Integer newsId) {
		this.newsId = newsId;
	}
	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * @return the contentTitle
	 */
	public String getContentTitle() {
		return contentTitle;
	}
	/**
	 * @param contentTitle the contentTitle to set
	 */
	public void setContentTitle(String contentTitle) {
		this.contentTitle = contentTitle;
	}
	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}
	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}
	/**
	 * @return the contentAbstract
	 */
	public String getContentAbstract() {
		return contentAbstract;
	}
	/**
	 * @param contentAbstract the contentAbstract to set
	 */
	public void setContentAbstract(String contentAbstract) {
		this.contentAbstract = contentAbstract;
	}
	/**
	 * @return the keywords
	 */
	public String getKeywords() {
		return keywords;
	}
	/**
	 * @param keywords the keywords to set
	 */
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	/**
	 * @return the author
	 */
	public String getAuthor() {
		return author;
	}
	/**
	 * @param author the author to set
	 */
	public void setAuthor(String author) {
		this.author = author;
	}
	/**
	 * @return the publishTime
	 */
	public Date getPublishTime() {
		return publishTime;
	}
	/**
	 * @param publishTime the publishTime to set
	 */
	public void setPublishTime(Date publishTime) {
		this.publishTime = publishTime;
	}
	/**
	 * @return the clicks
	 */
	public Integer getClicks() {
		return clicks;
	}
	/**
	 * @param clicks the clicks to set
	 */
	public void setClicks(Integer clicks) {
		this.clicks = clicks;
	}
	/**
	 * @return the publishStatus
	 */
	public String getPublishStatus() {
		return publishStatus;
	}
	/**
	 * @param publishStatus the publishStatus to set
	 */
	public void setPublishStatus(String publishStatus) {
		this.publishStatus = publishStatus;
	}
	/**
	 * @return the categoryId
	 */
	public Integer getCategoryId() {
		return categoryId;
	}
	/**
	 * @param categoryId the categoryId to set
	 */
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	/**
	 * @return the categoryName
	 */
	public String getCategoryName() {
		return categoryName;
	}
	/**
	 * @param categoryName the categoryName to set
	 */
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	/**
	 * @return the userId
	 */
	public Integer getUserId() {
		return userId;
	}
	/**
	 * @param userId the userId to set
	 */
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
	
}
