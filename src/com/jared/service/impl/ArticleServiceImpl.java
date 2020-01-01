package com.jared.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jared.mapper.ArticleMapper;
import com.jared.pojo.Article;
import com.jared.service.ArticleService;

@Service
public class ArticleServiceImpl implements ArticleService{
	@Autowired
	private ArticleMapper articleMapper;

	/**
	 * 	插入一条文章数据
	 * 	@param article - pojo
	 * */
	public void insert(Article article) {
		articleMapper.insert(article);
	}
	/**
	 * 	分页查询文章数据
	 * 	@return List<Article>
	 * */
	public ArrayList<Article> findArticleByPage() {
		
		return articleMapper.findArticleByPage();
	}
	/**
	 *	根据Id查询文章
	 *	@param a_id - Id
	 *	@return Article 
	 * */
	public Article findArticleById(int a_id) {
		return articleMapper.findArticleById(a_id);
	}
	/**
	 * 	获取总的文章数
	 * 	@return int
	 * */
	public int getCount() {
		return articleMapper.getCount();
	}
	@Override
	public ArrayList<Article> findNewByPage(int count, int i) {
		
		return articleMapper.findNewByPage(count,i);
	}
	/**
	 * 	根据文章Id删除文章
	 * 	@param a_id - 文章ID
	 * */
	public void remove(int a_id) {
		articleMapper.remove(a_id);
	}
	/**
	 * 	根据ID修改文章标题和内容
	 * */
	public void save(int a_id,String a_title,String a_article) {
		articleMapper.save(a_id,a_title,a_article);
	}
}
