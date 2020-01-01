package com.jared.service;

import java.util.ArrayList;

import com.github.pagehelper.PageInfo;
import com.jared.pojo.Article;

public interface ArticleService {

	void insert(Article article);
	ArrayList<Article> findArticleByPage();
	Article findArticleById(int a_id);
	int getCount();
	ArrayList<Article> findNewByPage(int count, int i);
	void remove(int a_id);
	void save(int a_id,String a_title,String a_article);


}
