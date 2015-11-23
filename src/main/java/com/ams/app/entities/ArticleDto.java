package com.ams.app.entities;

import java.sql.Date;

public class ArticleDto {
	
	private String key;
	private int id;
	private String title;
	private int userid;
	private String name;
	private String content;
	private Date pdate;
	private boolean enable;
	private String image;
	private String columnName;
	private int limitRow;
	private int page;
	private String search;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public boolean getEnable() {
		return enable;
	}
	public void setEnable(boolean enable) {
		this.enable = enable;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Article [id=" + id + ", title=" + title + ", userid=" + userid
				+ ", content=" + content + ", pubdaye=" + pdate + ", enable="
				+ enable + ", image=" + image + "]";
	}
	public Date getPdate() {
		return pdate;
	}
	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getColumnName() {
		return columnName;
	}
	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}
	public int getLimitRow() {
		return limitRow;
	}
	public void setLimitRow(int limitRow) {
		this.limitRow = limitRow;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	
}
