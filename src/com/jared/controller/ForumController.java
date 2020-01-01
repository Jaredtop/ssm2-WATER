package com.jared.controller;

import java.text.Normalizer.Form;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jared.pojo.Article;
import com.jared.pojo.Comment;
import com.jared.pojo.Forum;
import com.jared.service.CommentService;
import com.jared.service.ForumService;
import com.jared.util.DateString;

@Controller
@RequestMapping("/forum")
public class ForumController {
	@Autowired
	private ForumService forumService;
	@Autowired
	private CommentService commentService;
	@RequestMapping("/toforum")
	public String toforum(
			@RequestParam(value="pageN",defaultValue="1",required=false)int pageN,
			@RequestParam(value="pageSize",defaultValue="5",required=false)int pageSize,
			Model model) {
		ArrayList<Forum> list;
		PageHelper.startPage(pageN, pageSize);
		list=forumService.findForumByPage();
		Collections.reverse(list);
		PageInfo<Forum> pageInfo=new PageInfo<Forum>(list);//封装分页
		model.addAttribute("pages",pageInfo);
		return "pages/front/forum";
	}
	
	@RequestMapping("/toForumManager")
	public String toForumManager() {
		
		return "redirect:findForumByPage";
	}
	@RequestMapping("/findForumByPage")
	public String findForumByPage(
			@RequestParam(value="pageN",defaultValue="1",required=false)int pageN,
			@RequestParam(value="pageSize",defaultValue="5",required=false)int pageSize,
			Model model) {
		ArrayList<Forum> list;
		PageHelper.startPage(pageN,pageSize);
		list=forumService.findForumByPage();
		PageInfo<Forum> pageInfo=new PageInfo<Forum>(list);
		model.addAttribute("pages",pageInfo);
		return "pages/forum/forumManager";
	}
	@RequestMapping("/toInsertForum")
	public String toInsertForum() {
		return "pages/forum/insertForum";
	}
	@RequestMapping("/insert")
	public String insert(Forum forum) {
		forum.setF_createtime(DateString.getdate());
		forum.setF_status(1);
		forumService.insert(forum);
		return "redirect:findForumByPage";
	}
	@RequestMapping("/update")
	public String update(
			@RequestParam("f_id") int f_id,
			@RequestParam("f_title") String f_title) {
		forumService.update(f_id,f_title);
		return "redirect:findForumByPage";
	}
	@RequestMapping("/toEditforum")
	public String toEditforum(
			@RequestParam("f_id")int f_id,
			Model model) {
		Forum forum=forumService.findForumById(f_id);
		model.addAttribute("forum",forum);
		return "pages/forum/editForum";
	}
	@RequestMapping("/toViewforum")
	public String toViewforum(
			@RequestParam("f_id")int f_id,
			Model model) {
		Forum forum=forumService.findForumById(f_id);
		model.addAttribute("forum",forum);
		List<Comment> comments=commentService.findCommentById(1, f_id);
		model.addAttribute("comments",comments);
		return "pages/forum/viewForum";
	}
	
	@RequestMapping("/removeForum")
	public String removeForum(@RequestParam("f_id")int f_id) {
		System.out.println("log - 要删除的话题Id："+f_id);
		forumService.remove(f_id);
		return "redirect:findForumByPage";
	}
	@RequestMapping("/removeMoreForum")
	public String removeMoreForum(@RequestParam("f_id")String f_id) {
		System.out.println("log - 要删除的话题Id："+f_id);
		List<Integer> list=JSONArray.parseArray(f_id, Integer.class);
		for(int i:list) {
			forumService.remove(i);
		}
		return "redirect:findForumByPage";
	}
}
