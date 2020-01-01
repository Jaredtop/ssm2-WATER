package com.jared.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jared.pojo.Article;
import com.jared.pojo.Comment;
import com.jared.service.ArticleService;
import com.jared.service.CommentService;
import com.jared.service.ForumService;
import com.jared.util.DateString;

@Controller
@RequestMapping("/article")
public class ArticleController {
	@Autowired
	private ArticleService articleService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private ForumService forumService;
	@RequestMapping("/toArticleManager")
	public String toArticleManager() {
		
		return "redirect:findArticleByPage";
	}
	@RequestMapping("/insertArticle")
	public String toInsertArticle() {
		return "pages/article/insertArticle";
	}
	@RequestMapping("/toViewArticle")
	public String toViewArticle(
			@RequestParam("a_id")int a_id,
			Model model) {
		Article article=articleService.findArticleById(a_id);
		
		List<Comment> list=commentService.findCommentById(0,a_id);
		Collections.reverse(list);
		model.addAttribute("comments",list);
		if(article!=null) {
			model.addAttribute("article",article);
			return "pages/article/viewArticle";
		}
		return null;
	}
	@RequestMapping("/toEditArticle")
	public String toEditArticle(@RequestParam("a_id")int a_id,
			Model model) {
		Article article=articleService.findArticleById(a_id);
		if(article!=null) {
			model.addAttribute("article",article);
			return "pages/article/editArticle";
		}
		return null;
	}
	@RequestMapping("/findArticleByPage")
	public String findArticleByPage(
			@RequestParam(value="pageN",defaultValue="1",required=false)int pageN,
			@RequestParam(value="pageSize",defaultValue="3",required=false)int pageSize,
			Model model) {
		ArrayList<Article> list;
		PageHelper.startPage(pageN, pageSize);
		list=articleService.findArticleByPage();
		PageInfo<Article> pageInfo=new PageInfo<Article>(list);//封装分页
		model.addAttribute("pages",pageInfo);
		return "pages/article/articleManager";
	}
	
	@RequestMapping("/insert")
	public String insert(Article article) {
		System.out.println(article.toString());
		article.setA_lasttime(DateString.getdate());
		articleService.insert(article);
		return "redirect:findArticleByPage";
	}
	@RequestMapping("/remove")
	public String remove(@RequestParam("a_id")int a_id) {
		System.out.println("log - 要删除的文章Id："+a_id);
		articleService.remove(a_id);
		commentService.removeArticle(a_id);
		return "redirect:findArticleByPage";
	}
	@RequestMapping("/removeMore")
	public String removeMore(@RequestParam("a_id")String a_id) {
		System.out.println("log - 要删除的文章ID："+a_id);
		List<Integer> list=JSONArray.parseArray(a_id, Integer.class);
		if(list.size()!=0) {
			for(Integer i:list) {
				articleService.remove(i);
				commentService.removeArticle(i);
			}
		}
		return "redirect:findArticleByPage";
	}
	@RequestMapping("/save")
	public String save(
			@RequestParam("a_id")int a_id,
			@RequestParam("a_title")String a_title,
			@RequestParam("a_article")String a_article
			) {
		System.out.println(a_article);
		System.out.println(a_id);
		System.out.println(a_title);
		articleService.save(a_id,a_title,a_article);
		
		return "redirect:findArticleByPage";
	}
	/*归档*/
	@RequestMapping("/archives")
	public String toArchives(
			@RequestParam(value="pageN",defaultValue="1",required=false)int pageN,
			@RequestParam(value="pageSize",defaultValue="10",required=false)int pageSize,
			Model model) {
		ArrayList<Article> list;
		PageHelper.startPage(pageN, pageSize);
		list=articleService.findArticleByPage();
		Collections.reverse(list);
		PageInfo<Article> pageInfo=new PageInfo<Article>(list);//封装分页
		model.addAttribute("pages",pageInfo);
		return "pages/front/Archives";
	}
	//评论表
	@RequestMapping("/toCommentManager")
	public String toCommentManager() {
		return "redirect:findCommentByPage";
	}
	@RequestMapping("/findCommentByPage")
	public String findCommentByPage(
			@RequestParam(value="pageN",defaultValue="1",required=false)int pageN,
			@RequestParam(value="pageSize",defaultValue="5",required=false)int pageSize,
			Model model) {
		ArrayList<Comment> list;
		PageHelper.startPage(pageN, pageSize);
		list=commentService.findCommentByPage();
		PageInfo<Comment> pageInfo=new PageInfo<Comment>(list);//封装分页
		model.addAttribute("pages",pageInfo);
		return "pages/article/commentManager";
	}
	@RequestMapping("insertComment")
	public String insertComment(Comment comment) {
		comment.setC_status(1);
		comment.setC_createtime(DateString.getdate());
		if(comment.getC_type()==1) {
			forumService.addF_comment(comment.getA_id());
		}
		commentService.insert(comment);
		System.out.println(comment.toString());
		if(comment.getC_type()==1) {
			return "redirect:/forum/toViewforum?f_id="+comment.getA_id();
		}
		return "forward:toViewArticle?a_id="+comment.getA_id();
	}
	@RequestMapping("/setCommentStatus")
	public String setCommentStatus(
			@RequestParam("c_id")int c_id,
			@RequestParam("c_status")int c_status
			) {
		commentService.setCommentStatus(c_id,c_status);
		return "redirect:findCommentByPage";
	}
	
	@RequestMapping("/removeComment")
	public String removeComment(@RequestParam("c_id")int c_id) {
		System.out.println("log - 要删除的评论Id："+c_id);
		Comment comment=commentService.getComentById(c_id);
		if(comment.getC_type()==1) {
			forumService.delF_comment(comment.getA_id());
		}
		commentService.remove(c_id);
		return "redirect:findCommentByPage";
	}
	@RequestMapping("/removeMoreComment")
	public String removeMoreComment(@RequestParam("c_id")String c_id) {
		System.out.println("log - 要删除的评论ID："+c_id);
		List<Integer> list=JSONArray.parseArray(c_id, Integer.class);
		if(list.size()!=0) {
			for(Integer i:list) {
				Comment comment=commentService.getComentById(i);
				if(comment.getC_type()==1) {
					forumService.delF_comment(comment.getA_id());
				}
				commentService.remove(i);
			}
		}
		return "redirect:findCommentByPage";
	}
}
