package com.jared.controller;

import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jared.pojo.Article;
import com.jared.pojo.User;
import com.jared.service.ArticleService;

@Controller
@RequestMapping("")
public class PageController {
	@Autowired
	ArticleService articleService;
	@RequestMapping("/index")
	public String index(
			@RequestParam(value="pageN",defaultValue="1",required=false)int pageN,
			@RequestParam(value="pageSize",defaultValue="3",required=false)int pageSize,
			Model model){
		ArrayList<Article> list;
		PageHelper.startPage(pageN, pageSize);
		list=articleService.findArticleByPage();
		PageInfo<Article> pageInfo=new PageInfo<Article>(list);//封装分页
		model.addAttribute("pages",pageInfo);
		int count=articleService.getCount();
		list=articleService.findNewByPage(count-10,10);
		Collections.reverse(list);
		PageInfo<Article> page=new PageInfo<Article>(list);//封装分页
		model.addAttribute("archives",page);
		return "/index";
	}
	@RequestMapping("/login")
	public String login(){
		return "/pages/front/login";
	}
	
	@RequestMapping("/about")
	public String about(){
		return "/pages/front/about";
	}
	@RequestMapping("/admin")
	public String admin(HttpSession session){
		User user=(User)session.getAttribute("user");
		if(user==null) {
			System.out.println("error log:强制进制后台！");
			return "redirect:/index";
		}
		return "/pages/admin/admin";
	}
	
	@RequestMapping("/user/insertUser")
	public String toInsertUser() {
		return "/pages/admin/insertUser";
	}
	@RequestMapping("/archives")
	public String toArchives() {
		return "forward:/article/archives";
	}
	@RequestMapping("/toforum")
	public String toforum() {
		return "forward:/forum/toforum";
	}
	
}
